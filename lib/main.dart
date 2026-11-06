import 'package:flutter/material.dart';
import 'package:my_app/pages/home/index.dart';
import 'package:my_app/pages/signin.dart';
import 'package:my_app/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      routes: routes,
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final isAuthenticated =
              snapshot.data?.getBool("isAuthenticated") ?? false;

          if (isAuthenticated == true) {
            return const HomeIndex();
          }

          return Signin();
        },
      ),
    );
  }
}
