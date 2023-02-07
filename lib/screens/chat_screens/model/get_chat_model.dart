class GetChatList {
  String? rec_name;
  String? rec_pic;
  String? sent_time;
  String? message;
  String? rec_id;



  GetChatList({
    this.message,
    this.rec_name,
    this.rec_pic,
    this.sent_time,
    this.rec_id,

  });

  Map<String, dynamic> toJson() {
    return {
      "message": this.message,
      "rec_name": this.rec_name,
      "rec_pic": this.rec_pic,
      "sent_time": this.sent_time,
      "rec_id": this.rec_id,

    };
  }

  factory GetChatList.fromJson(Map<String, dynamic> json) {
    return GetChatList(
      message: json["message"] ?? "",
      rec_name: json["rec_name"] ?? "",
      rec_pic: json["rec_pic"] ?? "",
      sent_time: json["sent_time"] ?? "",
      rec_id: json["rec_id"] ?? "",



    );
  }
}
