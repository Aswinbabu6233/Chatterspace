import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'chatpage.dart';
import 'homepagedemo.dart';
import 'searchpage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int index = 0;
  List<Widget> Screens = [
    Homepagedemo(),
    Searchpage(),
    Chatpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.transparent,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          padding: EdgeInsets.all(16),
          gap: 10,
          onTabChange: (tappedindex) {
            setState(() {
              index = tappedindex;
            });
          },
          tabs: [
            GButton(
              icon: CupertinoIcons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: CupertinoIcons.chat_bubble_text_fill,
              text: "Chat",
            ),
          ]),
      body: Screens[index],
    );
  }
}
