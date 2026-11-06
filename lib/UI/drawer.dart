import 'package:flutter/material.dart';
import 'package:my_app/pages/home/menu.dart';

class CustomDrawer extends StatelessWidget {
  final List<PageItem> pages;
  final int selectedIndex;
  final Function(int) onItemSelected;
  final VoidCallback onSignOut;

  const CustomDrawer({
    super.key,
    required this.pages,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.person, size: 50, color: Colors.white),
                SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "User@example.com",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final page = pages[index];

                return ListTile(
                  leading: Icon(page.icon),
                  title: Text(page.title),
                  selected: selectedIndex == index,
                  selectedColor: Colors.blue,
                  onTap: () {
                    onItemSelected(index);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              "Sign Out",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: onSignOut,
          ),
        ],
      ),
    );
  }
}
