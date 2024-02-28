class OrdersModel {
  String? quotationNumber;
  String? uniqueNumber;
  String? id;
  String? name;
  String? dileveryPostCodeC13;
  String? quoteDesc;
  String? telephoneNumber;
  String? customerEmail;
  String? saleBonus;
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
  String? internalImageURL;
  String? externalImageURL;
  String? orderDate;
  String? doorCCEmailVal;
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
  List<dynamic>? ankaUplaodDocuments;
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

  OrdersModel(
      {this.quotationNumber,
      this.uniqueNumber,
      this.id,
      this.name,
      this.dileveryPostCodeC13,
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
      this.internalImageURL,
      this.externalImageURL,
      this.orderDate,
      this.doorCCEmailVal,
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
      this.ankaUplaodDocuments,
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
      this.doorModel});

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    var deliveryDocuments = json['delivery_documents'] ?? [];
    var invoice_documents = json['invoices_documents'] ?? [];
    var documents = json['documents'];
    var manual_quick_document_upload =
        json['manual_quick_document_upload'] ?? [];
    var fac_conf_documents = json['fac_conf_documents'] ?? [];
    var anka_uplaod_documents = json['anka_uplaod_documents'] ?? [];

    return OrdersModel(
      quotationNumber: json['quotation_number'] ?? "",
      uniqueNumber: json['uniqueNumber'] ?? "",
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      dileveryPostCodeC13: json['dilevery_post_code_c13'] ?? "",
      quoteDesc: json['quote_desc'] ?? "",
      telephoneNumber: json['telephone_number'] ?? "",
      customerEmail: json['customer_email'] ?? "",
      saleBonus: json['sale_bonus'].toString(),
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
      ankaDate: json['anka_date'] ?? "NA",
      internalImageURL: json['internalImageURL'] ?? "NA",
      externalImageURL: json['externalImageURL'] ?? "NA",
      orderDate: json['order_date'] ?? "NA",
      doorCCEmailVal: json['door_CC_email_val'] ?? "NA",
      orderStatusVal: json['order_status_val'] ?? "NA",
      orderPaymentStatusVal: json['order_payment_status_val'] ?? "NA",
      ankaStatusVal: json['anka_status_val'] ?? "NA",
      anticipatedDateVal: json['anticipated_date_val'] ?? "NA",
      orderNVal: json['order_n_val'] ?? "NA",
      orderNoVal: json['order_no_val'] ?? "NA",
      orderFollowup: json['order_followup'] ?? "NA",
      facDeliveryWeeksVal: json['fac_delivery_weeks_val'] ?? "NA",
      documents: documents,
      manualQuickDocumentUpload: manual_quick_document_upload,
      facConfDocuments: fac_conf_documents,
      ankaUplaodDocuments: anka_uplaod_documents,
      deliveryDocuments: deliveryDocuments,
      invoicesDocuments: invoice_documents,
      depositAmountPaid: json['deposit_amount_paid'] ?? "NA",
      depositPayDate: json['deposit_pay_date'] ?? "NA",
      addPayAmount: json['add_pay_amount'] ?? "NA",
      addPayDate: json['add_pay_date'] ?? "NA",
      balPayAmount: json['bal_pay_amount'] ?? "NA",
      balPayDate: json['bal_pay_date'] ?? "NA",
      orderFinHisNoteBox: json['order_fin_his_note_box'] ?? "NA",
      balDueBeforeDelivery: json['bal_due_before_delivery'] ?? "NA",
      ekeylessAccess: json['ekeyless_access'] ?? "NA",
      ankaItems: json['anka_items'] ?? "NA",
      vintageCustomHandles: json['vintage_custom_handles'] ?? "NA",
      vintageCustomHandlesFinishes:
          json['vintage_custom_handles_finishes'] ?? "NA",
      internalVintageCustomHandles:
          json['internal_vintage_custom_handles'] ?? "NA",
      internalVintageCustomHandlesFinishes:
          json['internal_vintage_custom_handles_finishes'] ?? "NA",
      randtSelectBox: json['randtSelectBox'] ?? "NA",
      markupVal: json['Markup_val'] ?? "NA",
      customNotes: json['custom_notes'] ?? "NA",
      customSupplierOptions: json['custom_supplier_options'] ?? "NA",
      dateOfOrder: json['date_of_order'] ?? "NA",
      customOtherOption: json['custom_other_option'] ?? "NA",
      supplierOrderNo: json['supplier_order_no'] ?? "NA",
      customHanCost: json['custom_han_cost'] ?? "NA",
      internalCustomNotes: json['internal_custom_notes'] ?? "NA",
      internalCustomSupplierOptions:
          json['internal_custom_supplier_options'] ?? "NA",
      internalDateOfOrder: json['internal_date_of_order'] ?? "NA",
      internalCustomOtherOption: json['internal_custom_other_option'] ?? "NA",
      internalSupplierOrderNo: json['internal_supplier_order_no'] ?? "NA",
      internalCustomHanCost: json['internal_custom_han_cost'] ?? "NA",
      quickPdfUrl: json['Quick_pdf_url'] ?? "NA",
      profile: json['profile'] ?? "NA",
      doorModel: json['door_model'] ?? "NA",
    );
  }
}
