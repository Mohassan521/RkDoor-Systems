class AdminSteelOrder {
  final String? id;
  final String? productType;
  final String? steelQNumber;
  final String? steelSalePerson;
  final String? steelDealerEmail;
  final String? steelDealerTelNo;
  final String? deliveryPostCode;
  final String? steelSupplyType;
  final String? steelCustomerName;
  final String? steelColor;
  final String? customerAddress;
  final String? customerAddress2;
  final String? customerAddress3;
  final String? saleBonus;
  final double? steelOrderSaleBonus;
  final double? steelOrderAdminStaffBonus;
  final String? steelSupplier;
  final String? emailSaleBouns;
  final String? date;
  final String? time;
  final String? steelCustomerEmail;
  final String? steelCustomerTel;
  final String? steelTotalOrderValue;
  final String? steelCustomHandle;
  final String? steelDiscount;
  final String? steelWeight;
  final String? steelDeliveryCost;
  final String? steelInstCost;
  final String? steelOrderNetVal;
  final String? steelFrameSize;
  final List<dynamic>? pdfImageURL;
  final List<dynamic>? manualPDFImageURL;
  final List<dynamic>? steelDelNotes;
  final String? steelOrderStatusVal;
  final String? steelOrderPaymentStatusVal;
  final String? steelFacOrderNoVal;
  final List<dynamic>? steelOrderConfFile;
  final List<dynamic>? steelInvoices;
  final String? steelAnticipatedDate;
  final String? steelFacWeekVal;
  final String? notes;
  final String? steelDepositAmountPaid;
  final String? steelDepPayDate;
  final String? steelAddPayAmount;
  final String? steelAddPayDate;
  final String? steelBalPayAmount;
  final String? steelFinHisNoteBox;
  final String? steelBalPayDate;
  final String? steelBalDueBeforeDelivery;

  AdminSteelOrder({
    this.id,
    this.productType,
    this.steelQNumber,
    this.steelSalePerson,
    this.steelDealerEmail,
    this.steelDealerTelNo,
    this.deliveryPostCode,
    this.steelCustomHandle,
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
    this.pdfImageURL,
    this.manualPDFImageURL,
    this.steelDelNotes,
    this.steelOrderStatusVal,
    this.steelOrderPaymentStatusVal,
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
    this.steelFinHisNoteBox,
    this.steelBalPayDate,
    this.steelBalDueBeforeDelivery,
  });

  factory AdminSteelOrder.fromJson(Map<String, dynamic> json) {
    return AdminSteelOrder(
      id: json['id'] ?? '',
      productType: json['product_type'] ?? '',
      steelQNumber: json['steel_q_number'] ?? '',
      steelSalePerson: json['steel_saleperson'] ?? '',
      steelDealerEmail: json['steel_dealer_email'] ?? '',
      steelDealerTelNo: json['steel_dealer_telno'] ?? '',
      deliveryPostCode: json['dilevery_post_code_c13'] ?? '',
      steelCustomHandle: json['steel_custom_handle'] ?? '',
      steelSupplyType: json['steel_supply_type'] ?? '',
      steelCustomerName: json['steel_customer_name'] ?? '',
      steelColor: json['steel_color'] ?? '',
      customerAddress: json['customer_address'] ?? '',
      customerAddress2: json['customer_address_2'] ?? '',
      customerAddress3: json['customer_address_3'] ?? '',
      saleBonus: json['sale_bonus'] ?? '',
      steelOrderSaleBonus:
          double.parse(json['steel_order_sale_bonus'].toString()),
      steelOrderAdminStaffBonus:
          double.parse(json['steel_order_admin_staff_bonus'].toString()),
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
      pdfImageURL: json['PDFImageURL'] ?? [],
      manualPDFImageURL: json['ManualPDFImageURL'] ?? [],
      steelDelNotes: json['Steel_del_notes'] ?? [],
      steelOrderStatusVal: json['steel_order_status_val'] ?? '',
      steelOrderPaymentStatusVal: json['steel_order_payment_status_val'] ?? '',
      steelFacOrderNoVal: json['steel_fac_order_no_val'] ?? '',
      steelOrderConfFile: json['Steel_Order_Conf_File'] ?? [],
      steelInvoices: json['Steel_invoices'] ?? [],
      steelAnticipatedDate: json['steel_anticipated_date'] ?? '',
      steelFacWeekVal: json['steel_Fac_week_val'] ?? '',
      notes: json['notes'] ?? '',
      steelDepositAmountPaid: json['steel_deposit_amount_paid'] ?? '',
      steelDepPayDate: json['steel_dep_pay_date'] ?? '',
      steelAddPayAmount: json['steel_add_pay_amount'] ?? '',
      steelAddPayDate: json['steel_add_pay_date'] ?? '',
      steelBalPayAmount: json['steel_bal_pay_amount'] ?? '',
      steelFinHisNoteBox: json['steel_fin_his_note_box'] ?? '',
      steelBalPayDate: json['steel_bal_pay_date'] ?? '',
      steelBalDueBeforeDelivery: json['steel_bal_due_before_delivery'] ?? '',
    );
  }
}

class CompletedSteelOrdersResponse {
  List<AdminSteelOrder>? steelOrders;
  final String? dealerName;
  final String? displayName;
  final int? userId;

  CompletedSteelOrdersResponse(
      {this.steelOrders, this.displayName, this.dealerName, this.userId});

  factory CompletedSteelOrdersResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> quoteList = json['quotes'];
    List<AdminSteelOrder> quotes = quoteList
        .map((quoteJson) => AdminSteelOrder.fromJson(quoteJson))
        .toList();

    return CompletedSteelOrdersResponse(
        steelOrders: quotes,
        displayName: json['display_name'],
        dealerName: json['dealerName'],
        userId: json['user_id']);
  }
}
