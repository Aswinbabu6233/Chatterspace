import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homecaptionside extends StatelessWidget {
  const Homecaptionside({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.jpeg"),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Username",
                  style: GoogleFonts.sansita(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Follow",
                    style: GoogleFonts.sansita(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ))
            ],
          ),
          ExpandableText(
            "uygebweifghwekfbnwefhwekfnbwfhgweifqdgqwdgqwgdqwgyduygwdugqwdgqwdugqwduygqwduygqwduygqwduygqwduygqwduygqwdugqwdugqwdugqwdugqwdugqwduygqwduygqwduygqwdugqwduygqwdugqwudygqwudygqwduygqwdugqdwuygqwduygqwdgqwnbwekfbhgweiufghwebfweifgbwefbwefbwiebfw",
            style: GoogleFonts.sansita(
                fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white),
            expandText: "more",
            collapseText: "less",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
// import 'package:expandable_text/expandable_text.dart';
// import 'package:finalproject/models/video.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:marquee/marquee.dart';

// class VideoDetail extends StatelessWidget {
//   const VideoDetail({super.key, required this.video});

//   final Video video;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text(
//             '@${video.postedBy.username}',
//             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                   fontSize: 15,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//           ),
//           const SizedBox(height: 8),
//           ExpandableText(
//             video.caption,
//             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                   fontSize: 13,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w100,
//                 ),
//             expandText: 'more',
//             collapseText: 'less',
//             expandOnTextTap: true,
//             collapseOnTextTap: true,
//             maxLines: 2,
//             linkColor: Colors.grey,
//           ),
//           const SizedBox(height: 8),
//           Row(
//             children: [
//               const Icon(CupertinoIcons.music_note_2,
//                   size: 15, color: Colors.white),
//               const SizedBox(width: 8),
//               SizedBox(
//                 height: 20,
//                 width: MediaQuery.sizeOf(context).width / 2,
//                 child: Marquee(
//                   text: '${video.audioName}    *    ',
//                   velocity: 10,
//                   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                         fontSize: 13,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w100,
//                       ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
