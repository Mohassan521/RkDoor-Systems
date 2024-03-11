class AdminClosedEnquiries {
  final String? id;
  final String? date;
  final String? time;
  final String? enquiryType;
  final String? enquiryDealer;
  final String? enquiryEntered;
  final String? enquiryRequirement;
  final String? enquiryCompanyName;
  final String? enquiryCustomerName;
  final String? enquirySupplyType;
  final String? customerAddress;
  final String? customerAddress2;
  final String? customerAddress3;
  final String? customerAddress4;
  final String? deliveryPostCodeC13;
  final String? enquiryCustomerEmail;
  final String? enquiryTelNum;
  final String? enquiryPriorityLevel;
  final String? enquiryNotes;
  final String? enquirySource;
  final List<dynamic>? enquiryFileUpload;
  final String? enquiryAllocatedTo;
  final List<dynamic>? enquiryOrderConfFile;
  final String? enquiryFolderNotes;
  final String? quotationNumberForEnquiry;
  final String? enquiryConfCode;
  final String? enqRecDate;
  final String? enqRecDate1;
  final String? enqRecDate2;
  final String? enqRecDate3;
  final String? enqRecDate4;
  final String? enqRecDate5;
  final String? enqRecDate6;
  final String? enqRkds1;
  final String? enqRkds2;
  final String? enqRkds3;
  final String? enqRkds4;
  final String? enqRkds5;
  final String? enqRkds6;
  final String? enqRkds7;
  final String? enqRkds8;
  final String? enqRkds9;
  final String? app1;
  final String? app2;
  final String? app3;
  final String? app4;
  final String? app5;
  final String? app6;
  final String? app7;
  final String? app8;
  final String? app9;
  final String? app10;
  final String? chooseOpt1;
  final String? chooseOpt2;
  final String? chooseOpt3;
  final String? chooseOpt4;
  final String? chooseOpt5;
  final String? chooseOpt6;

  AdminClosedEnquiries({
     this.id,
     this.date,
     this.time,
     this.enquiryType,
     this.enquiryDealer,
     this.enquiryEntered,
     this.enquiryRequirement,
     this.enquiryCompanyName,
     this.enquiryCustomerName,
     this.enquirySupplyType,
     this.customerAddress,
     this.customerAddress2,
     this.customerAddress3,
     this.customerAddress4,
     this.deliveryPostCodeC13,
     this.enquiryCustomerEmail,
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
     this.chooseOpt4,
     this.chooseOpt5,
     this.chooseOpt6,
  });

  factory AdminClosedEnquiries.fromJson(Map<String, dynamic> json) {
    return AdminClosedEnquiries(
      id: json['id'] ?? "",
      date: json['date'] ?? "",
      time: json['time'] ?? "",
      enquiryType: json['enquiry_type'] ?? "",
      enquiryDealer: json['enquiry_dealer'] ?? "",
      enquiryEntered: json['enquiry_entered'] ?? "",
      enquiryRequirement: json['enquiry_requirement'] ?? "",
      enquiryCompanyName: json['enquiry_company_name'] ?? "",
      enquiryCustomerName: json['enquiry_cus_name'] ?? "",
      enquirySupplyType: json['enquiry_supply_type'] ?? "",
      customerAddress: json['customer_address'] ?? "",
      customerAddress2: json['customer_address_2'] ?? "",
      customerAddress3: json['customer_address_3'] ?? "",
      customerAddress4: json['customer_address_4'] ?? "",
      deliveryPostCodeC13: json['dilevery_post_code_c13'] ?? "",
      enquiryCustomerEmail: json['enquiry_cus_email'] ?? "",
      enquiryTelNum: json['enquiry_tel_num'] ?? "",
      enquiryPriorityLevel: json['enquiry_priorityLevel'] ?? "",
      enquiryNotes: json['enquiry_notes'] ?? "",
      enquirySource: json['enquiry_source'] ?? "",
      enquiryFileUpload: json['enquiryFileUpload'] ?? [],
      enquiryAllocatedTo: json['enquiry_allocated_to'] ?? "",
      enquiryOrderConfFile: json['enquiry_Order_Conf_File'] ?? [],
      enquiryFolderNotes: json['enquiry_folder_notes'] ?? "",
      quotationNumberForEnquiry: json['quotation_number_for_enquiry'] ?? "",
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
      chooseOpt4: json['choose_opt_4'] ?? "",
      chooseOpt5: json['choose_opt_5'] ?? "",
      chooseOpt6: json['choose_opt_6'] ?? "",
    );
  }
}

class ClosedResponseOfEnquiries {
  final List<AdminClosedEnquiries> quotes;
  final String displayName;
  final String dealerName;

  ClosedResponseOfEnquiries({
    required this.quotes,
    required this.displayName,
    required this.dealerName,
  });

  factory ClosedResponseOfEnquiries.fromJson(Map<String, dynamic> json) {
    List<dynamic> quoteList = json['quotes'];
    List<AdminClosedEnquiries> quotes = quoteList.map((quoteJson) => AdminClosedEnquiries.fromJson(quoteJson)).toList();

    return ClosedResponseOfEnquiries(
      quotes: quotes,
      displayName: json['display_name'],
      dealerName: json['dealerName'],
    );
  }
}
