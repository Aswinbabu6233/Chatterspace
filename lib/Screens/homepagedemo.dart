import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/postmodel.dart';
import 'addphoto.dart';
import 'profilepage.dart';

class Homepagedemo extends StatefulWidget {
  const Homepagedemo({super.key});

  @override
  State<Homepagedemo> createState() => _HomepagedemoState();
}

class _HomepagedemoState extends State<Homepagedemo> {
  List<Data> postdata = [
    Data(
      name: "Amalraj",
      postimg: "assets/images/feed5.jpeg",
      profileimage: "assets/images/profile1.jpeg",
      username: "@amalraj001",
    ),
    Data(
      name: "Ramesh",
      postimg: "assets/images/feed4.jpeg",
      profileimage: "assets/images/profile2.jpeg",
      username: "@ramesh02",
    ),
    Data(
      name: "Vimal",
      postimg: "assets/images/feed3.jpeg",
      profileimage: "assets/images/profile3.jpeg",
      username: "@vimal201",
    ),
    Data(
      name: "Anjali",
      postimg: "assets/images/feed2.jpeg",
      profileimage: "assets/images/profile4.jpeg",
      username: "@anjali221",
    ),
    Data(
      name: "Renjith",
      postimg: "assets/images/feed1.jpeg",
      profileimage: "assets/images/profile5.jpeg",
      username: "@renjith234",
    ),
    Data(
      name: "Abhirami",
      postimg: "assets/images/feed.jpeg",
      profileimage: "assets/images/profile6.jpeg",
      username: "@abhirami345",
    ),
    Data(
      name: "Robert",
      postimg: "assets/images/feed5.jpeg",
      profileimage: "assets/images/profile7.jpeg",
      username: "@robert234",
    ),
    Data(
      name: "Jiji",
      postimg: "assets/images/feed4.jpeg",
      profileimage: "assets/images/profile8.jpeg",
      username: "@jiji673",
    ),
    Data(
      name: "Ridhunandha",
      postimg: "assets/images/feed3.jpeg",
      profileimage: "assets/images/profile9.jpeg",
      username: "@ridhunandha1324",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/chatterspace-removebg-preview.png",
                height: 100,
                width: 250,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return PostUploadPage();
                        },
                      ));
                    },
                    child: Icon(
                      CupertinoIcons.add_circled,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Profilepage();
                              },
                            ));
                          },
                          child: Image.asset(
                            "assets/images/profile.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: postdata.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("${postdata[index].profileimage}"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${postdata[index].name}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${postdata[index].username}",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onDoubleTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${postdata[index].postimg}"),
                                      fit: BoxFit.cover)),
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.80,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                CupertinoIcons.star,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "32",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                CupertinoIcons.chat_bubble_text,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "32",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.share_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "32",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 20),
                            child: ExpandableText(
                              "uygebweifghwekfbnwefhwekfnbwfhgweifqdgqwdgqwgdqwgyduygwdugqwdgqwdugqwduygqwduygqwduygqwduygqwduygqwduygqwdugqwdugqwdugqwdugqwdugqwduygqwduygqwduygqwdugqwduygqwdugqwudygqwudygqwduygqwdugqdwuygqwduygqwdgqwnbwekfbhgweiufghwebfweifgbwefbwefbwiebfw",
                              style: GoogleFonts.sansita(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                              expandText: "more",
                              collapseText: "less",
                              expandOnTextTap: true,
                              collapseOnTextTap: true,
                              maxLines: 2,
                              linkColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ))
        ],
      ),
    ));
  }
}
