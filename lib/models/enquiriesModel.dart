class EnquiriesModel {
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
  String? enquiryAllocatedTo;
  List<dynamic>? enquiryOrderConfFile;
  String? enquiryFolderNotes;
  String? quotationNumberForEnquiry;
  String? enquiryConfCode;
  String? enqRecDate;
  String? enqRecDate1;
  String? enqRecDate2;
  String? enqRecDate3;
  String? enqRecDate4;
  String? enqRecDate5;
  String? enqRecDate6;
  String? enqRkds1;
  String? enqRkds2;
  String? enqRkds3;
  String? enqRkds4;
  String? enqRkds5;
  String? enqRkds6;
  String? enqRkds7;
  String? enqRkds8;
  String? enqRkds9;
  String? app1;
  String? app2;
  String? app3;
  String? app4;
  String? app5;
  String? app6;
  String? app7;
  String? app8;
  String? app9;
  String? app10;
  String? chooseOpt1;
  String? chooseOpt2;
  String? chooseOpt3;
  String? chooseOpt5;
  String? newSymbol;
  String? checkEnquiryOpenedOrNot;
  String? enquriyStatusAfterOpen;

  EnquiriesModel(
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
      this.enquiryAllocatedTo,
      this.enquiryOrderConfFile,
      this.enquiryFolderNotes,
      this.quotationNumberForEnquiry,
      this.enquiryConfCode,
      this.enqRecDate,
      this.enqRecDate1,
      this.enqRecDate2,
      this.enqRecDate3,
      this.enqRecDate4,
      this.enqRecDate5,
      this.enqRecDate6,
      this.enqRkds1,
      this.enqRkds2,
      this.enqRkds3,
      this.enqRkds4,
      this.enqRkds5,
      this.enqRkds6,
      this.enqRkds7,
      this.enqRkds8,
      this.enqRkds9,
      this.app1,
      this.app2,
      this.app3,
      this.app4,
      this.app5,
      this.app6,
      this.app7,
      this.app8,
      this.app9,
      this.app10,
      this.chooseOpt1,
      this.chooseOpt2,
      this.chooseOpt3,
      this.chooseOpt5,
      this.newSymbol,
      this.checkEnquiryOpenedOrNot,
      this.enquriyStatusAfterOpen});

  factory EnquiriesModel.fromJson(Map<String, dynamic> json) {
    var enquiryFileUpload = json['enquiryFileUpload'] ?? [];
    var enquiry_Order_Conf_File = json['enquiry_Order_Conf_File'] ?? [];

    return EnquiriesModel(
      id: json['id'],
      date: json['date'] ?? "NA",
      time: json['time'] ?? "NA",
      enquiryType: json['enquiry_type'] ?? "NA",
      enquiryDealer: json['enquiry_dealer'] ?? "NA",
      enquiryEntered: json['enquiry_entered'] ?? "NA",
      enquiryRequirement: json['enquiry_requirement'] ?? "NA",
      enquiryCompanyName: json['enquiry_company_name'] ?? "NA",
      enquiryCusName: json['enquiry_cus_name'] ?? "NA",
      enquirySupplyType: json['enquiry_supply_type'] ?? "NA",
      customerAddress: json['customer_address'] ?? "NA",
      customerAddress2: json['customer_address_2'] ?? "NA",
      customerAddress3: json['customer_address_3'] ?? "NA",
      customerAddress4: json['customer_address_4'] ?? "NA",
      dileveryPostCodeC13: json['dilevery_post_code_c13'] ?? "NA",
      enquiryCusEmail: json['enquiry_cus_email'] ?? "NA",
      enquiryTelNum: json['enquiry_tel_num'] ?? "NA",
      enquiryPriorityLevel: json['enquiry_priorityLevel'] ?? "NA",
      enquiryNotes: json['enquiry_notes'] ?? "NA",
      enquirySource: json['enquiry_source'] ?? "NA",
      enquiryFileUpload: enquiryFileUpload,
      enquiryAllocatedTo: json['enquiry_allocated_to'] ?? "NA",
      enquiryFolderNotes: json['enquiry_folder_notes'] ?? "NA",
      quotationNumberForEnquiry: json['quotation_number_for_enquiry'] ?? "NA",
      enquiryOrderConfFile: enquiry_Order_Conf_File,
      enquiryConfCode: json['enquiry_conf_code'] ?? "NA",
      enqRecDate: json['enq_rec_date'] ?? "NA",
      enqRecDate1: json['enq_rec_date_1'] ?? "NA",
      enqRecDate2: json['enq_rec_date_2'] ?? "NA",
      enqRecDate3: json['enq_rec_date_3'] ?? "NA",
      enqRecDate4: json['enq_rec_date_4'] ?? "NA",
      enqRecDate5: json['enq_rec_date_5'] ?? "NA",
      enqRecDate6: json['enq_rec_date_6'] ?? "NA",
      enqRkds1: json['enq_rkds_1'] ?? "NA",
      enqRkds2: json['enq_rkds_2'] ?? "NA",
      enqRkds3: json['enq_rkds_3'] ?? "NA",
      enqRkds4: json['enq_rkds_4'] ?? "NA",
      enqRkds5: json['enq_rkds_5'] ?? "NA",
      enqRkds6: json['enq_rkds_6'] ?? "NA",
      enqRkds7: json['enq_rkds_7'] ?? "NA",
      enqRkds8: json['enq_rkds_8'] ?? "NA",
      enqRkds9: json['enq_rkds_9'] ?? "NA",
      app1: json['app_1'] ?? "NA",
      app2: json['app_2'] ?? "NA",
      app3: json['app_3'] ?? "NA",
      app4: json['app_4'] ?? "NA",
      app5: json['app_5'] ?? "NA",
      app6: json['app_6'] ?? "NA",
      app7: json['app_7'] ?? "NA",
      app8: json['app_8'] ?? "NA",
      app9: json['app_9'] ?? "NA",
      app10: json['app_10'] ?? "NA",
      chooseOpt1: json['choose_opt_1'] ?? "NA",
      chooseOpt2: json['choose_opt_2'] ?? "NA",
      chooseOpt3: json['choose_opt_3'] ?? "NA",
      chooseOpt5: json['choose_opt_5'] ?? "NA",
      newSymbol: json['newSymbol'] ?? "NA",
      checkEnquiryOpenedOrNot: json['checkEnquiryOpenedOrNot'] ?? "NA",
      enquriyStatusAfterOpen: json['enquriy_status_after_open'] ?? "NA",
    );
  }
}
