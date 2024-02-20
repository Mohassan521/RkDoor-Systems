class CompletedSteelOrdersModel {
  String? id;
  String? productType;
  String? steelQNumber;
  String? steelSaleperson;
  String? steelDealerEmail;
  String? steelDealerTelno;
  String? dileveryPostCodeC13;
  String? steelSupplyType;
  String? steelCustomerName;
  String? customerAddress;
  String? customerAddress2;
  String? customerAddress3;
  String? saleBonus;
  String? steelSupplier;
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
  String? pDFImageURL;
  List<dynamic>? steelDelNotes;
  String? steelOrderStatusVal;
  String? steelFacOrderNoVal;
  String? steelOrderConfFile;
  String? steelInvoices;
  String? steelAnticipatedDate;
  String? steelFacWeekVal;
  String? notes;
  String? steelDepositAmountPaid;
  String? steelDepPayDate;
  String? steelAddPayAmount;
  String? steelAddPayDate;
  String? steelBalPayAmount;
  String? steelBalPayDate;
  String? steelBalDueBeforeDelivery;
  List<dynamic>? manualPDFImageURL;

  CompletedSteelOrdersModel(
      {this.id,
      this.productType,
      this.steelQNumber,
      this.steelSaleperson,
      this.steelDealerEmail,
      this.steelDealerTelno,
      this.dileveryPostCodeC13,
      this.steelSupplyType,
      this.steelCustomerName,
      this.customerAddress,
      this.customerAddress2,
      this.customerAddress3,
      this.saleBonus,
      this.steelSupplier,
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
      this.steelDelNotes,
      this.steelOrderStatusVal,
      this.steelFacOrderNoVal,
      this.steelOrderConfFile,
      this.steelInvoices,
      this.steelAnticipatedDate,
      this.steelFacWeekVal,
      this.notes,
      this.steelDepositAmountPaid,
      this.steelDepPayDate,
      this.steelAddPayAmount,
      this.steelAddPayDate,
      this.steelBalPayAmount,
      this.steelBalPayDate,
      this.steelBalDueBeforeDelivery,
      this.manualPDFImageURL});

  factory CompletedSteelOrdersModel.fromJson(Map<String, dynamic> json) {
    return CompletedSteelOrdersModel(
        id: json['id'] ?? "",
        productType: json['product_type'] ?? "",
        steelQNumber: json['steel_q_number'] ?? "",
        steelSaleperson: json['steel_saleperson'] ?? "",
        steelDealerEmail: json['steel_dealer_email'] ?? "",
        steelDealerTelno: json['steel_dealer_telno'] ?? "",
        dileveryPostCodeC13: json['dilevery_post_code_c13'] ?? "",
        steelSupplyType: json['steel_supply_type'] ?? "",
        steelCustomerName: json['steel_customer_name'] ?? "",
        customerAddress: json['customer_address'] ?? "",
        customerAddress2: json['customer_address_2'] ?? "",
        customerAddress3: json['customer_address_3'] ?? "",
        saleBonus: json['sale_bonus'] ?? "",
        steelSupplier: json['steel_supplier'] ?? "",
        date: json['date'] ?? "",
        time: json['time'] ?? "",
        steelCustomerEmail: json['steel_customer_email'] ?? "",
        steelCustomerTel: json['steel_customer_tel'] ?? "",
        steelTotalOrderValue: json['steel_total_order_value'] ?? "",
        steelDiscount: json['steel_discount'] ?? "",
        steelWeight: json['steel_weight'] ?? "",
        steelDeliveryCost: json['steel_delivery_cost'] ?? "",
        steelInstCost: json['steel_inst_cost'] ?? "",
        steelOrderNetVal: json['steel_order_net_val'] ?? "",
        steelFrameSize: json['steel_frameSize'] ?? "",
        pDFImageURL: json['PDFImageURL'] ?? "",
        steelDelNotes: json['Steel_del_notes'] ?? [],
        steelOrderStatusVal: json['steel_order_status_val'] ?? "",
        steelFacOrderNoVal: json['steel_fac_order_no_val'] ?? "",
        steelOrderConfFile: json['Steel_Order_Conf_File'] ?? "",
        steelInvoices: json['Steel_invoices'] ?? "",
        steelAnticipatedDate: json['steel_anticipated_date'] ?? "",
        steelFacWeekVal: json['steel_Fac_week_val'] ?? "",
        notes: json['notes'] ?? "",
        steelDepositAmountPaid: json['steel_deposit_amount_paid'] ?? "",
        steelDepPayDate: json['steel_dep_pay_date'] ?? "",
        steelAddPayAmount: json['steel_add_pay_amount'] ?? "",
        steelAddPayDate: json['steel_add_pay_date'] ?? "",
        steelBalPayAmount: json['steel_bal_pay_amount'] ?? "",
        steelBalPayDate: json['steel_bal_pay_date'] ?? "",
        steelBalDueBeforeDelivery: json['steel_bal_due_before_delivery'] ?? "",
        manualPDFImageURL: json['ManualPDFImageURL'] ?? []);
  }
}
