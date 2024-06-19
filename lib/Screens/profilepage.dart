import 'package:chatterspace/Auth/firebasefunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Auth/loginpage.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  var postdata = [
    {"Post_img": "assets/images/feed.jpeg"},
    {"Post_img": "assets/images/feed1.jpeg"},
    {"Post_img": "assets/images/feed2.jpeg"},
    {"Post_img": "assets/images/feed3.jpeg"},
    {"Post_img": "assets/images/feed4.jpeg"},
    {"Post_img": "assets/images/feed5.jpeg"},
    {"Post_img": "assets/images/feed.jpeg"},
    {"Post_img": "assets/images/feed1.jpeg"},
    {"Post_img": "assets/images/feed2.jpeg"},
    {"Post_img": "assets/images/feed3.jpeg"},
    {"Post_img": "assets/images/feed4.jpeg"},
    {"Post_img": "assets/images/feed5.jpeg"},
    {"Post_img": "assets/images/feed.jpeg"},
    {"Post_img": "assets/images/feed1.jpeg"},
    {"Post_img": "assets/images/feed2.jpeg"},
    {"Post_img": "assets/images/feed3.jpeg"},
    {"Post_img": "assets/images/feed4.jpeg"},
    {"Post_img": "assets/images/feed5.jpeg"},
    {"Post_img": "assets/images/feed.jpeg"},
    {"Post_img": "assets/images/feed1.jpeg"},
    {"Post_img": "assets/images/feed2.jpeg"},
    {"Post_img": "assets/images/feed3.jpeg"},
    {"Post_img": "assets/images/feed4.jpeg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alberto",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          "@alberto2210",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      return showAlert(context);
                    },
                    child: Icon(
                      CupertinoIcons.chevron_down,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await AuthService().signout(context: context);
                    },
                    child: Icon(
                      Icons.power_settings_new_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          "assets/images/profile.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "21",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Post",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "123",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Followers",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "121",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Following",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "P O S T",
            style: GoogleFonts.chakraPetch(color: Colors.white, fontSize: 15),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            itemCount: postdata.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 9, mainAxisSpacing: 9),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("${postdata[index]["Post_img"]}"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.3,
              );
            },
          ),
        ))
      ],
    )));
  }

  showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white70,
            title: Text(
              "Edit Name & Username",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              Column(
                children: [
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Name")),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Username")),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Update",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ))
                    ],
                  )
                ],
              )
            ],
          );
        });
  }
}
