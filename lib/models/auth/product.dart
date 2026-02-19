class Product{
  int? id;
  String? name;
  String? price;
  String? image;
  int?  companyId;
  int?  categoryId;
  String? description;
  int? numberOfSeen;

  Product.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name=json['name'];
    price=json[' price'];
    image=json[' image'];
    companyId=json[' companyId'];
    description=json[' description'];
    numberOfSeen=json['amount'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['companyId'] = this.companyId;
    data['description'] = this.description;
    data['amount'] = this.numberOfSeen;
    return data;
  }


}