class ClosedEnquiryModel {
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
  String? enquiryAllocatedTo;
  String? enquiryFolderNotes;
  List<dynamic>? enquiryOrderConfFile;
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

  ClosedEnquiryModel(
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
      this.enquiryAllocatedTo,
      this.enquiryFolderNotes,
      this.enquiryOrderConfFile,
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

  factory ClosedEnquiryModel.fromJson(Map<String, dynamic> json) {
    var enquiryFileUpload = json['enquiryFileUpload'] ?? [];
    var enquirydoorsedignfileToUpload =
        json['EnquirydoorsedignfileToUpload'] ?? [];

    return ClosedEnquiryModel(
      id: json['id'] ?? "",
      date: json['date'] ?? "",
      time: json['time'] ?? "",
      enquiryType: json['enquiry_type'] ?? "",
      enquiryDealer: json['enquiry_dealer'] ?? "",
      enquiryEntered: json['enquiry_entered'] ?? "", 
      enquiryRequirement: json['enquiry_requirement'] ?? "",
      enquiryCompanyName: json['enquiry_company_name'] ?? "",
      enquiryCusName: json['enquiry_cus_name'] ?? "",
      enquirySupplyType: json['enquiry_supply_type'] ?? "",
      customerAddress: json['customer_address'] ?? "",
      customerAddress2: json['customer_address_2'] ?? "",
      customerAddress3: json['customer_address_3'] ?? "",
      customerAddress4: json['customer_address_4'] ?? "",
      dileveryPostCodeC13: json['dilevery_post_code_c13'] ?? "",
      enquiryCusEmail: json['enquiry_cus_email'] ?? "",
      enquiryTelNum: json['enquiry_tel_num'] ?? "",
      enquiryPriorityLevel: json['enquiry_priorityLevel'] ?? "",
      enquiryNotes: json['enquiry_notes'] ?? "",
      enquirySource: json['enquiry_source'] ?? "",
      enquiryFileUpload: enquiryFileUpload,
      enquirydoorsedignfileToUpload: enquirydoorsedignfileToUpload,
      enquiryAllocatedTo: json['enquiry_allocated_to'] ?? "",
      enquiryFolderNotes: json['enquiry_folder_notes'] ?? "",
      enquiryOrderConfFile: json['enquiry_Order_Conf_File'] ?? [],
      enquiryConfCode: json['enquiry_conf_code'] ?? "",
      enqRecDate: json['enq_rec_date'] ?? "",
      enqRecDate1: json['enq_rec_date_1'] ?? "",
      enqRecDate2: json['enq_rec_date_2'] ?? "",
      enqRecDate3: json['enq_rec_date_3'] ?? "",
      enqRecDate4: json['enq_rec_date_4'] ?? "",
      enqRecDate5: json['enq_rec_date_5'] ?? "",
      enqRecDate6: json['enq_rec_date_6'] ?? "",
      enqRkds1: json['enq_rkds_1'] ?? "",
      enqRkds2: json['enq_rkds_2'] ?? "",
      enqRkds3: json['enq_rkds_3'] ?? "",
      enqRkds4: json['enq_rkds_4'] ?? "",
      enqRkds5: json['enq_rkds_5'] ?? "",
      enqRkds6: json['enq_rkds_6'] ?? "",
      enqRkds7: json['enq_rkds_7'] ?? "",
      enqRkds8: json['enq_rkds_8'] ?? "",
      enqRkds9: json['enq_rkds_9'] ?? "",
      app1: json['app_1'] ?? "",
      app2: json['app_2'] ?? "",
      app3: json['app_3'] ?? "",
      app4: json['app_4'] ?? "",
      app5: json['app_5'] ?? "",
      app6: json['app_6'] ?? "",
      app7: json['app_7'] ?? "",
      app8: json['app_8'] ?? "",
      app9: json['app_9'] ?? "",
      app10: json['app_10'] ?? "",
      chooseOpt1: json['choose_opt_1'] ?? "",
      chooseOpt2: json['choose_opt_2'] ?? "",
      chooseOpt3: json['choose_opt_3'] ?? "",
      chooseOpt5: json['choose_opt_5'] ?? "",
      newSymbol: json['newSymbol'] ?? "",
      checkEnquiryOpenedOrNot: json['checkEnquiryOpenedOrNot'] ?? "",
      enquriyStatusAfterOpen: json['enquriy_status_after_open'] ?? "",
    );
  }
}
