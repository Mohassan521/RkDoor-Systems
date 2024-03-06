class AllDealersModel {
  int? iD;
  String? name;

  AllDealersModel({this.iD, this.name});

  AllDealersModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
  }
}