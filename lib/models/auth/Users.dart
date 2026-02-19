class Users {
  int? id;
  String? password;
  String? fullname;
  String? city;
  String? address;
  bool? isver;
  String? code;
  String? username;

  Users(
      {this.id,
        this.password,
        this.fullname,
        this.city,
        this.address,
        this.isver,
        this.code,
        this.username});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    fullname = json['fullname'];
    city = json['city'];
    address = json['address'];
    isver = json['isver'];
    code = json['code'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['fullname'] = this.fullname;
    data['city'] = this.city;
    data['address'] = this.address;
    data['isver'] = this.isver;
    data['code'] = this.code;
    data['username'] = this.username;
    return data;
  }
}
