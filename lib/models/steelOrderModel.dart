class SteelOrderModel {
  String? id;
  String? productType;
  String? steelQNumber;
  String? steelSaleperson;
  String? steelDealerEmail;
  String? steelDealerTelno;
  String? dileveryPostCodeC13;
  String? steelSupplyType;
  String? steelCustomerName;
  String? steelColor;
  String? customerAddress;
  String? customerAddress2;
  String? customerAddress3;
  String? saleBonus;
  String? steelOrderSaleBonus;
  String? steelOrderAdminStaffBonus;
  String? steelSupplier;
  String? emailSaleBouns;
  String? date;
  String? time;
  String? steelCustomerEmail;
  String? steelCustomerTel;
  String? steelTotalOrderValue;
  String? steelDiscount;
  String? steelWeight;
  String? steelDeliveryCost;
  String? steelInstCost;
  String? steelOrderNetVal;
  String? steelFrameSize;
  List<dynamic>? pDFImageURL;
  List<dynamic>? manualPDFImageURL;
  List<dynamic>? steelDelNotes;
  String? steelOrderStatusVal;
  String? steelAnticipatedDate;
  String? steelFacWeekVal;
  String? notes;
  String? steelOrderConfFile;
  String? steelInvoices;
  String? steelFacOrderNoVal;
  String? steelDepositAmountPaid;
  String? steelDepPayDate;
  String? steelAddPayAmount;
  String? steelAddPayDate;
  String? steelBalPayAmount;
  String? steelFinHisNoteBox;
  String? steelBalPayDate;
  String? steelBalDueBeforeDelivery;
  String? steelFormNotes;

  SteelOrderModel(
      {this.id,
      this.productType,
      this.steelQNumber,
      this.steelSaleperson,
      this.steelDealerEmail,
      this.steelDealerTelno,
      this.dileveryPostCodeC13,
      this.steelSupplyType,
      this.steelCustomerName,
      this.steelColor,
      this.customerAddress,
      this.customerAddress2,
      this.customerAddress3,
      this.saleBonus,
      this.steelOrderSaleBonus,
      this.steelOrderAdminStaffBonus,
      this.steelSupplier,
      this.emailSaleBouns,
      this.date,
      this.time,
      this.steelCustomerEmail,
      this.steelCustomerTel,
      this.steelTotalOrderValue,
      this.steelDiscount,
      this.steelWeight,
      this.steelDeliveryCost,
      this.steelInstCost,
      this.steelOrderNetVal,
      this.steelFrameSize,
      this.pDFImageURL,
      this.manualPDFImageURL,
      this.steelDelNotes,
      this.steelOrderStatusVal,
      this.steelAnticipatedDate,
      this.steelFacWeekVal,
      this.notes,
      this.steelOrderConfFile,
      this.steelInvoices,
      this.steelFacOrderNoVal,
      this.steelDepositAmountPaid,
      this.steelDepPayDate,
      this.steelAddPayAmount,
      this.steelAddPayDate,
      this.steelBalPayAmount,
      this.steelFinHisNoteBox,
      this.steelBalPayDate,
      this.steelBalDueBeforeDelivery,
      this.steelFormNotes});

  factory SteelOrderModel.fromJson(Map<String, dynamic> json) {
    var manual_pdf_url = json['ManualPDFImageURL'] ?? [];
    var steel_del_notes = json['Steel_del_notes'] ?? [];
    return SteelOrderModel(
      id: json['id'] ?? '',
      productType: json['product_type'] ?? '',
      steelQNumber: json['steel_q_number'] ?? '',
      steelSaleperson: json['steel_saleperson'] ?? '',
      steelDealerEmail: json['steel_dealer_email'] ?? '',
      steelDealerTelno: json['steel_dealer_telno'] ?? '',
      dileveryPostCodeC13: json['dilevery_post_code_c13'] ?? '',
      steelSupplyType: json['steel_supply_type'] ?? '',
      steelCustomerName: json['steel_customer_name'] ?? '',
      steelColor: json['steel_color'] ?? '',
      customerAddress: json['customer_address'] ?? '',
      customerAddress2: json['customer_address_2'] ?? '',
      customerAddress3: json['customer_address_3'] ?? '',
      saleBonus: json['sale_bonus'] ?? '',
      steelOrderSaleBonus: json['steel_order_sale_bonus'] ?? '',
      steelOrderAdminStaffBonus: json['steel_order_admin_staff_bonus'] ?? '',
      steelSupplier: json['steel_supplier'] ?? '',
      emailSaleBouns: json['email_sale_bouns'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      steelCustomerEmail: json['steel_customer_email'] ?? '',
      steelCustomerTel: json['steel_customer_tel'] ?? '',
      steelTotalOrderValue: json['steel_total_order_value'] ?? '',
      steelDiscount: json['steel_discount'] ?? '',
      steelWeight: json['steel_weight'] ?? '',
      steelDeliveryCost: json['steel_delivery_cost'] ?? '',
      steelInstCost: json['steel_inst_cost'] ?? '',
      steelOrderNetVal: json['steel_order_net_val'] ?? '',
      steelFrameSize: json['steel_frameSize'] ?? '',
      pDFImageURL: json['PDFImageURL'] ?? '',
      manualPDFImageURL: manual_pdf_url != null ? manual_pdf_url : [],
      steelDelNotes: steel_del_notes != null ? steel_del_notes : [],
      steelOrderStatusVal: json['steel_order_status_val'] ?? '',
      steelAnticipatedDate: json['steel_anticipated_date'] ?? '',
      steelFacWeekVal: json['steel_Fac_week_val'] ?? '',
      notes: json['notes'] ?? '',
      steelOrderConfFile: json['Steel_Order_Conf_File'] ?? '',
      steelInvoices: json['Steel_invoices'] ?? '',
      steelFacOrderNoVal: json['steel_fac_order_no_val'] ?? '',
      steelDepositAmountPaid: json['steel_deposit_amount_paid'] ?? '',
      steelDepPayDate: json['steel_dep_pay_date'] ?? '',
      steelAddPayAmount: json['steel_add_pay_amount'] ?? '',
      steelAddPayDate: json['steel_add_pay_date'] ?? '',
      steelBalPayAmount: json['steel_bal_pay_amount'] ?? '',
      steelFinHisNoteBox: json['steel_fin_his_note_box'] ?? '',
      steelBalPayDate: json['steel_bal_pay_date'] ?? '',
      steelBalDueBeforeDelivery: json['steel_bal_due_before_delivery'] ?? '',
      steelFormNotes: json['steel_form_notes'] ?? '',
    );
  }
}
