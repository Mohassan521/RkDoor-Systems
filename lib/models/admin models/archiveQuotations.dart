class ArchiveQuotationsModel {
  String? id;
  String? userId;
  String? uniqueId;
  String? quotationNumber;
  String? uniqueNumber;
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
  String? date;
  String? time;
  String? notes;
  String? internalImageURL;
  String? externalImageURL;
  String? orderDateQArray;
  String? orderFUpVal;
  String? orderFUpQVal;
  String? ekeylessAccess;
  String? ankaItems;
  String? vintageCustomHandles;
  String? vintageCustomHandlesFinishes;
  String? internalVintageCustomHandles;
  String? internalVintageCustomHandlesFinishes;
  String? deliveryCostForQuote;
  String? intallationCostForQuote;
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
  String? jsonData;

  ArchiveQuotationsModel(
      {this.id,
      this.userId,
      this.uniqueId,
      this.quotationNumber,
      this.uniqueNumber,
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
      this.date,
      this.time,
      this.notes,
      this.internalImageURL,
      this.externalImageURL,
      this.orderDateQArray,
      this.orderFUpVal,
      this.orderFUpQVal,
      this.ekeylessAccess,
      this.ankaItems,
      this.vintageCustomHandles,
      this.vintageCustomHandlesFinishes,
      this.internalVintageCustomHandles,
      this.internalVintageCustomHandlesFinishes,
      this.deliveryCostForQuote,
      this.intallationCostForQuote,
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
      this.jsonData});

  ArchiveQuotationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    uniqueId = json['unique_id'];
    quotationNumber = json['quotation_number'];
    uniqueNumber = json['uniqueNumber'];
    name = json['name'];
    dileveryPostCodeC13 = json['dilevery_post_code_c13'];
    quoteDesc = json['quote_desc'];
    telephoneNumber = json['telephone_number'];
    customerEmail = json['customer_email'];
    saleBonus = json['sale_bonus'];
    wholeTotal = json['whole_total'];
    thresholdType = json['threshold_type'];
    marineGradeVal = json['marine_grade_val'];
    frameSizeHeightWidth = json['frame_Size_height_Width'];
    totalWeightKg = json['total_weight_kg'];
    lhGoalPostE44 = json['Lh_goal_post_e44'];
    date = json['date'];
    time = json['time'];
    notes = json['notes'];
    internalImageURL = json['internalImageURL'];
    externalImageURL = json['externalImageURL'];
    orderDateQArray = json['order_date_q_array'];
    orderFUpVal = json['order_f_up_val'];
    orderFUpQVal = json['order_f_up_q_val'];
    ekeylessAccess = json['ekeyless_access'];
    ankaItems = json['anka_items'];
    vintageCustomHandles = json['vintage_custom_handles'];
    vintageCustomHandlesFinishes = json['vintage_custom_handles_finishes'];
    internalVintageCustomHandles = json['internal_vintage_custom_handles'];
    internalVintageCustomHandlesFinishes =
        json['internal_vintage_custom_handles_finishes'];
    deliveryCostForQuote = json['delivery_cost_for_quote'];
    intallationCostForQuote = json['intallation_cost_for_quote'];
    discountLevelForQuote = json['Discount_level_for_quote'];
    randtSelectBox = json['randtSelectBox'];
    markupVal = json['Markup_val'];
    customNotes = json['custom_notes'];
    customSupplierOptions = json['custom_supplier_options'];
    dateOfOrder = json['date_of_order'];
    customOtherOption = json['custom_other_option'];
    supplierOrderNo = json['supplier_order_no'];
    customHanCost = json['custom_han_cost'];
    internalCustomNotes = json['internal_custom_notes'];
    internalCustomSupplierOptions = json['internal_custom_supplier_options'];
    internalDateOfOrder = json['internal_date_of_order'];
    internalCustomOtherOption = json['internal_custom_other_option'];
    internalSupplierOrderNo = json['internal_supplier_order_no'];
    internalCustomHanCost = json['internal_custom_han_cost'];
    quickPdfUrl = json['Quick_pdf_url'];
    profile = json['profile'];
    doorModel = json['door_model'];
    jsonData = json['json_data'];
  }
}
