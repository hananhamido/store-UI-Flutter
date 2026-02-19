class BillDetails{
  int? id;
  int? billId;
  int? productId;
  int? amount;

  BillDetails({this.id,this.billId,this.productId,this.amount});
  BillDetails.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    billId=json['billId'];
    productId=json['productId'];
    amount=json['amount'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['billId'] = this.billId;
    data['productId'] = this.productId;
    data['amount'] = this.amount;
    return data;
  }



}