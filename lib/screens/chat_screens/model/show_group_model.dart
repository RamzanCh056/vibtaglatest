class ShowGroup {
  String? group_name;
  String? last_seen;
  String? sent_time;
  String? message;
  String? avatar;
  String? group_id;



  ShowGroup({
    this.message,
    this.sent_time,
    this.avatar,
    this.group_name,
    this.last_seen,
    this.group_id,

  });

  Map<String, dynamic> toJson() {
    return {
      "message": this.message,
      "sent_time": this.sent_time,
      "avatar": this.avatar,
      "group_name": this.group_name,
      "last_seen": this.last_seen,
      "group_id": this.group_id,

    };
  }

  factory ShowGroup.fromJson(Map<String, dynamic> json) {
    return ShowGroup(
      message: json["message"] ?? "",
      sent_time: json["sent_time"] ?? "",
      avatar: json["avatar"] ?? "",
      group_name: json["group_name"] ?? "",
      last_seen: json["last_seen"] ?? "",
      group_id: json["group_id"] ?? "",


    );
  }
}
