class AdminCompletedOrdersModel {
  String? quotationNumber;
  String? uniqueNumber;
  String? id;
  String? name;
  String? deliveryPostCode;
  String? quoteDesc;
  String? telephoneNumber;
  String? customerEmail;
  int? saleBonus;
  String? wholeTotal;
  String? thresholdType;
  String? marineGradeVal;
  String? frameSizeHeightWidth;
  String? totalWeightKg;
  String? lhGoalPostE44;
  String? quotationDate;
  String? date;
  String? time;
  String? notes;
  String? ankaDetailsInput;
  String? ankaDetailsInput2;
  String? ankaDetailsInput3;
  String? ankaDetailsInput4;
  String? ankaDetailsInput5;
  String? ankaDetailsInput6;
  String? ankaDetailsInput7;
  String? ankaDetailsInput8;
  String? ankaDate;
  String? internalImageUrl;
  String? externalImageUrl;
  String? orderDate;
  String? doorCcEmailVal;
  String? orderStatusVal;
  String? orderPaymentStatusVal;
  String? ankaStatusVal;
  String? anticipatedDateVal;
  String? orderNVal;
  String? orderNoVal;
  String? orderFollowup;
  String? facDeliveryWeeksVal;
  List<dynamic>? documents;
  List<dynamic>? manualQuickDocumentUpload;
  List<dynamic>? facConfDocuments;
  List<dynamic>? ankaUploadDocuments;
  List<dynamic>? deliveryDocuments;
  List<dynamic>? invoicesDocuments;
  String? depositAmountPaid;
  String? depositPayDate;
  String? addPayAmount;
  String? addPayDate;
  String? balPayAmount;
  String? balPayDate;
  String? orderFinHisNoteBox;
  String? balDueBeforeDelivery;
  String? ekeylessAccess;
  String? ankaItems;
  String? vintageCustomHandles;
  String? vintageCustomHandlesFinishes;
  String? internalVintageCustomHandles;
  String? internalVintageCustomHandlesFinishes;
  String? deliveryCostForQuote;
  String? installationCostForQuote;
  String? discountLevelForQuote;
  String? randtSelectBox;
  String? markupVal;
  String? customNotes;
  String? customSupplierOptions;
  String? dateOfOrder;
  String? customOtherOption;
  String? supplierOrderNo;
  String? customHanCost;
  String? internalCustomNotes;
  String? internalCustomSupplierOptions;
  String? internalDateOfOrder;
  String? internalCustomOtherOption;
  String? internalSupplierOrderNo;
  String? internalCustomHanCost;
  String? quickPdfUrl;
  String? profile;
  String? doorModel;
  int? saleStaffBonus;
  int? adminStaffBonus;

  AdminCompletedOrdersModel({
    this.quotationNumber,
    this.uniqueNumber,
    this.id,
    this.name,
    this.deliveryPostCode,
    this.quoteDesc,
    this.telephoneNumber,
    this.customerEmail,
    this.saleBonus,
    this.wholeTotal,
    this.thresholdType,
    this.marineGradeVal,
    this.frameSizeHeightWidth,
    this.totalWeightKg,
    this.lhGoalPostE44,
    this.quotationDate,
    this.date,
    this.time,
    this.notes,
    this.ankaDetailsInput,
    this.ankaDetailsInput2,
    this.ankaDetailsInput3,
    this.ankaDetailsInput4,
    this.ankaDetailsInput5,
    this.ankaDetailsInput6,
    this.ankaDetailsInput7,
    this.ankaDetailsInput8,
    this.ankaDate,
    this.internalImageUrl,
    this.externalImageUrl,
    this.orderDate,
    this.doorCcEmailVal,
    this.orderStatusVal,
    this.orderPaymentStatusVal,
    this.ankaStatusVal,
    this.anticipatedDateVal,
    this.orderNVal,
    this.orderNoVal,
    this.orderFollowup,
    this.facDeliveryWeeksVal,
    this.documents,
    this.manualQuickDocumentUpload,
    this.facConfDocuments,
    this.ankaUploadDocuments,
    this.deliveryDocuments,
    this.invoicesDocuments,
    this.depositAmountPaid,
    this.depositPayDate,
    this.addPayAmount,
    this.addPayDate,
    this.balPayAmount,
    this.balPayDate,
    this.orderFinHisNoteBox,
    this.balDueBeforeDelivery,
    this.ekeylessAccess,
    this.ankaItems,
    this.vintageCustomHandles,
    this.vintageCustomHandlesFinishes,
    this.internalVintageCustomHandles,
    this.internalVintageCustomHandlesFinishes,
    this.deliveryCostForQuote,
    this.installationCostForQuote,
    this.discountLevelForQuote,
    this.randtSelectBox,
    this.markupVal,
    this.customNotes,
    this.customSupplierOptions,
    this.dateOfOrder,
    this.customOtherOption,
    this.supplierOrderNo,
    this.customHanCost,
    this.internalCustomNotes,
    this.internalCustomSupplierOptions,
    this.internalDateOfOrder,
    this.internalCustomOtherOption,
    this.internalSupplierOrderNo,
    this.internalCustomHanCost,
    this.quickPdfUrl,
    this.profile,
    this.doorModel,
    this.saleStaffBonus,
    this.adminStaffBonus,
  });

  factory AdminCompletedOrdersModel.fromJson(Map<String, dynamic> json) {
    return AdminCompletedOrdersModel(
      quotationNumber: json['quotation_number'] ?? "",
      uniqueNumber: json['uniqueNumber'] ?? "",
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      deliveryPostCode: json['dilevery_post_code_c13'] ?? "",
      quoteDesc: json['quote_desc'] ?? "",
      telephoneNumber: json['telephone_number'] ?? "",
      customerEmail: json['customer_email'] ?? "",
      saleBonus: json['sale_bonus'] != null ? int.tryParse(json['sale_bonus'].toString()) : 0,
      wholeTotal: json['whole_total'] ?? "",
      thresholdType: json['threshold_type'] ?? "",
      marineGradeVal: json['marine_grade_val'] ?? "",
      frameSizeHeightWidth: json['frame_Size_height_Width'] ?? "", 
      totalWeightKg: json['total_weight_kg'] ?? "",
      lhGoalPostE44: json['Lh_goal_post_e44'] ?? "",
      quotationDate: json['quotation_date'] ?? "",
      date: json['date'] ?? "",
      time: json['time'] ?? "",
      notes: json['notes'] ?? "",
      ankaDetailsInput: json['anka_details_input'] ?? "",
      ankaDetailsInput2: json['anka_details_input_2'] ?? "",
      ankaDetailsInput3: json['anka_details_input_3'] ?? "",
      ankaDetailsInput4: json['anka_details_input_4'] ?? "",
      ankaDetailsInput5: json['anka_details_input_5'] ?? "",
      ankaDetailsInput6: json['anka_details_input_6'] ?? "", 
      ankaDetailsInput7: json['anka_details_input_7'] ?? "",
      ankaDetailsInput8: json['anka_details_input_8'] ?? "",
      ankaDate: json['anka_date'] ?? "",
      internalImageUrl: json['internalImageURL'] ?? "",
      externalImageUrl: json['externalImageURL'] ?? "",
      orderDate: json['order_date'] ?? "",
      doorCcEmailVal: json['door_CC_email_val'] ?? "",
      orderStatusVal: json['order_status_val'] ?? "",
      orderPaymentStatusVal: json['order_payment_status_val'] ?? "",
      ankaStatusVal: json['anka_status_val'] ?? "",
      anticipatedDateVal: json['anticipated_date_val'] ?? "",
      orderNVal: json['order_n_val'] ?? "",
      orderNoVal: json['order_no_val'] ?? "",
      orderFollowup: json['order_followup'] ?? "", 
      facDeliveryWeeksVal: json['fac_delivery_weeks_val'] ?? "",
      documents: json['documents'] ?? [],
      manualQuickDocumentUpload: json['manual_quick_document_upload'] ?? [],
      facConfDocuments: json['fac_conf_documents'] ?? [],
      ankaUploadDocuments: json['anka_uplaod_documents'] ?? [],
      deliveryDocuments: json['delivery_documents'] ?? [],
      invoicesDocuments: json['invoices_documents'] ?? [],
      depositAmountPaid: json['deposit_amount_paid'] ?? "",
      depositPayDate: json['deposit_pay_date'] ?? "",
      addPayAmount: json['add_pay_amount'] ?? "",
      addPayDate: json['add_pay_date'] ?? "",
      balPayAmount: json['bal_pay_amount'] ?? "",
      balPayDate: json['bal_pay_date'] ?? "", 
      orderFinHisNoteBox: json['order_fin_his_note_box'] ?? "", 
      balDueBeforeDelivery: json['bal_due_before_delivery'] ?? "",
      ekeylessAccess: json['ekeyless_access'] ?? "",
      ankaItems: json['anka_items'] ?? "",
      vintageCustomHandles: json['vintage_custom_handles'] ?? "",
      vintageCustomHandlesFinishes: json['vintage_custom_handles_finishes'] ?? "",
      internalVintageCustomHandles: json['internal_vintage_custom_handles'] ?? "",
      internalVintageCustomHandlesFinishes: json['internal_vintage_custom_handles_finishes'] ?? "",
      deliveryCostForQuote: json['delivery_cost_for_quote'] ?? "",
      installationCostForQuote: json['intallation_cost_for_quote'] ?? "",
      discountLevelForQuote: json['Discount_level_for_quote'] ?? "",
      randtSelectBox: json['randtSelectBox'] ?? "",
      markupVal: json['Markup_val'] ?? "",
      customNotes: json['custom_notes'] ?? "",
      customSupplierOptions: json['custom_supplier_options'] ?? "",
      dateOfOrder: json['date_of_order'] ?? "",
      customOtherOption: json['custom_other_option'] ?? "",
      supplierOrderNo: json['supplier_order_no'] ?? "",
      customHanCost: json['custom_han_cost'] ?? "",
      internalCustomNotes: json['internal_custom_notes'] ?? "",
      internalCustomSupplierOptions: json['internal_custom_supplier_options'] ?? "",
      internalDateOfOrder: json['internal_date_of_order'] ?? "",
      internalCustomOtherOption: json['internal_custom_other_option'] ?? "",
      internalSupplierOrderNo: json['internal_supplier_order_no'] ?? "",
      internalCustomHanCost: json['internal_custom_han_cost'] ?? "",
      quickPdfUrl: json['Quick_pdf_url'] ?? "",
      profile: json['profile'] ?? "",
      doorModel: json['door_model'] ?? "",
      saleStaffBonus: json['sale_staff_bonus'] != null ? int.tryParse(json['sale_staff_bonus'].toString()) : 0,
      adminStaffBonus: json['Admin_staff_bonus'] != null ? int.tryParse(json['Admin_staff_bonus'].toString()) : 0,
    );
  }
}

class CompleteResponseForCompletedOrders {
  List<AdminCompletedOrdersModel> quotes;
  String displayName;
  String dealerName;
  
  CompleteResponseForCompletedOrders({
    required this.quotes,
    required this.displayName,
    required this.dealerName,
  });

  factory CompleteResponseForCompletedOrders.fromJson(Map<String, dynamic> json) {
    List<dynamic> quotesList = json['quotes'];
    List<AdminCompletedOrdersModel> quotes = quotesList.map((quote) => AdminCompletedOrdersModel.fromJson(quote)).toList();

    return CompleteResponseForCompletedOrders(
      quotes: quotes,
      displayName: json['display_name'] ?? '',
      dealerName: json['dealerName'] ?? '',
    );
  }
}
