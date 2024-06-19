import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/postmodel.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  List<Data> Searchdata = [
    Data(
      name: "Amalraj",
      profileimage: "assets/images/profile1.jpeg",
      username: "@amalraj001",
    ),
    Data(
      name: "Ramesh",
      profileimage: "assets/images/profile2.jpeg",
      username: "@ramesh02",
    ),
    Data(
      name: "Vimal",
      profileimage: "assets/images/profile3.jpeg",
      username: "@vimal201",
    ),
    Data(
      name: "Anjali",
      profileimage: "assets/images/profile4.jpeg",
      username: "@anjali221",
    ),
    Data(
      name: "Renjith",
      profileimage: "assets/images/profile5.jpeg",
      username: "@renjith234",
    ),
    Data(
      name: "Abhirami",
      profileimage: "assets/images/profile6.jpeg",
      username: "@abhirami345",
    ),
    Data(
      name: "Robert",
      profileimage: "assets/images/profile7.jpeg",
      username: "@robert234",
    ),
    Data(
      name: "Jiji",
      profileimage: "assets/images/profile8.jpeg",
      username: "@jiji673",
    ),
    Data(
      name: "Vimal",
      profileimage: "assets/images/profile3.jpeg",
      username: "@vimal201",
    ),
    Data(
      name: "sruthy",
      profileimage: "assets/images/profile4.jpeg",
      username: "@bella233",
    ),
    Data(
      name: "anjana",
      profileimage: "assets/images/profile5.jpeg",
      username: "@anjana123",
    ),
    Data(
      name: "Abhirami",
      profileimage: "assets/images/profile6.jpeg",
      username: "@abhirami345",
    ),
    Data(
      name: "Robert",
      profileimage: "assets/images/profile7.jpeg",
      username: "@robert234",
    ),
    Data(
      name: "Jiji",
      profileimage: "assets/images/profile8.jpeg",
      username: "@jiji673",
    ),
    Data(
      name: "teritta",
      profileimage: "assets/images/profile9.jpeg",
      username: "@teritta2341",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ),
                hintStyle: const TextStyle(color: Colors.white),
                hintText: "Search",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
                labelStyle: TextStyle(color: Colors.white70),
              ),
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("${Searchdata[index].profileimage}"),
                        ),
                        title: Text(
                          "${Searchdata[index].username}",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "${Searchdata[index].name}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 0.3,
                    );
                  },
                  itemCount: Searchdata.length))
        ],
      ),
    )
        // Container(
        //   child: ListView.builder(
        //     itemCount: 16,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         leading: CircleAvatar(),
        //         title: Text(
        //           "USER NAME",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         subtitle: Text(
        //           "NAME",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       );
        //     },
        //   ),
        // ),
        );
  }
}
