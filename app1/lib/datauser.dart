class datauser {
  String? name;
  String? email;
  String? address;
  String? phone;

  datauser({this.name,this.email,this.address, this.phone});

  // datauser.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   address = json['address'];
  //   phone = json['phone'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['address'] = this.address;
  //   data['phone'] = this.phone;
  //   return data;
  // }
}