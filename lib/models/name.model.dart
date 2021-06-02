class Name {
  String loginStatus;
  String message;
  String name;

  Name({this.loginStatus, this.message, this.name});

  Name.fromJson(Map<String, dynamic> json) {
    loginStatus = json['Login_status'];
    message = json['message'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Login_status'] = this.loginStatus;
    data['message'] = this.message;
    data['name'] = this.name;
    return data;
  }
}
