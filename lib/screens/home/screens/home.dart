import 'package:flutter/material.dart';
import 'package:my_app/screens/home/screens/country.dart';
import 'package:my_app/screens/home/screens/weather.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(30),
        children: [
          Container(
            child: TextButton(
                onPressed: () => Home(),
                child: Image(image: AssetImage("assets/home.png"))),
          ),
          Container(
            child: TextButton(
                onPressed: () => Weather(),
                child: Image(image: AssetImage("assets/weather.png"))),
          ),
          Container(
            child: TextButton(
                onPressed: () {},
                child: Image(image: AssetImage("assets/gallery.png"))),
          ),
          Container(
            child: TextButton(
                onPressed: () {},
                child: Image(image: AssetImage("assets/country.png"))),
          ),
          Container(
            child: TextButton(
                onPressed: () {},
                child: Image(image: AssetImage("assets/setting.png"))),
          ),
          Container(
            child: TextButton(
                onPressed: () {},
                child: Image(image: AssetImage("assets/contact.png"))),
          ),
        ],
      ),
    );
  }
}
