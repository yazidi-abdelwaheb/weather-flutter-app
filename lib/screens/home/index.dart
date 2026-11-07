import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar.dart';
import 'package:my_app/widgets/drawer.dart';
import 'package:my_app/screens/home/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({super.key});

  @override
  State<HomeIndex> createState() => _HomeState();
}

class _HomeState extends State<HomeIndex> {
  late SharedPreferences _preferences;

  int selectedIndex = 0;

  Future<void> handelSignOut(BuildContext context) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setBool('isAuthenticated', false);
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/sign-in",
      (route) => false,
    );
  }

  void navigateToPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: pages[selectedIndex].title),
      drawer: CustomDrawer(
        pages: pages,
        selectedIndex: selectedIndex,
        onItemSelected: navigateToPage,
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
