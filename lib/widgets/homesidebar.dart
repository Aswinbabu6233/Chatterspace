import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homesidebar extends StatelessWidget {
  const Homesidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _sidebaritem("like", "110"),
          _sidebaritem("comment", "100"),
          _sidebaritem("share", "Share")
        ],
      ),
    );
  }

  _sidebaritem(String iconname, String label) {
    return Column(
      children: [
        Image.asset(
          "assets/images/$iconname.png",
          color: Colors.white,
          height: 38,
          width: 38,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: GoogleFonts.sansita(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}
