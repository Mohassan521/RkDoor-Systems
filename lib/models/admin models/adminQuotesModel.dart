class AdminQuotesModel {
  final List<QuotationItem> items;

  AdminQuotesModel({required this.items});

  factory AdminQuotesModel.fromJson(Map<String, dynamic> json) {
    List<QuotationItem> items = [];
    json.forEach((key, value) {
      if (value is List) {
        for (var item in value) {
          items.add(QuotationItem.fromJson(item));
        }
      }
    });
    return AdminQuotesModel(items: items);
  }
}

class QuotationItem {
  final String quotationNumber;
  final String uniqueNumber;
  final String id;
  final String name;
  final String deliveryPostCode;
  final String quoteDescription;
  final String telephoneNumber;
  final String customerEmail;
  final String saleBonus;
  final String wholeTotal;
  final String thresholdType;
  final String marineGradeVal;
  final String frameSizeHeightWidth;
  final String totalWeightKg;
  final String lhGoalPostE44;
  final String date;
  final String time;
  final String notes;
  final String orderFUpVal;
  final String internalImageURL;
  final String externalImageURL;
  final String orderDateQArray;
  final String orderFUpQVal;
  final String eKeylessAccess;
  final String ankaItems;
  final String vintageCustomHandles;
  final String vintageCustomHandlesFinishes;
  final String randtSelectBox;
  final String markupVal;
  final String customNotes;
  final String customSupplierOptions;
  final String dateOfOrder;
  final String customOtherOption;
  final String supplierOrderNo;
  final String customHanCost;
  final String quickPdfUrl;
  final String profile;
  final String doorModel;

  QuotationItem({
    required this.quotationNumber,
    required this.uniqueNumber,
    required this.id,
    required this.name,
    required this.deliveryPostCode,
    required this.quoteDescription,
    required this.telephoneNumber,
    required this.customerEmail,
    required this.saleBonus,
    required this.wholeTotal,
    required this.thresholdType,
    required this.marineGradeVal,
    required this.frameSizeHeightWidth,
    required this.totalWeightKg,
    required this.lhGoalPostE44,
    required this.date,
    required this.time,
    required this.notes,
    required this.orderFUpVal,
    required this.internalImageURL,
    required this.externalImageURL,
    required this.orderDateQArray,
    required this.orderFUpQVal,
    required this.eKeylessAccess,
    required this.ankaItems,
    required this.vintageCustomHandles,
    required this.vintageCustomHandlesFinishes,
    required this.randtSelectBox,
    required this.markupVal,
    required this.customNotes,
    required this.customSupplierOptions,
    required this.dateOfOrder,
    required this.customOtherOption,
    required this.supplierOrderNo,
    required this.customHanCost,
    required this.quickPdfUrl,
    required this.profile,
    required this.doorModel,
  });

  factory QuotationItem.fromJson(Map<String, dynamic> json) {
    return QuotationItem(
      quotationNumber: json['quotation_number'],
      uniqueNumber: json['uniqueNumber'],
      id: json['id'],
      name: json['name'],
      deliveryPostCode: json['dilevery_post_code_c13'],
      quoteDescription: json['quote_desc'],
      telephoneNumber: json['telephone_number'],
      customerEmail: json['customer_email'],
      saleBonus: json['sale_bonus'],
      wholeTotal: json['whole_total'],
      thresholdType: json['threshold_type'],
      marineGradeVal: json['marine_grade_val'],
      frameSizeHeightWidth: json['frame_Size_height_Width'],
      totalWeightKg: json['total_weight_kg'],
      lhGoalPostE44: json['Lh_goal_post_e44'],
      date: json['date'],
      time: json['time'],
      notes: json['notes'],
      orderFUpVal: json['order_f_up_val'],
      internalImageURL: json['internalImageURL'],
      externalImageURL: json['externalImageURL'],
      orderDateQArray: json['order_date_q_array'],
      orderFUpQVal: json['order_f_up_q_val'],
      eKeylessAccess: json['ekeyless_access'],
      ankaItems: json['anka_items'],
      vintageCustomHandles: json['vintage_custom_handles'],
      vintageCustomHandlesFinishes: json['vintage_custom_handles_finishes'],
      randtSelectBox: json['randtSelectBox'],
      markupVal: json['Markup_val'],
      customNotes: json['custom_notes'],
      customSupplierOptions: json['custom_supplier_options'],
      dateOfOrder: json['date_of_order'],
      customOtherOption: json['custom_other_option'],
      supplierOrderNo: json['supplier_order_no'],
      customHanCost: json['custom_han_cost'],
      quickPdfUrl: json['Quick_pdf_url'],
      profile: json['profile'],
      doorModel: json['door_model'],
    );
  }
}
