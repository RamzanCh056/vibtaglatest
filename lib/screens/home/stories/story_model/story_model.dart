class StoryModel {
  String? id;
  String? user_id;
  String? title;
  String? description;
  String? thumbnail;
  String? view_count;
  String? posted;


  StoryModel({this.id,  this.user_id,this.title,this.description,this.posted,this.thumbnail,this.view_count, });


  StoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    user_id = json['user_id'] ?? "";
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    thumbnail = json['thumbnail'] ?? "";
    view_count = json['view_count'] ?? "";
    posted = json['posted'] ?? "";

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['view_count'] = this.view_count;
    data['posted'] = this.posted;


    return data;
  }
}
