import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar.dart';
import 'package:my_app/widgets/btn.dart';
import 'package:my_app/widgets/snackBar.dart';
import 'package:my_app/widgets/txt-input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatelessWidget {
  late SharedPreferences _preferences;

  final TextEditingController inputUsername = TextEditingController();
  final TextEditingController inputPassword = TextEditingController();
  final TextEditingController inputFirstName = TextEditingController();
  final TextEditingController inputLastName = TextEditingController();

  Signup({super.key});

  Future<void> handelPress(BuildContext context) async {
    _preferences = await SharedPreferences.getInstance();

    final firstName = inputFirstName.text;
    final lastName = inputLastName.text;
    final username = inputUsername.text;
    final password = inputPassword.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        username.isEmpty ||
        password.isEmpty) {
      customSnackBar(context, "All fields are required!");
    } else {
      _preferences.setString("firstName", firstName);
      _preferences.setString("lastName", lastName);
      _preferences.setString("username", username);
      _preferences.setString("password", password);
      Navigator.pop(context);
      Navigator.pushNamed(context, "/sign-in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Sign Up"),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign Up to Create an new account.'),
              const SizedBox(height: 50),
              CustomTxtInput(
                label: "First Name",
                controller: inputFirstName,
              ),
              const SizedBox(height: 20),
              CustomTxtInput(
                label: "Last Name",
                controller: inputLastName,
              ),
              const SizedBox(height: 20),
              CustomTxtInput(
                label: "Username",
                controller: inputUsername,
              ),
              const SizedBox(height: 20),
              CustomTxtInput(
                label: "Password",
                controller: inputPassword,
              ),
              const SizedBox(height: 30),
              CustomBtn(
                  label: 'Sign Up', onPressed: () => handelPress(context)),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("I already have an account."),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/sign-in");
                    },
                    child: const Text(
                      "Sign In?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
