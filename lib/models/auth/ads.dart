class Ads{
  int? id;
  String? image;
  int? productId;
  int? companyId;

  Ads({this.id,this.image,this.productId,this.companyId});
  Ads.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    image=json['image'];
    productId=json['productId'];
    companyId=json['companyId'];

  }
  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['image'] = this.image;
  data['productId'] = this.productId;
  data['companyId'] = this.companyId;
  return data;
  }



}