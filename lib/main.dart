import 'package:flutter/material.dart';
import 'package:my_app/screens/home/index.dart';
import 'package:my_app/screens/signin.dart';
import 'package:my_app/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      routerConfig: _router,
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
