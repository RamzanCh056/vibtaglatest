class GroupModelList {
  String? rec_name;
  String? sen_name;
  String? rec_pic;
  String? sent_time;
  String? message;
  String? rec_id;
  String? sen_pic;
  String? sen_id;
  String? attachment_url;
  String? last_online;
  String? online_status;
  String? attachment_type;
  String? is_map;
  String? lat;
  String? lng;



  GroupModelList({
    this.attachment_url,
    this.message,
    this.rec_name,
    this.rec_pic,
    this.sent_time,
    this.rec_id,
    this.sen_name,
    this.sen_id,
    this.sen_pic,
    this.last_online,
    this.online_status,
    this.attachment_type,
    this.lng,
    this.lat,
    this.is_map,

  });

  Map<String, dynamic> toJson() {
    return {
      "message": this.message,
      "rec_name": this.rec_name,
      "rec_pic": this.rec_pic,
      "sent_time": this.sent_time,
      "rec_id": this.rec_id,
      "sen_name": this.sen_name,
      "sen_id": this.sen_id,
      "sen_pic": this.sen_pic,
      "attachment_url": this.attachment_url,
      "last_online": this.last_online,
      "online_status": this.online_status,
      "attachment_type": this.attachment_type,
      "lng": this.lng,
      "lat": this.lat,
      "is_map": this.is_map,




    };
  }

  factory GroupModelList.fromJson(Map<String, dynamic> json) {
    return GroupModelList(
      message: json["message"] ?? "",
      rec_name: json["rec_name"] ?? "",
      rec_pic: json["rec_pic"] ?? "",
      sent_time: json["sent_time"] ?? "",
      rec_id: json["rec_id"] ?? "",
      sen_name: json["sen_name"] ?? "",
      sen_id: json["sen_id"] ?? "",
      sen_pic: json["sen_pic"] ?? "",
      attachment_url: json["attachment_url"] ?? "",
      last_online: json["last_online"] ?? "",
      online_status: json["online_status"] ?? "",
      attachment_type: json["attachment_type"] ?? "",
      lng: json["lng"] ?? "",
      lat: json["lat"] ?? "",
      is_map: json["is_map"] ?? "",



    );
  }
}
