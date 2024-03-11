class AdminModel {
  int? iD;
  String? name;
  String? postCode;
  String? tel;
  String? email;
  String? registeredUser;
  

  AdminModel({this.iD, this.name, this.email, this.postCode, this.registeredUser, this.tel});

  AdminModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    postCode = json['post_code_register'];
    tel = json['telephone'];
    email = json['email'];
    registeredUser = json['user_registered'] ; 
  }
}