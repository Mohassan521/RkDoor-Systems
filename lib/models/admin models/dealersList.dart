class DealersList {
  int? iD;
  String? name;
  String? dealerName;
  String? dealerAddress1;
  String? dealerAddress2;
  String? dealerAddress3;
  String? postCodeRegister;
  String? telephone;
  String? email;
  String? userRegistered;
  String? dealerType;
  String? lDealer;
  String? lStatus;
  String? lDate;
  String? supportMember;
  String? marketingImages;
  List<dynamic>? userMarketingRecord;

  DealersList(
      {this.iD,
      this.name,
      this.dealerName,
      this.dealerAddress1,
      this.dealerAddress2,
      this.dealerAddress3,
      this.postCodeRegister,
      this.telephone,
      this.email,
      this.userRegistered,
      this.dealerType,
      this.lDealer,
      this.lStatus,
      this.lDate,
      this.supportMember,
      this.marketingImages,
      this.userMarketingRecord});


  DealersList.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    dealerName = json['dealerName'];
    dealerAddress1 = json['DealerAddress1'];
    dealerAddress2 = json['DealerAddress2'];
    dealerAddress3 = json['DealerAddress3'];
    postCodeRegister = json['post_code_register'];
    telephone = json['telephone'];
    email = json['email'];
    userRegistered = json['user_registered'];
    dealerType = json['dealerType'];
    lDealer = json['l_dealer'];
    lStatus = json['l_status'];
    lDate = json['l_date'];
    supportMember = json['support_member'];
    marketingImages = json['marketing_images'];
    userMarketingRecord = json['user_marketing_record'] ?? [];
  }
}