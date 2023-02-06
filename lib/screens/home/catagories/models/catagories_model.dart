class CatagoriesModel {
  String? id;
  String? name;
  bool? isSelected;

  CatagoriesModel({this.id,  this.name, this.isSelected = false});


  CatagoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    isSelected = false;
    return data;
  }
}
