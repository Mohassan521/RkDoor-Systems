class EmployeeList {
  int id;
  String? user_pass;
  String? user_email;
  String? quotation_type;
  String? postCode;
  String? user_status;
  String? display_name;
  String? markup;
  String? maxDiscount;
  String? telephone;
  String? firstName;
  String? lastName;

  EmployeeList(
      {this.display_name,
      required this.id,
      this.user_email,
      this.user_pass,
      this.user_status,
      this.markup,
      this.maxDiscount,
      this.postCode,
      this.quotation_type,
      this.telephone,
      this.firstName,
      this.lastName});

  factory EmployeeList.fromJson(Map<String, dynamic> json) {
    return EmployeeList(
        display_name: json['display_name'] ?? "NA",
        id: int.parse(json['ID'].toString()) ?? 0,
        markup: json['mark_up'] ?? "NA",
        user_email: json['user_email'] ?? "NA",
        maxDiscount: json['max_discount'] ?? "NA",
        user_pass: json['user_pass'] ?? "NA",
        telephone: json['telephone'] ?? "NA",
        user_status: json['user_status'] ?? 'NA',
        quotation_type: json['quotation_type'] ?? "NA",
        postCode: json['post_code_register'] ?? "NA",
        firstName: json['first_name'] ?? "",
        lastName: json['lastname'] ?? "");
  }
}
