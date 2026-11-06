import 'package:flutter/material.dart';
import 'package:my_app/pages/home/index.dart';
import 'package:my_app/pages/signin.dart';
import 'package:my_app/pages/signup.dart';


Map<String, WidgetBuilder> routes = {
  '/home': (context) => const HomeIndex(),
  '/sign-in': (context) => Signin(),
  '/sign-up': (context) => Signup(),
};