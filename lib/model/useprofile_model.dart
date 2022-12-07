class ProfileModel {
  String? avatar;
  ProfileModel({this.avatar});

  Map<String, dynamic> toMap() {
    return {
      'avatar': this.avatar,

    };
  }


  factory  ProfileModel.fromMap(Map<String, dynamic> map) {
    return  ProfileModel(
      avatar: map['avatar'] ?? "",

    );
  }

}