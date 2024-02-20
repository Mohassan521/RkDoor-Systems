class HotLeadsModel {
  String? id;
  String? date;
  String? time;
  String? enquiryType;
  String? enquiryDealer;
  String? enquiryEntered;
  String? enquiryRequirement;
  String? enquiryCompanyName;
  String? enquiryCusName;
  String? enquirySupplyType;
  String? customerAddress;
  String? customerAddress2;
  String? customerAddress3;
  String? customerAddress4;
  String? dileveryPostCodeC13;
  String? enquiryCusEmail;
  String? enquiryTelNum;
  String? enquiryPriorityLevel;
  String? enquiryNotes;
  String? enquirySource;
  List<dynamic>? enquiryFileUpload;
  List<dynamic>? enquirydoorsedignfileToUpload;
  String? enquiryFolderNotes;
  String? enquiryConfCode;
  String? enquiryAllocatedTo;
  String? quotationNumberForEnquiry;
  List<dynamic>? enquiryOrderConfFile;
  String? newSymbol;
  String? checkEnquiryOpenedOrNot;
  String? enquriyStatusAfterOpen;

  HotLeadsModel(
      {this.id,
      this.date,
      this.time,
      this.enquiryType,
      this.enquiryDealer,
      this.enquiryEntered,
      this.enquiryRequirement,
      this.enquiryCompanyName,
      this.enquiryCusName,
      this.enquirySupplyType,
      this.customerAddress,
      this.customerAddress2,
      this.customerAddress3,
      this.customerAddress4,
      this.dileveryPostCodeC13,
      this.enquiryCusEmail,
      this.enquiryTelNum,
      this.enquiryPriorityLevel,
      this.enquiryNotes,
      this.enquirySource,
      this.enquiryFileUpload,
      this.enquirydoorsedignfileToUpload,
      this.enquiryFolderNotes,
      this.enquiryConfCode,
      this.enquiryAllocatedTo,
      this.quotationNumberForEnquiry,
      this.enquiryOrderConfFile,
      this.newSymbol,
      this.checkEnquiryOpenedOrNot,
      this.enquriyStatusAfterOpen});

  factory HotLeadsModel.fromJson(Map<String, dynamic> json) {
    var enquiryFileUpload = json['enquiryFileUpload'] ?? [];
    var EnquirydoorsedignfileToUpload =
        json['EnquirydoorsedignfileToUpload'] ?? [];
    var orderConfFile = json['enquiry_Order_Conf_File'] ?? [];

    return HotLeadsModel(
        id: json['id'],
        date: json['date'],
        time: json['time'],
        enquiryType: json['enquiry_type'],
        enquiryDealer: json['enquiry_dealer'],
        enquiryEntered: json['enquiry_entered'],
        enquiryRequirement: json['enquiry_requirement'],
        enquiryCompanyName: json['enquiry_company_name'],
        enquiryCusName: json['enquiry_cus_name'],
        enquirySupplyType: json['enquiry_supply_type'],
        customerAddress: json['customer_address'],
        customerAddress2: json['customer_address_2'],
        customerAddress3: json['customer_address_3'],
        customerAddress4: json['customer_address_4'],
        dileveryPostCodeC13: json['dilevery_post_code_c13'],
        enquiryCusEmail: json['enquiry_cus_email'],
        enquiryTelNum: json['enquiry_tel_num'],
        enquiryPriorityLevel: json['enquiry_priorityLevel'],
        enquiryNotes: json['enquiry_notes'],
        enquirySource: json['enquiry_source'],
        enquiryFileUpload: enquiryFileUpload,
        enquirydoorsedignfileToUpload: EnquirydoorsedignfileToUpload,
        enquiryFolderNotes: json['enquiry_folder_notes'],
        enquiryConfCode: json['enquiry_conf_code'],
        enquiryAllocatedTo: json['enquiry_allocated_to'],
        quotationNumberForEnquiry: json['quotation_number_for_enquiry'],
        enquiryOrderConfFile: orderConfFile,
        newSymbol: json['newSymbol'],
        checkEnquiryOpenedOrNot: json['checkEnquiryOpenedOrNot'],
        enquriyStatusAfterOpen: json['enquriy_status_after_open']);
  }
}
