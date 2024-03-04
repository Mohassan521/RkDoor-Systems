class AdminPanelOrders {
  final String? quotationNumber;
  final String? uniqueNumber;
  final String? id;
  final String? name;
  final String? deliveryPostCode;
  final String? quoteDesc;
  final String? telephoneNumber;
  final String? customerEmail;
  final int? saleBonus;
  final String? wholeTotal;
  final String? thresholdType;
  final String? marineGradeVal;
  final String? frameSizeHeightWidth;
  final String? totalWeightKg;
  final String? lhGoalPostE44;
  final String? date;
  final String? time;
  final String? notes;
  final String? ankaDetailsInput;
  final String? ankaDetailsInput2;
  final String? ankaDetailsInput3;
  final String? ankaDetailsInput4;
  final String? ankaDetailsInput5;
  final String? ankaDetailsInput6;
  final String? ankaDetailsInput7;
  final String? ankaDetailsInput8;
  final String? ankaDate;
  final String? orderDate;
  final String? doorCCEmailVal;
  final String? internalImageURL;
  final String? externalImageURL;
  final String? orderStatusVal;
  final String? orderPaymentStatusVal;
  final String? ankaStatusVal;
  final String? anticipatedDateVal;
  final String? orderNVal;
  final String? facDeliveryWeeksVal;
  final String? orderNoVal;
  final String? orderFollowup;
  final List<String>? documents;
  final List<String>? manualQuickDocumentUpload;
  final List<String>? facConfDocuments;
  final List<String>? ankaUploadDocuments;
  final List<String>? invoicesDocuments;
  final List<String>? deliveryDocuments;
  final String? depositAmountPaid;
  final String? depositPayDate;
  final String? addPayAmount;
  final String? addPayDate;
  final String? balPayAmount;
  final String? balPayDate;
  final String? orderFinHisNoteBox;
  final String? balDueBeforeDelivery;
  final String? ekeylessAccess;
  final String? ankaItems;
  final String? vintageCustomHandles;
  final String? vintageCustomHandlesFinishes;
  final String? internalVintageCustomHandles;
  final String? internalVintageCustomHandlesFinishes;
  final String? deliveryCostForQuote;
  final String? installationCostForQuote;
  final String? discountLevelForQuote;
  final String? randtSelectBox;
  final String? markupVal;
  final String? customNotes;
  final String? customSupplierOptions;
  final String? dateOfOrder;
  final String? customOtherOption;
  final String? supplierOrderNo;
  final String? customHanCost;
  final String? internalCustomNotes;
  final String? internalCustomSupplierOptions;
  final String? internalDateOfOrder;
  final String? internalCustomOtherOption;
  final String? internalSupplierOrderNo;
  final String? internalCustomHanCost;
  final String? quickPdfUrl;
  final String? profile;
  final String? doorModel;
  final int? saleStaffBonus;
  final int? adminStaffBonus;

  AdminPanelOrders({
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
    this.orderDate,
    this.doorCCEmailVal,
    this.internalImageURL,
    this.externalImageURL,
    this.orderStatusVal,
    this.orderPaymentStatusVal,
    this.ankaStatusVal,
    this.anticipatedDateVal,
    this.orderNVal,
    this.facDeliveryWeeksVal,
    this.orderNoVal,
    this.orderFollowup,
    this.documents,
    this.manualQuickDocumentUpload,
    this.facConfDocuments,
    this.ankaUploadDocuments,
    this.invoicesDocuments,
    this.deliveryDocuments,
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

  factory AdminPanelOrders.fromJson(Map<String, dynamic> json) {
    return AdminPanelOrders(
      quotationNumber: json['quotation_number'] ?? "",
      uniqueNumber: json['uniqueNumber'] ?? "",
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      deliveryPostCode: json['dilevery_post_code_c13'] ?? "",
      quoteDesc: json['quote_desc'] ?? "",
      telephoneNumber: json['telephone_number'] ?? "",
      customerEmail: json['customer_email'] ?? "",
      saleBonus: json['sale_bonus'] != null
          ? int.tryParse(json['sale_bonus'].toString())
          : null,
      wholeTotal: json['whole_total'] ?? "",
      thresholdType: json['threshold_type'] ?? "",
      marineGradeVal: json['marine_grade_val'] ?? "",
      frameSizeHeightWidth: json['frame_Size_height_Width'] ?? "",
      totalWeightKg: json['total_weight_kg'] ?? "",
      lhGoalPostE44: json['Lh_goal_post_e44'] ?? "",
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
      orderDate: json['order_date'] ?? "",
      doorCCEmailVal: json['door_CC_email_val'] ?? "",
      internalImageURL: json['internalImageURL'] ?? "",
      externalImageURL: json['externalImageURL'] ?? "",
      orderStatusVal: json['order_status_val'] ?? "",
      orderPaymentStatusVal: json['order_payment_status_val'] ?? "",
      ankaStatusVal: json['anka_status_val'] ?? "",
      anticipatedDateVal: json['anticipated_date_val'] ?? "",
      orderNVal: json['order_n_val'] ?? "",
      facDeliveryWeeksVal: json['fac_delivery_weeks_val'] ?? "",
      orderNoVal: json['order_no_val'] ?? "",
      orderFollowup: json['order_followup'] ?? "",
      documents: json['documents'] != null && json['documents'].isNotEmpty
          ? List<String>.from(json['documents'])
          : [],
      manualQuickDocumentUpload: json['manual_quick_document_upload'] != null &&
              json['manual_quick_document_upload'].isNotEmpty
          ? List<String>.from(json['manual_quick_document_upload'])
          : [],
      facConfDocuments: json['fac_conf_documents'] != null &&
              json['fac_conf_documents'].isNotEmpty
          ? List<String>.from(json['fac_conf_documents'])
          : [],
      ankaUploadDocuments: json['anka_uplaod_documents'] != null &&
              json['anka_uplaod_documents'].isNotEmpty
          ? List<String>.from(json['anka_uplaod_documents'])
          : [],
      invoicesDocuments: json['invoices_documents'] != null &&
              json['invoices_documents'].isNotEmpty
          ? List<String>.from(json['invoices_documents'])
          : [],
      deliveryDocuments: json['delivery_documents'] != null &&
              json['delivery_documents'].isNotEmpty
          ? List<String>.from(json['delivery_documents'])
          : [],
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
      vintageCustomHandlesFinishes:
          json['vintage_custom_handles_finishes'] ?? "",
      internalVintageCustomHandles:
          json['internal_vintage_custom_handles'] ?? "",
      internalVintageCustomHandlesFinishes:
          json['internal_vintage_custom_handles_finishes'] ?? "",
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
      internalCustomSupplierOptions:
          json['internal_custom_supplier_options'] ?? "",
      internalDateOfOrder: json['internal_date_of_order'] ?? "",
      internalCustomOtherOption: json['internal_custom_other_option'] ?? "",
      internalSupplierOrderNo: json['internal_supplier_order_no'] ?? "",
      internalCustomHanCost: json['internal_custom_han_cost'] ?? "",
      quickPdfUrl: json['Quick_pdf_url'] ?? "",
      profile: json['profile'] ?? "",
      doorModel: json['door_model'] ?? "",
      saleStaffBonus: json['sale_staff_bonus'] != null
          ? int.tryParse(json['sale_staff_bonus'].toString())
          : null,
      adminStaffBonus: json['Admin_staff_bonus'] != null
          ? int.tryParse(json['Admin_staff_bonus'].toString())
          : null,
    );
  }
}