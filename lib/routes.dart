import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/pages/home/index.dart';
import 'package:my_app/pages/home/pages/contact.dart';
import 'package:my_app/pages/home/pages/country.dart';
import 'package:my_app/pages/home/pages/gallery.dart';
import 'package:my_app/pages/home/pages/home.dart';
import 'package:my_app/pages/home/pages/setting.dart';
import 'package:my_app/pages/home/pages/weather.dart';
import 'package:my_app/pages/signin.dart';
import 'package:my_app/pages/signup.dart';

Map<String, WidgetBuilder> routes = {
  '/sign-in': (context) => Signin(),
  '/sign-up': (context) => Signup(),
  '/home': (context) => const HomeIndex(),
  
};

/*GoRouter _router = GoRouter(
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
);*/
