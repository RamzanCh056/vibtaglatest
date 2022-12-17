import 'dart:convert';

class ModelUser {
  final String? first_name;
  final String? last_name;
  final String? username;
  final String? email;
  final String? avatar;
  final String? address;
  final String? about;
  final String? cover;
  final String? birthday;
  final String? user_id;

  ModelUser({
    required this.first_name,
    required this.last_name,
    required this.username,
    required this.email,
    required this.avatar,
    required this.address,
    required this.about,
    required this.cover,
    required this.birthday,
    required this.user_id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'email': email,
      'avatar': avatar,
      'address': address,
      'about': about,
      'cover': cover,
      'birthday': birthday,
      'user_id': user_id,
    };
  }

  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
      first_name: map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      cover: map['cover'] != null ? map['cover'] as String : null,
      birthday: map['birthday'] != null ? map['birthday'] as String : null,
      user_id: map['user_id'] != null ? map['user_id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelUser.fromJson(String source) => ModelUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
