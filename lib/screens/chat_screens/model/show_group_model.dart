class ShowGroup {
  String? group_name;
  String? last_seen;
  String? sent_time;
  String? message;
  String? avatar;



  ShowGroup({
    this.message,
    this.sent_time,
    this.avatar,
    this.group_name,
    this.last_seen,

  });

  Map<String, dynamic> toJson() {
    return {
      "message": this.message,
      "sent_time": this.sent_time,
      "avatar": this.avatar,
      "group_name": this.group_name,
      "last_seen": this.last_seen,

    };
  }

  factory ShowGroup.fromJson(Map<String, dynamic> json) {
    return ShowGroup(
      message: json["message"] ?? "",
      sent_time: json["sent_time"] ?? "",
      avatar: json["avatar"] ?? "",
      group_name: json["group_name"] ?? "",
      last_seen: json["last_seen"] ?? "",



    );
  }
}
