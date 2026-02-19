class Bills{
  int? id;
  String? username;
  String? createdAt;
  int? state;
  int? total;

  Bills({this.id,this.username,this.createdAt,this.state,this.total});
  Bills.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    username=json['username'];
    createdAt=json['createdAt'];
    state=json['state'];
    total=json['total'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['createdAt'] = this.createdAt;
    data['state'] = this.state;
    data['total'] = this.total;
    return data;
  }



}