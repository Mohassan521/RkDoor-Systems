import 'package:flutter/material.dart';
import 'package:price_link/services/services.dart';

class AddCategoryModal extends StatefulWidget {
  final TextEditingController category;

  AddCategoryModal({required this.category});
  @override
  _AddCategoryModalState createState() => _AddCategoryModalState();
}

class _AddCategoryModalState extends State<AddCategoryModal> {
  TextEditingController categoryController = TextEditingController();
  NetworkApiServices apiServices = NetworkApiServices();

  @override
  Widget build(BuildContext context) {
    double bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Text(
                  "Add Category",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff941420),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: widget.category,
                decoration: InputDecoration(
                  labelText: "Category Name",
                  fillColor: Color.fromARGB(255, 246, 245, 245),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your apiServices.addInsideFolder logic here
                  print("Category Added: ${categoryController.text}");
                  apiServices.addInsideFolder(widget.category.text);

                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
                style: ElevatedButton.styleFrom(
                  // foreground (text) color

                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
