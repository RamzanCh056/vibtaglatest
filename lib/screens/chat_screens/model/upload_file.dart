class uploadFile {

  List<FilesArray>? filesArray;

  uploadFile({ this.filesArray});

  uploadFile.fromJson(Map<String, dynamic> json) {

    if (json['files_array'] != null) {
      filesArray = <FilesArray>[];
      json['files_array'].forEach((v) {
        filesArray!.add(FilesArray.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.filesArray != null) {
      data['files_array'] = this.filesArray!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FilesArray {
  String? filename;
  String? name;

  FilesArray({this.filename, this.name});

  FilesArray.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['name'] = this.name;
    return data;
  }
}