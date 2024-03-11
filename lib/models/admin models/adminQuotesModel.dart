class AdminQuotesModel {
  final String? quotationNumber;
  final String? uniqueNumber;
  final String? id;
  final String? name;
  final String? deliveryPostCode;
  final String? quoteDescription;
  final String? telephoneNumber;
  final String? customerEmail;
  final String? saleBonus;
  final String? wholeTotal;
  final String? thresholdType;
  final String? marineGradeVal;
  final String? frameSizeHeightWidth;
  final String? totalWeightKg;
  final String? lhGoalPostE44;
  final String? date;
  final String? time;
  final String? notes;
  final String? orderFUpVal;
  final String? internalImageURL;
  final String? externalImageURL;
  final String? orderDateQArray;
  final String? orderFUpQVal;
  final String? eKeylessAccess;
  final String? ankaItems;
  final String? vintageCustomHandles;
  final String? vintageCustomHandlesFinishes;
  final String? randtSelectBox;
  final String? markupVal;
  final String? customNotes;
  final String? customSupplierOptions;
  final String? dateOfOrder;
  final String? customOtherOption;
  final String? supplierOrderNo;
  final String? customHanCost;
  final String? quickPdfUrl;
  final String? profile;
  final String? doorModel;
  final String? deliveryCostForQuote;
  final String? installationCostForQuote;
  final String? discountLevel;

  AdminQuotesModel({
     this.quotationNumber,
     this.uniqueNumber,
     this.id,
     this.name,
     this.deliveryPostCode,
     this.quoteDescription,
     this.telephoneNumber,
     this.customerEmail,
     this.saleBonus,
     this.wholeTotal,
     this.thresholdType,
     this.marineGradeVal,
     this.frameSizeHeightWidth,
     this.totalWeightKg,
     this.lhGoalPostE44,
     this.date,
     this.time,
     this.notes,
     this.orderFUpVal,
     this.internalImageURL,
     this.externalImageURL,
     this.orderDateQArray,
     this.orderFUpQVal,
     this.eKeylessAccess,
     this.ankaItems,
     this.vintageCustomHandles,
     this.vintageCustomHandlesFinishes,
     this.randtSelectBox,
     this.markupVal,
     this.customNotes,
     this.customSupplierOptions,
     this.dateOfOrder,
     this.customOtherOption,
     this.supplierOrderNo,
     this.customHanCost,
     this.quickPdfUrl,
     this.profile,
     this.doorModel,
     this.deliveryCostForQuote,
     this.installationCostForQuote,
     this.discountLevel
  });

  factory AdminQuotesModel.fromJson(Map<String, dynamic> json) {
    return AdminQuotesModel(
      quotationNumber: json['quotation_number'] ?? "",
      uniqueNumber: json['uniqueNumber'] ?? "",
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      deliveryPostCode: json['dilevery_post_code_c13'] ?? "",
      quoteDescription: json['quote_desc'] ?? "",
      telephoneNumber: json['telephone_number'] ?? "",
      customerEmail: json['customer_email'] ?? "",
      saleBonus: json['sale_bonus'].toString() ,
      wholeTotal: json['whole_total'] ?? "",
      thresholdType: json['threshold_type'] ?? "",
      marineGradeVal: json['marine_grade_val'] ?? "",
      frameSizeHeightWidth: json['frame_Size_height_Width'] ?? "",
      totalWeightKg: json['total_weight_kg'] ?? "",
      lhGoalPostE44: json['Lh_goal_post_e44'] ?? "",
      date: json['date'] ?? "",
      time: json['time'] ?? "",
      notes: json['notes'] ?? "",
      orderFUpVal: json['order_f_up_val'] ?? "",
      internalImageURL: json['internalImageURL'] ?? "",
      externalImageURL: json['externalImageURL'] ?? "",
      orderDateQArray: json['order_date_q_array'] ?? "",
      orderFUpQVal: json['order_f_up_q_val'] ?? "",
      eKeylessAccess: json['ekeyless_access'] ?? "",
      ankaItems: json['anka_items'] ?? "",
      vintageCustomHandles: json['vintage_custom_handles'] ?? "",
      vintageCustomHandlesFinishes: json['vintage_custom_handles_finishes'] ?? "",
      randtSelectBox: json['randtSelectBox'] ?? "",
      markupVal: json['Markup_val'] ?? "",
      customNotes: json['custom_notes'] ?? "",
      customSupplierOptions: json['custom_supplier_options'] ?? "",
      dateOfOrder: json['date_of_order'] ?? "",
      customOtherOption: json['custom_other_option'] ?? "",
      supplierOrderNo: json['supplier_order_no'] ?? "",
      customHanCost: json['custom_han_cost'] ?? "",
      quickPdfUrl: json['Quick_pdf_url'] ?? "",
      profile: json['profile'] ?? "",
      doorModel: json['door_model'] ?? "",
      deliveryCostForQuote: json['delivery_cost_for_quote'] ?? "",
      installationCostForQuote: json['intallation_cost_for_quote'] ?? "",
      discountLevel: json['Discount_level_for_quote'] ?? ""
    ); 
  }
}

class CompleteResponse {
  final List<AdminQuotesModel> quotes;
  final String? displayName;
  final String? dealerName;

  CompleteResponse({
     required this.quotes,
     this.displayName,
     this.dealerName,
  });

  factory CompleteResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> quoteList = json['quotes'];
    List<AdminQuotesModel> quotes = quoteList.map((quoteJson) => AdminQuotesModel.fromJson(quoteJson)).toList();

    return CompleteResponse(
      quotes: quotes,
      displayName: json['display_name'],
      dealerName: json['dealerName'],
    );
  }
}