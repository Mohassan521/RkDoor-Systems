class CompletedOrders {
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
  String? quotationDate;
  String? date;
  String? time;
  String? notes;
  String? internalImageURL;
  String? externalImageURL;
  String? orderDate;
  String? orderStatusVal;
  String? anticipatedDateVal;
  String? orderNVal;
  String? orderNoVal;
  String? orderFollowup;
  List<dynamic>? documents;
  List<dynamic>? deliveryDocuments;
  List<dynamic>? invoicesDocuments;

  CompletedOrders(
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
      this.quotationDate,
      this.date,
      this.time,
      this.notes,
      this.internalImageURL,
      this.externalImageURL,
      this.orderDate,
      this.orderStatusVal,
      this.anticipatedDateVal,
      this.orderNVal,
      this.orderNoVal,
      this.orderFollowup,
      this.documents,
      this.deliveryDocuments,
      this.invoicesDocuments});

  factory CompletedOrders.fromJson(Map<String, dynamic> json) {
    return CompletedOrders(
        quotationNumber: json['quotation_number'],
        uniqueNumber: json['uniqueNumber'],
        id: json['id'],
        name: json['name'],
        dileveryPostCodeC13: json['dilevery_post_code_c13'],
        quoteDesc: json['quote_desc'],
        telephoneNumber: json['telephone_number'],
        customerEmail: json['customer_email'],
        saleBonus: json['sale_bonus'],
        wholeTotal: json['whole_total'],
        quotationDate: json['quotation_date'],
        date: json['date'],
        time: json['time'],
        notes: json['notes'],
        internalImageURL: json['internalImageURL'],
        externalImageURL: json['externalImageURL'],
        orderDate: json['order_date'],
        orderStatusVal: json['order_status_val'],
        anticipatedDateVal: json['anticipated_date_val'],
        orderNVal: json['order_n_val'],
        orderNoVal: json['order_no_val'],
        orderFollowup: json['order_followup'],
        documents: json['documents'] ?? [],
        deliveryDocuments: json['delivery_documents'] ?? [],
        invoicesDocuments: json['invoices_documents'] ?? []);
  }
}
