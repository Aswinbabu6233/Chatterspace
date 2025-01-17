import 'package:chatterspace/utils/userdetails.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final User currentUser =
    User(id: 0, name: 'Current User', imageUrl: 'assets/images/profile6.jpeg');

// USERS
final User greg =
    User(id: 1, name: 'Greg', imageUrl: 'assets/images/profile.jpeg');
final User james =
    User(id: 2, name: 'James', imageUrl: 'assets/images/profile9.jpeg');
final User john =
    User(id: 3, name: 'John', imageUrl: 'assets/images/profile1.jpeg');
final User olivia =
    User(id: 4, name: 'Olivia', imageUrl: 'assets/images/profile10.jpeg');
final User sam =
    User(id: 5, name: 'Sam', imageUrl: 'assets/images/profile2.jpeg');
final User sophia =
    User(id: 6, name: 'Sophia', imageUrl: 'assets/images/profile3.jpeg');
final User steven =
    User(id: 7, name: 'Steven', imageUrl: 'assets/images/profile4.jpeg');
final User Alex =
    User(id: 8, name: 'Alex', imageUrl: 'assets/images/profile.jpeg');
final User jimmy =
    User(id: 9, name: 'Jimmy', imageUrl: 'assets/images/profile8.jpeg');
final User cera =
    User(id: 10, name: 'cera', imageUrl: 'assets/images/profile1.jpeg');
final User Amrutha =
    User(id: 11, name: 'Amrutha', imageUrl: 'assets/images/profile9.jpeg');
final User Ram =
    User(id: 12, name: 'Ram', imageUrl: 'assets/images/profile2.jpeg');
final User George =
    User(id: 13, name: 'George', imageUrl: 'assets/images/profile3.jpeg');
final User Anju =
    User(id: 14, name: 'Anju', imageUrl: 'assets/images/profile4.jpeg');

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: George,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: Amrutha,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: jimmy,
    time: '3:30 PM',
    text:
        'Hey, how\'s it going? What did yjksdkjbsdkjbsdkjbsdkjbsdkjbsdkjbsdkjbsdkjbsdekjbsdkjbsdkjbsdkjbsdkjbsdkjbsdou do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: Alex,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: Anju,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: Ram,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: cera,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
