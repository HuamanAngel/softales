class User {
  final String id;
  final String email;
  final String username;
  final String? profileImageUrl;

  User({
    required this.id,
    required this.email,
    required this.username,
    this.profileImageUrl = '',
  });
}
