class DealersModel {
  int? iD;
  String? userEmail;
  String? userPass;
  String? displayName;
  String? dealerName;
  String? dealerAddress1;
  String? dealerAddress2;
  String? dealerAddress3;
  String? telephone;
  String? postCodeRegister;
  String? quotationType;
  String? dealerType;
  String? lDealer;
  String? lDate;
  String? firstName;
  String? lastName;

  DealersModel(
      {this.iD,
      this.userEmail,
      this.userPass,
      this.displayName,
      this.dealerName,
      this.dealerAddress1,
      this.dealerAddress2,
      this.dealerAddress3,
      this.telephone,
      this.postCodeRegister,
      this.quotationType,
      this.dealerType,
      this.lDealer,
      this.lDate,
      this.firstName,
      this.lastName});

  factory DealersModel.fromJson(Map<String, dynamic> json) {
    return DealersModel(
        iD: json['ID'] ?? "NA",
        userEmail: json['user_email'] ?? "NA",
        userPass: json['user_pass'] ?? "NA",
        displayName: json['display_name'] ?? "NA",
        dealerName: json['dealerName'] ?? "NA",
        dealerAddress1: json['dealerAddress1'] ?? "NA",
        dealerAddress2: json['dealerAddress2'] ?? "NA",
        dealerAddress3: json['dealerAddress3'] ?? 'NA',
        telephone: json['telephone'] ?? "NA",
        postCodeRegister: json['post_code_register'] ?? "NA",
        quotationType: json['quotation_type'] ?? "NA",
        dealerType: json['dealerType'] ?? "NA",
        lDealer: json['l_dealer'] ?? "NA",
        lDate: json['l_date'] ?? "NA",
        firstName: json['first_name'] ?? "NA",
        lastName: json['lastname'] ?? "NA");
  }
}
