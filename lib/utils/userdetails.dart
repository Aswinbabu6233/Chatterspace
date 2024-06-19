class User {
  final int id;
  final String name;
  final String? username;
  final String imageUrl;
  final String? PostimgUrl;

  User({
    this.username,
    this.PostimgUrl,
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
