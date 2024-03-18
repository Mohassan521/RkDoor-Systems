import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/services/services.dart';

class QuoteAnalysisForAdmin extends StatelessWidget {
  final String? dealerId;
  final String? quoteId;
  const QuoteAnalysisForAdmin({super.key,this.dealerId, this.quoteId});

  @override
  Widget build(BuildContext context) {
    print("fetched dealer id and quote id: ${dealerId} ${quoteId}");
    NetworkApiServices apiServices = NetworkApiServices();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Quote Analysis', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff941420),
      ),
      body: FutureBuilder(
        future: apiServices.getQuotesRecord(dealerId!, quoteId!),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            Center(child: Text('No data available here'));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
              child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0, right: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('Customer Name'),
                //       Text("${snapshot.data != null ? snapshot.data!.quotationNumber : ""}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                //     ],
                //   ),
                // ),
                Text('Customer Name: ${snapshot.data != null ? snapshot.data!.customerName : ""}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
                Text('Quote Number: ${snapshot.data != null ? snapshot.data!.quotationNumber : ""}',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Markup Applied: '),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0%" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.markup : "0%"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discount Applied: '),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.discount : "0"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cost (Excl. VAT) : '),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.costPrice : "0"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Net Sale (Excl. VAT): '),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.netSalePrice : "0"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('VAT Amount: '),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.vatValue : "0"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Sale Value (Incl VAT ):'),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.totalSalePrice : "0"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Gross Margin Amount:'),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.grossMarginAmount : "0"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Gross Margin %:'),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0%" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.grossMarginPercent : "0%"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sale Bonus:'),
                    Text('${snapshot.data != null && snapshot.data!.quotationType == "T" ? "0" : snapshot.data != null && snapshot.data!.quotationType == "R" ? snapshot.data!.saleBonus : "0"} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Profile:'),
                    Text('${snapshot.data != null ? snapshot.data!.profile : ""} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Door Model:'),
                    Text('${snapshot.data != null ? snapshot.data!.doorModel : ""} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Overall Size:'),
                    Text('${snapshot.data != null ? "${snapshot.data!.overallFrameSizeHeight} ${snapshot.data!.overallFrameSizeWidth}" : ""} '),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Outside Door Sash colour:'),
                    Flexible(child: Text('${snapshot.data != null ? snapshot.data!.doorSashOutsidecolors : ""} ', textAlign: TextAlign.end,)),
                    
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Inside Door Sash colour:'),
                    Flexible(child: Text('${snapshot.data != null ? snapshot.data!.doorSashInsidecolors : ""} ', textAlign: TextAlign.end,)),
                    
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RoundButton(onTap: (){
                  Navigator.pop(context);
                },
                text: 'Close',
                color: Color(0xff941420),
                width: double.infinity,
                
                )
              ],
                      ),
            ),
          );

        },),
    );
  }
}