class ArchiveOrdersModel {
  String? id;
  String? userId;
  String? quotationNumber;
  String? uniqueNumber;
  String? name;
  String? dileveryPostCodeC13;
  String? quoteDesc;
  String? telephoneNumber;
  String? customerEmail;
  String? saleBonus;
  String? wholeTotal;
  String? marineGradeVal;
  String? totalWeightKg;
  String? quotationDate;
  String? date;
  String? time;
  String? notes;
  String? ankaDetailVal;
  String? ankaDetailsInput;
  String? ankaDetailsInput2;
  String? ankaDetailsInput3;
  String? ankaDetailsInput4;
  String? ankaDetailsInput5;
  String? ankaDetailsInput6;
  String? ankaDetailsInput7;
  String? ankaDetailsInput8;
  String? ankaDate;
  String? orderDate;
  String? internalImageURL;
  String? externalImageURL;
  String? orderStatusVal;
  String? orderPaymentStatusVal;
  String? ankaStatusVal;
  String? anticipatedDateVal;
  String? orderNVal;
  String? orderNoVal;
  String? orderFollowup;
  String? facDeliveryWeeksVal;
  String? facConfDocuments;
  String? ankaUplaodDocuments;
  String? documents;
  String? manualQuickDocumentUpload;
  String? invoicesDocuments;
  String? deliveryDocuments;
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
  String? saleStaffBonus;
  String? adminStaffBonus;
  String? updatedAdminCustomHandles;

  ArchiveOrdersModel({
    this.id,
    this.userId,
    this.quotationNumber,
    this.uniqueNumber,
    this.name,
    this.dileveryPostCodeC13,
    this.quoteDesc,
    this.telephoneNumber,
    this.customerEmail,
    this.saleBonus,
    this.wholeTotal,
    this.marineGradeVal,
    this.totalWeightKg,
    this.quotationDate,
    this.date,
    this.time,
    this.notes,
    this.ankaDetailVal,
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
    this.internalImageURL,
    this.externalImageURL,
    this.orderStatusVal,
    this.orderPaymentStatusVal,
    this.ankaStatusVal,
    this.anticipatedDateVal,
    this.orderNVal,
    this.orderNoVal,
    this.orderFollowup,
    this.facDeliveryWeeksVal,
    this.facConfDocuments,
    this.ankaUplaodDocuments,
    this.documents,
    this.manualQuickDocumentUpload,
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
    this.saleStaffBonus,
    this.adminStaffBonus,
    this.updatedAdminCustomHandles,
  });

  ArchiveOrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    userId = json['user_id'] ?? "";
    quotationNumber = json['quotation_number'] ?? "";
    uniqueNumber = json['uniqueNumber'] ?? "";
    name = json['name'] ?? "";
    dileveryPostCodeC13 = json['dilevery_post_code_c13'] ?? "";
    quoteDesc = json['quote_desc'] ?? "";
    telephoneNumber = json['telephone_number'] ?? "";
    customerEmail = json['customer_email'] ?? "";
    saleBonus = json['sale_bonus'] ?? "";
    wholeTotal = json['whole_total'] ?? "";
    marineGradeVal = json['marine_grade_val'] ?? "";
    totalWeightKg = json['total_weight_kg'] ?? "";
    quotationDate = json['quotation_date'] ?? "";
    date = json['date'] ?? "";
    time = json['time'] ?? "";
    notes = json['notes'] ?? "";
    ankaDetailVal = json['anka_detail_val'] ?? "";
    ankaDetailsInput = json['anka_details_input'] ?? "";
    ankaDetailsInput2 = json['anka_details_input_2'] ?? "";
    ankaDetailsInput3 = json['anka_details_input_3'] ?? "";
    ankaDetailsInput4 = json['anka_details_input_4'] ?? "";
    ankaDetailsInput5 = json['anka_details_input_5'] ?? "";
    ankaDetailsInput6 = json['anka_details_input_6'] ?? "";
    ankaDetailsInput7 = json['anka_details_input_7'] ?? "";
    ankaDetailsInput8 = json['anka_details_input_8'] ?? "";
    ankaDate = json['anka_date'] ?? "";
    orderDate = json['order_date'] ?? "";
    internalImageURL = json['internalImageURL'] ?? "";
    externalImageURL = json['externalImageURL'] ?? "";
    orderStatusVal = json['order_status_val'] ?? "";
    orderPaymentStatusVal = json['order_payment_status_val'] ?? "";
    ankaStatusVal = json['anka_status_val'] ?? "";
    anticipatedDateVal = json['anticipated_date_val'] ?? "";
    orderNVal = json['order_n_val'] ?? "";
    orderNoVal = json['order_no_val'] ?? "";
    orderFollowup = json['order_followup'] ?? "";
    facDeliveryWeeksVal = json['fac_delivery_weeks_val'] ?? "";
    facConfDocuments = json['fac_conf_documents'] ?? "";
    ankaUplaodDocuments = json['anka_uplaod_documents'] ?? "";
    documents = json['documents'] ?? "";
    manualQuickDocumentUpload = json['manual_quick_document_upload'] ?? "";
    invoicesDocuments = json['invoices_documents'] ?? "";
    deliveryDocuments = json['delivery_documents'] ?? "";
    depositAmountPaid = json['deposit_amount_paid'] ?? "";
    depositPayDate = json['deposit_pay_date'] ?? "";
    addPayAmount = json['add_pay_amount'] ?? "";
    addPayDate = json['add_pay_date'] ?? "";
    balPayAmount = json['bal_pay_amount'] ?? "";
    balPayDate = json['bal_pay_date'] ?? "";
    orderFinHisNoteBox = json['order_fin_his_note_box'] ?? "";
    balDueBeforeDelivery = json['bal_due_before_delivery'] ?? "";
    ekeylessAccess = json['ekeyless_access'] ?? "";
    ankaItems = json['anka_items'] ?? "";
    vintageCustomHandles = json['vintage_custom_handles'] ?? "";
    vintageCustomHandlesFinishes =
        json['vintage_custom_handles_finishes'] ?? "";
    internalVintageCustomHandles =
        json['internal_vintage_custom_handles'] ?? "";
    internalVintageCustomHandlesFinishes =
        json['internal_vintage_custom_handles_finishes'] ?? "";
    customNotes = json['custom_notes'] ?? "";
    customSupplierOptions = json['custom_supplier_options'] ?? "";
    dateOfOrder = json['date_of_order'] ?? "";
    customOtherOption = json['custom_other_option'] ?? "";
    supplierOrderNo = json['supplier_order_no'] ?? "";
    customHanCost = json['custom_han_cost'] ?? "";
    internalCustomNotes = json['internal_custom_notes'] ?? "";
    internalCustomSupplierOptions =
        json['internal_custom_supplier_options'] ?? "";
    internalDateOfOrder = json['internal_date_of_order'] ?? "";
    internalCustomOtherOption = json['internal_custom_other_option'] ?? "";
    internalSupplierOrderNo = json['internal_supplier_order_no'] ?? "";
    internalCustomHanCost = json['internal_custom_han_cost'] ?? "";
    quickPdfUrl = json['Quick_pdf_url'] ?? "";
    saleStaffBonus = json['sale_staff_bonus'] ?? "";
    adminStaffBonus = json['Admin_staff_bonus'] ?? "";
    updatedAdminCustomHandles = json['updatedAdmin_custom_handles'] ?? "";
  }
}
