import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/services/services.dart';

class EditSteelOrder extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final SteelOrderModel model;
  const EditSteelOrder(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      required this.model});

  @override
  State<EditSteelOrder> createState() => _EditSteelOrderState();
}

class _EditSteelOrderState extends State<EditSteelOrder> {
  String productType = "";
  String useDealerAddress = "NO";
  String vat = "";
  String supply = "";
  String color = "";
  String discount = "";
  TextEditingController cname = TextEditingController();
  TextEditingController qnum = TextEditingController();
  TextEditingController dealer = TextEditingController();
  TextEditingController salesperson = TextEditingController();
  TextEditingController caddress1 = TextEditingController();
  TextEditingController caddress2 = TextEditingController();
  TextEditingController caddress3 = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController caddressIfDifferent = TextEditingController();
  TextEditingController frame = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController totalValue = TextEditingController();
  TextEditingController deliveryCost = TextEditingController();
  TextEditingController totalWeight = TextEditingController();
  TextEditingController netShareValue = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productType = widget.model.productType ?? "";
    cname.text = widget.model.steelCustomerName ?? "";
    qnum.text = widget.model.steelQNumber ?? "";
    dealer.text = widget.model.steelSaleperson ?? "";
    salesperson.text = widget.model.steelDealerEmail ?? "";
    // useDealerAddress = widget.model
    // vat = widget.model
    supply = widget.model.steelSupplyType ?? "";
    caddress1.text = widget.model.customerAddress ?? "";
    caddress2.text = widget.model.customerAddress2 ?? "";
    caddress3.text = widget.model.customerAddress3 ?? "";
    postcode.text = widget.model.dileveryPostCodeC13 ?? "";
    color = widget.model.steelColor ?? "";
    caddressIfDifferent.text = widget.model.customerAddress ?? "";
    frame.text = widget.model.steelFrameSize ?? "";
    email.text = widget.model.steelCustomerEmail ?? "";
    telephone.text = widget.model.steelCustomerTel ?? "";
    totalValue.text = widget.model.steelTotalOrderValue ?? "";
    discount = widget.model.steelDiscount ?? "";
    deliveryCost.text = widget.model.steelDeliveryCost ?? "";
    totalWeight.text = widget.model.steelWeight ?? "";
    netShareValue.text = widget.model.steelOrderNetVal ?? "";
    notes.text = widget.model.notes ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Steel Order Form',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product Type',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: productType,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    productType = newValue ?? productType;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: "", child: Center(child: Text(""))),
                  DropdownMenuItem<String>(
                      value: 'STANDARD HINGED',
                      child: Center(child: Text('STANDARD HINGED'))),
                  DropdownMenuItem<String>(
                      value: 'SOUNND REDUCTION',
                      child: Center(child: Text('SOUNND REDUCTION'))),
                  DropdownMenuItem<String>(
                      value: 'FD30 HINGED',
                      child: Center(child: Text('FD30 HINGED'))),
                  DropdownMenuItem<String>(
                      value: 'SLIDING', child: Center(child: Text('SLIDING'))),
                  DropdownMenuItem<String>(
                      value: 'BI-FOLD', child: Center(child: Text('BI-FOLD'))),
                  DropdownMenuItem<String>(
                      value: 'FIXED WINDOW',
                      child: Center(child: Text('FIXED WINDOW'))),
                  DropdownMenuItem<String>(
                      value: 'POCKET DOOR PANNEL',
                      child: Center(child: Text('POCKET DOOR PANNEL'))),
                  DropdownMenuItem<String>(
                      value: 'VARIOUS', child: Center(child: Text('VARIOUS'))),
                  DropdownMenuItem<String>(
                      value: 'EXTERNAL DOORS',
                      child: Center(child: Text('EXTERNAL DOORS'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Name',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: cname,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Quotation Number',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: qnum,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Dealer',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: dealer,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Salesperson',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: salesperson,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Use Dealer Address',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: useDealerAddress,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    useDealerAddress = newValue ?? useDealerAddress;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'NO', child: Center(child: Text('NO'))),
                  DropdownMenuItem<String>(
                      value: 'YES', child: Center(child: Text('YES'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'VAT Rate',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: vat,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    vat = newValue ?? vat;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: "", child: Center(child: Text(""))),
                  DropdownMenuItem<String>(
                      value: 'STANDARD 20%',
                      child: Center(child: Text('STANDARD 20%'))),
                  DropdownMenuItem<String>(
                      value: 'REDUCED 5%',
                      child: Center(child: Text('REDUCED 5%'))),
                  DropdownMenuItem<String>(
                      value: 'NEW BUILD 0% ',
                      child: Center(child: Text('NEW BUILD 0% '))),
                  DropdownMenuItem<String>(
                      value: 'EXCEMPT 0%',
                      child: Center(child: Text('EXCEMPT 0%'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Supply Type',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: supply,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    supply = newValue ?? supply;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: "", child: Center(child: Text(""))),
                  DropdownMenuItem<String>(
                      value: 'SUPPLY ONLY',
                      child: Center(child: Text('SUPPLY ONLY'))),
                  DropdownMenuItem<String>(
                      value: 'Installation RKDS',
                      child: Center(child: Text('Installation RKDS'))),
                  DropdownMenuItem<String>(
                      value: 'Survey Only',
                      child: Center(child: Text('Survey Only'))),
                  DropdownMenuItem<String>(
                      value: 'Installation - CB',
                      child: Center(child: Text('Installation - CB'))),
                  DropdownMenuItem<String>(
                      value: 'Installation Direct - CB',
                      child: Center(child: Text('Installation Direct - CB'))),
                  DropdownMenuItem<String>(
                      value: 'Installation - PB',
                      child: Center(child: Text('Installation - PB'))),
                  DropdownMenuItem<String>(
                      value: 'Installation Direct- PB',
                      child: Center(
                          child: Text('Installation Installation - PB'))),
                  DropdownMenuItem<String>(
                      value: 'Installation - Other',
                      child: Center(child: Text('Installation - Other'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Address 1',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: caddress1,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Address 2',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: caddress2,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Address 3',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: caddress3,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Post Code',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: postcode,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Colour',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: color,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    color = newValue ?? color;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: "", child: Center(child: Text(""))),
                  DropdownMenuItem<String>(
                      value: 'RAL 9005 MS',
                      child: Center(child: Text('RAL 9005 MS'))),
                  DropdownMenuItem<String>(
                      value: 'RAL 9003 MS',
                      child: Center(child: Text('RAL 9003 MS'))),
                  DropdownMenuItem<String>(
                      value: 'RAL 7021 MS',
                      child: Center(child: Text('RAL 7021 MS'))),
                  DropdownMenuItem<String>(
                      value: 'RAL 7039 MS',
                      child: Center(child: Text('RAL 7039 MS'))),
                  DropdownMenuItem<String>(
                      value: 'RAL 7022 MS',
                      child: Center(child: Text('RAL 7022 MS'))),
                  DropdownMenuItem<String>(
                      value: 'DB703 MS',
                      child: Center(child: Text('DB703 MS'))),
                  DropdownMenuItem<String>(
                      value: 'Installation Installation - PB',
                      child: Center(
                          child: Text('Installation Installation - PB'))),
                  DropdownMenuItem<String>(
                      value: 'CUSTOM COLOUR',
                      child: Center(child: Text('CUSTOM COLOUR'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Address (if different to above)',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                //controller: dealerController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Frame Size',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: frame,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Email',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: email,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Tel Number',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: telephone,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Total Order Value (incl VAT)',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: totalValue,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Discount',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: discount,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    discount = newValue ?? discount;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: "", child: Center(child: Text(""))),
                  DropdownMenuItem<String>(
                      value: '0', child: Center(child: Text('0%'))),
                  DropdownMenuItem<String>(
                      value: '5', child: Center(child: Text('5%'))),
                  DropdownMenuItem<String>(
                      value: '10', child: Center(child: Text('10%'))),
                  DropdownMenuItem<String>(
                      value: '15', child: Center(child: Text('15%'))),
                  DropdownMenuItem<String>(
                      value: '20', child: Center(child: Text('20%'))),
                  DropdownMenuItem<String>(
                      value: '25', child: Center(child: Text('25%'))),
                  DropdownMenuItem<String>(
                      value: '30', child: Center(child: Text('30%'))),
                  DropdownMenuItem<String>(
                      value: '35', child: Center(child: Text('35%'))),
                  DropdownMenuItem<String>(
                      value: '40', child: Center(child: Text('40%'))),
                  DropdownMenuItem<String>(
                      value: '45', child: Center(child: Text('45%'))),
                  DropdownMenuItem<String>(
                      value: '50', child: Center(child: Text('50%'))),
                  DropdownMenuItem<String>(
                      value: '60', child: Center(child: Text('60%'))),
                  DropdownMenuItem<String>(
                      value: 'other', child: Center(child: Text('other'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Delivery Cost',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: deliveryCost,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Total Weight (kg.)',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: totalWeight,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Net Order Value',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: netShareValue,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Notes',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: notes,
                maxLines: 6,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                onTap: () {
                  NetworkApiServices().editSteelOrders(
                      widget.model.id!,
                      productType,
                      widget.dealerId,
                      cname.text,
                      qnum.text,
                      dealer.text,
                      salesperson.text,
                      supply,
                      caddress1.text,
                      caddress2.text,
                      caddress3.text,
                      postcode.text,
                      color,
                      frame.text,
                      email.text,
                      telephone.text,
                      totalValue.text,
                      discount,
                      totalValue.text,
                      totalWeight.text,
                      netShareValue.text,
                      notes.text);
                },
                text: 'Save',
                color: Color(0xff941420),
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
