
class ResponseInMapModel {
  List<MyJsonObject>? myJsonObject;

  ResponseInMapModel({this.myJsonObject});

  ResponseInMapModel.fromJson(Map<String, dynamic> json) {
    if (json['myJsonObject'] != null) {
      myJsonObject = <MyJsonObject>[];
      json['myJsonObject'].forEach((v) {
        myJsonObject!.add(new MyJsonObject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myJsonObject != null) {
      data['myJsonObject'] = this.myJsonObject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyJsonObject {
  int? id;
  bool? isActive;
  String? name;
  String? details;
  ImgData? imgData;
  List<String>? attributes;

  MyJsonObject(
      {this.id,
        this.isActive,
        this.name,
        this.details,
        this.imgData,
        this.attributes});

  MyJsonObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    name = json['name'];
    details = json['details'];
    imgData =
    json['imgData'] != null ? new ImgData.fromJson(json['imgData']) : null;
    //attributes = json['attributes'].cast<String>();
    attributes = json['attributes'] != null
        ? List<String>.from(json['attributes'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    data['name'] = this.name;
    data['details'] = this.details;
    if (this.imgData != null) {
      data['imgData'] = this.imgData!.toJson();
    }
    data['attributes'] = this.attributes;
    return data;
  }
}

class ImgData {
  String? fileName;
  String? baseUrl;

  ImgData({this.fileName, this.baseUrl});

  ImgData.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    baseUrl = json['baseUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['baseUrl'] = this.baseUrl;
    return data;
  }
}
