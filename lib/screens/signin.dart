import 'package:flutter/material.dart';
import 'package:my_app/UI/appbar.dart';
import 'package:my_app/UI/btn.dart';
import 'package:my_app/UI/snackBar.dart';
import 'package:my_app/UI/txt-input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatelessWidget {
  late SharedPreferences _preferences;

  final TextEditingController inputUsername = TextEditingController();
  final TextEditingController inputPassword = TextEditingController();

  Signin({
    super.key,
  });

  Future<void> handelPress(BuildContext context) async {
    _preferences = await SharedPreferences.getInstance();

    final username = inputUsername.text;
    final password = inputPassword.text;

    final savedUsername = _preferences.getString("username");
    final savedPassword = _preferences.getString("password");

    if (username.isEmpty || password.isEmpty) {
      customSnackBar(context, "All fields are required!");
    } else if (username != savedUsername || password != savedPassword) {
      customSnackBar(context, "Incorrect username or password!");
    } else {
      _preferences.setBool("isAuthenticated", true);
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/home",
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Sign In"),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign in to access your account.'),
              const SizedBox(height: 50),
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
                label: 'Sign In',
                onPressed: () => handelPress(context),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("I don't have an account."),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/sign-up");
                    },
                    child: const Text(
                      "Create a new account?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
