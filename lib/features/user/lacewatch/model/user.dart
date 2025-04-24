class User {
  final String? username;
  final String? email;
  final bool? isVerified;
  final int? createdAt;
  final String? id;

  User({
    this.username,
    this.email,
    this.isVerified,
    this.createdAt,
    this.id,
  });

  User copyWith({String? username, String? email, bool? isVerified, int? createdAt, String? id}) => User(
      username: username ?? this.username,
      email: email ?? this.email,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? id);

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        isVerified: json["is_verified"],
        createdAt: json['created_at'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "is_verified": isVerified,
        "created_at": createdAt,
        "id": id,
      };
}
