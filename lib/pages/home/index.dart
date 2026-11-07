import 'package:flutter/material.dart';
import 'package:my_app/UI/appbar.dart';
import 'package:my_app/UI/drawer.dart';
import 'package:my_app/pages/home/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({super.key});

  @override
  State<HomeIndex> createState() => _HomeState();
}

class _HomeState extends State<HomeIndex> {
  late SharedPreferences _preferences;

  Future<void> handelSignOut(BuildContext context) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setBool('isAuthenticated', false);
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/sign-in",
      (route) => false,
    );
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: pages[selectedIndex].title),
      drawer: CustomDrawer(
        pages: pages,
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        onSignOut: () => handelSignOut(context),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages
            .map<Widget>(
              (page) => page.child as Widget,
            )
            .toList(),
      ),
    );
  }
}
