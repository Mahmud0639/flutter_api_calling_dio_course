class SuccessRes {
  String? result;

  SuccessRes({this.result});

  SuccessRes.fromJson(Map<String, dynamic> json) {
    result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Result'] = this.result;
    return data;
  }
}
