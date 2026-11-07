import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/screens/home/index.dart';
import 'package:my_app/screens/home/screens/contact.dart';
import 'package:my_app/screens/home/screens/country.dart';
import 'package:my_app/screens/home/screens/gallery.dart';
import 'package:my_app/screens/home/screens/home.dart';
import 'package:my_app/screens/home/screens/setting.dart';
import 'package:my_app/screens/home/screens/weather.dart';
import 'package:my_app/screens/signin.dart';
import 'package:my_app/screens/signup.dart';

Map<String, WidgetBuilder> routes = {
  '/sign-in': (context) => Signin(),
  '/sign-up': (context) => Signup(),
  '/home': (context) => const HomeIndex(),
  
};

GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/sign-in',
      builder: (BuildContext context, GoRouterState state) => Signin(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (BuildContext context, GoRouterState state) => Signup(),
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeIndex();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
        GoRoute(
          path: '/country',
          builder: (BuildContext context, GoRouterState state) {
            return const Country();
          },
        ),
        GoRoute(
          path: '/gallery',
          builder: (BuildContext context, GoRouterState state) {
            return const Gallery();
          },
        ),
        GoRoute(
          path: '/contact',
          builder: (BuildContext context, GoRouterState state) {
            return const Contact();
          },
        ),
        GoRoute(
          path: '/weather',
          builder: (BuildContext context, GoRouterState state) {
            return const Weather();
          },
        ),
        GoRoute(
          path: '/setting',
          builder: (BuildContext context, GoRouterState state) {
            return const Setting();
          },
        ),
      ],
    ),
  ],
);
