class AdminHotLeadsModel {
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
  String? enquiryAllocatedTo;
  List<dynamic>? enquiryFileUpload;
  List<dynamic>? enquiryDoorsedignfileToUpload;
  List<dynamic>? enquiryOrderConfFile;
  String? enquiryFolderNotes;
  String? enquiryConfCode;
  String? newSymbol;
  String? quotationNumberForEnquiry;

  AdminHotLeadsModel({
    this.id,
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
    this.enquiryAllocatedTo,
    this.enquiryFileUpload,
    this.enquiryDoorsedignfileToUpload,
    this.enquiryOrderConfFile,
    this.enquiryFolderNotes,
    this.enquiryConfCode,
    this.newSymbol,
    this.quotationNumberForEnquiry
  });
  factory AdminHotLeadsModel.fromJson(Map<String, dynamic> json) {
    return AdminHotLeadsModel(
      id: json["id"] ?? "",
    date: json["date"] ?? "",
    time: json["time"] ?? "",
    enquiryType: json["enquiry_type"] ?? "",
    enquiryDealer: json["enquiry_dealer"] ?? "",
    enquiryEntered: json["enquiry_entered"] ?? "",
    enquiryRequirement: json["enquiry_requirement"] ?? "",
    enquiryCompanyName: json["enquiry_company_name"] ?? "",
    enquiryCusName: json["enquiry_cus_name"] ?? "",
    enquirySupplyType: json["enquiry_supply_type"] ?? "",
    customerAddress: json["customer_address"] ?? "",
    customerAddress2: json["customer_address_2"] ?? "",
    customerAddress3: json["customer_address_3"] ?? "",
    customerAddress4: json["customer_address_4"] ?? "",
    dileveryPostCodeC13: json["dilevery_post_code_c13"] ?? "",
    enquiryCusEmail: json["enquiry_cus_email"] ?? "",
    enquiryTelNum: json["enquiry_tel_num"] ?? "",
    enquiryPriorityLevel: json["enquiry_priorityLevel"] ?? "",
    enquiryNotes: json["enquiry_notes"] ?? "",
    enquirySource: json["enquiry_source"],
    enquiryAllocatedTo: json["enquiry_allocated_to"],
    enquiryFileUpload: json["enquiryFileUpload"] ?? [],
    enquiryDoorsedignfileToUpload: json["EnquirydoorsedignfileToUpload"] ?? [],
    enquiryOrderConfFile: json["enquiry_Order_Conf_File"] ?? [],
    enquiryFolderNotes: json["enquiry_folder_notes"] ?? "",
    enquiryConfCode: json["enquiry_conf_code"] ?? "",
    newSymbol: json["newSymbol"] ?? "",
    quotationNumberForEnquiry: json['quotation_number_for_enquiry'] ?? ""
    );
  }
}

class CompleteResponseOfHotLeads{
  List<AdminHotLeadsModel> hotleads;
  final String displayName;
  final String dealerName;

  CompleteResponseOfHotLeads({
    required this.hotleads,
    required this.displayName,
    required this.dealerName,
  });

  factory CompleteResponseOfHotLeads.fromJson(Map<String, dynamic> json) {
    List<dynamic> quoteList = json['quotes'];
    List<AdminHotLeadsModel> quotes = quoteList.map((quoteJson) => AdminHotLeadsModel.fromJson(quoteJson)).toList();

    return CompleteResponseOfHotLeads(
      hotleads: quotes,
      displayName: json['display_name'],
      dealerName: json['dealerName'],
    );
  }
}
