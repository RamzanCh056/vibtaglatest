class ColorsPostModel {
  int? id;
  String? type;
  String? image;
  String? color_1;
  String? color_2;
  String? text_color;
  bool?     isSelected = false;


  ColorsPostModel({this.id,  this.type, this.image, this.color_1, this.color_2, this.text_color, this.isSelected = false,});


  ColorsPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    color_1 = json['color_1'];
    color_2 = json['color_2'];
    text_color = json['text_color'];
    isSelected = false;



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['image'] = this.image;
    data['color_1'] = this.color_1;
    data['color_2'] = this.color_2;
    data['text_color'] = this.text_color;
    isSelected = false;


    return data;
  }
}
