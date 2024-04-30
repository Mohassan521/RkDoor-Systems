class ArchiveSteelOrdersModel {
  String? id;
  String? userId;
  String? uniqueId;
  String? productType;
  String? steelQNumber;
  String? steelSaleperson;
  String? steelDealerEmail;
  String? steelDealerTelno;
  String? dileveryPostCodeC13;
  String? steelSupplyType;
  String? steelVarRate;
  String? steelCustomerName;
  String? steelColor;
  String? customerAddress;
  String? customerAddress2;
  String? customerAddress3;
  String? saleBonus;
  String? steelSupplier;
  String? emailSaleBouns;
  String? steelDate;
  String? steelTime;
  String? steelCustomerEmail;
  String? steelCustomerTel;
  String? steelTotalOrderValue;
  String? steelDiscount;
  String? steelWeight;
  String? steelDeliveryCost;
  String? steelInstCost;
  String? steelOrderNetVal;
  String? steelFrameSize;
  String? steelOrderStatusVal;
  String? steelOrderPaymentStatusVal;
  String? steelOrderSaleBonus;
  String? steelOrderAdminStaffBonus;
  String? pDFImageURL;
  String? manualPDFImageURL;
  String? steelDelNotes;
  String? steelFacOrderNoVal;
  String? steelAnticipatedDate;
  String? steelFacWeekVal;
  String? notes;
  String? steelFormNotes;
  String? steelOrderConfFile;
  String? steelInvoices;

  ArchiveSteelOrdersModel(
      {this.id,
      this.userId,
      this.uniqueId,
      this.productType,
      this.steelQNumber,
      this.steelSaleperson,
      this.steelDealerEmail,
      this.steelDealerTelno,
      this.dileveryPostCodeC13,
      this.steelSupplyType,
      this.steelVarRate,
      this.steelCustomerName,
      this.steelColor,
      this.customerAddress,
      this.customerAddress2,
      this.customerAddress3,
      this.saleBonus,
      this.steelSupplier,
      this.emailSaleBouns,
      this.steelDate,
      this.steelTime,
      this.steelCustomerEmail,
      this.steelCustomerTel,
      this.steelTotalOrderValue,
      this.steelDiscount,
      this.steelWeight,
      this.steelDeliveryCost,
      this.steelInstCost,
      this.steelOrderNetVal,
      this.steelFrameSize,
      this.steelOrderStatusVal,
      this.steelOrderPaymentStatusVal,
      this.steelOrderSaleBonus,
      this.steelOrderAdminStaffBonus,
      this.pDFImageURL,
      this.manualPDFImageURL,
      this.steelDelNotes,
      this.steelFacOrderNoVal,
      this.steelAnticipatedDate,
      this.steelFacWeekVal,
      this.notes,
      this.steelFormNotes,
      this.steelOrderConfFile,
      this.steelInvoices});

  ArchiveSteelOrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    userId = json['user_id'] ?? "";
    uniqueId = json['unique_id'] ?? "";
    productType = json['product_type'] ?? "";
    steelQNumber = json['steel_q_number'] ?? "";
    steelSaleperson = json['steel_saleperson'] ?? "";
    steelDealerEmail = json['steel_dealer_email'] ?? "";
    steelDealerTelno = json['steel_dealer_telno'] ?? "";
    dileveryPostCodeC13 = json['dilevery_post_code_c13'] ?? "";
    steelSupplyType = json['steel_supply_type'] ?? "";
    steelVarRate = json['steel_var_rate'] ?? "";
    steelCustomerName = json['steel_customer_name'] ?? "";
    steelColor = json['steel_color'] ?? "";
    customerAddress = json['customer_address'] ?? "";
    customerAddress2 = json['customer_address_2'] ?? "";
    customerAddress3 = json['customer_address_3'] ?? "";
    saleBonus = json['sale_bonus'] ?? "";
    steelSupplier = json['steel_supplier'] ?? "";
    emailSaleBouns = json['email_sale_bouns'] ?? "";
    steelDate = json['steel_date'] ?? "";
    steelTime = json['steel_time'] ?? "";
    steelCustomerEmail = json['steel_customer_email'] ?? "";
    steelCustomerTel = json['steel_customer_tel'] ?? "";
    steelTotalOrderValue = json['steel_total_order_value'] ?? "";
    steelDiscount = json['steel_discount'] ?? "";
    steelWeight = json['steel_weight'] ?? "";
    steelDeliveryCost = json['steel_delivery_cost'] ?? "";
    steelInstCost = json['steel_inst_cost'] ?? "";
    steelOrderNetVal = json['steel_order_net_val'] ?? "";
    steelFrameSize = json['steel_frameSize'] ?? "";
    steelOrderStatusVal = json['steel_order_status_val'] ?? "";
    steelOrderPaymentStatusVal = json['steel_order_payment_status_val'] ?? "";
    steelOrderSaleBonus = json['steel_order_sale_bonus'] ?? "";
    steelOrderAdminStaffBonus = json['steel_order_admin_staff_bonus'] ?? "";
    pDFImageURL = json['PDFImageURL'] ?? "";
    manualPDFImageURL = json['ManualPDFImageURL'] ?? "";
    steelDelNotes = json['Steel_del_notes'] ?? "";
    steelFacOrderNoVal = json['steel_fac_order_no_val'] ?? "";
    steelAnticipatedDate = json['steel_anticipated_date'] ?? "";
    steelFacWeekVal = json['steel_Fac_week_val'] ?? "";
    notes = json['notes'] ?? "";
    steelFormNotes = json['steel_form_notes'] ?? "";
    steelOrderConfFile = json['Steel_Order_Conf_File'] ?? "";
    steelInvoices = json['Steel_invoices'] ?? "";
  }
}
