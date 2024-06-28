import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'message_model.dart';
import 'msgdetails.dart';
import '../../widgets/message_screen.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final messagelist = Messagelist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(currentUser.imageUrl),
                        radius: 25,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "LETS CHAT!!",
                        style: GoogleFonts.sansita(
                          fontSize: 30,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.chat_bubble_2,
                        color: Colors.grey,
                        size: 35,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Search",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
              ),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Colors.grey[900]),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ChatScreen(
                                        user: chats[index].sender);
                                  },
                                ));
                              },
                              child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 28,
                                    backgroundImage: AssetImage(
                                        chats[index].sender.imageUrl),
                                  ),
                                  title: Text(
                                    chats[index].sender.name,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    height: 15,
                                    child: Text(
                                      chats[index].text,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        chats[index].time,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Icon(
                                          color: Colors.orange,
                                          chats[index].unread
                                              ? Icons.new_releases_outlined
                                              : null),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
