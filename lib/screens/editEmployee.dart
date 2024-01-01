import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/services/services.dart';

class EditEmployeePage extends StatefulWidget {
  final EmployeeList employee;
  const EditEmployeePage({super.key, required this.employee});

  @override
  State<EditEmployeePage> createState() => _EditEmployeePageState();
}

class _EditEmployeePageState extends State<EditEmployeePage> {
  NetworkApiServices apiServices = NetworkApiServices();

  final TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController quotationTypeController = TextEditingController();

  TextEditingController minimumMarkupController = TextEditingController();

  TextEditingController postCodeController = TextEditingController();

  TextEditingController telephoneController = TextEditingController();

  TextEditingController maxDiscountController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    firstNameController.text = widget.employee.firstName!;
    lastNameController.text = widget.employee.lastName!;
    minimumMarkupController.text = widget.employee.markup ?? "";
    postCodeController.text = widget.employee.postCode ?? "";
    telephoneController.text = widget.employee.telephone ?? "";
    maxDiscountController.text = widget.employee.maxDiscount ?? "";
    emailController.text = widget.employee.user_email!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: Text(
            'Edit : ${widget.employee.display_name}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("First Name"),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: firstNameController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Last Name'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: lastNameController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Quotation Type'),
                      DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: (widget.employee.quotation_type != "")
                            ? widget.employee.quotation_type
                            : "R",
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            widget.employee.quotation_type = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem<String>(
                              value: 'R', child: Text('R')),
                          DropdownMenuItem<String>(
                              value: 'T', child: Text('T')),
                          DropdownMenuItem<String>(
                              value: 'R&T', child: Text('R&T')),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Minimum markup'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: minimumMarkupController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Post Code'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: postCodeController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Telephone'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: telephoneController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Max Discount'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: maxDiscountController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Email'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: emailController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      RoundButton(
                        onTap: () {
                          apiServices.editEmployee(
                              widget.employee.id.toString(),
                              firstNameController.text,
                              lastNameController.text,
                              minimumMarkupController.text,
                              maxDiscountController.text,
                              postCodeController.text,
                              telephoneController.text,
                              emailController.text,
                              widget.employee.quotation_type ?? "");
                        },
                        text: 'Update',
                        color: Color(0xff941420),
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
