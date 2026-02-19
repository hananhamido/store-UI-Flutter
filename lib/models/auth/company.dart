class Company{
  int? id;
  String? name;
  String? logo;
  String? description;
  String? mobile;
  String? address;

  Company.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name=json['name'];
    logo=json[' logo'];
    description=json[' description'];
    mobile=json[' mobile'];
    address=json[' address'];


  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    return data;
  }


}