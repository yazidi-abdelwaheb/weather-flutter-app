import 'package:flutter/material.dart';
import 'package:my_app/pages/home/pages/Country.dart';
import 'package:my_app/pages/home/pages/Gallery.dart';
import 'package:my_app/screens/home/screens/contact.dart';
import 'package:my_app/screens/home/screens/home.dart';
import 'package:my_app/screens/home/screens/setting.dart';
import 'package:my_app/screens/home/screens/weather.dart';

class PageItem {
  final String title;
  final IconData icon;
  final Widget child;

  const PageItem({
    required this.title,
    required this.icon,
    required this.child,
  });
}

final List<PageItem> pages = [
  PageItem(
    title: "Home",
    icon: Icons.home,
    child: const Home(),
  ),
  PageItem(
    title: "Weather",
    icon: Icons.cloud,
    child: const Weather(),
  ),
  PageItem(
    title: "Gallery",
    icon: Icons.image,
    child: const Gallery(),
  ),
  PageItem(
    title: "Country",
    icon: Icons.public,
    child: const Country(),
  ),
  PageItem(
    title: "Contact",
    icon: Icons.contact_mail,
    child: const Contact(),
  ),
  PageItem(
    title: "Settings",
    icon: Icons.settings,
    child: const Setting(),
  ),
];
