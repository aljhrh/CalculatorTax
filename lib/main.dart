import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: 'حساب القيمة المضافة',
          home: new TaxCalculator()));
}
class TaxCalculator extends StatelessWidget {
  double billAmount = 0.0;
  double tipPercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    // Create first input field
    TextField billAmountField = new TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.parse(value);
        } catch (exception) {
          billAmount = 0.0;
        }
      },
      decoration: new InputDecoration(labelText: "المبلغ"),
    );

    // Create another input field
    TextField taxPercentageField = new TextField(
        decoration:
            new InputDecoration(labelText: "القيمة المضافة", hintText: "0.0"),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          try {
            tipPercentage = double.parse(value);
          } catch (exception) {
            tipPercentage = 0.0;
          }
        });

    // Create button
    RaisedButton calculateButton = new RaisedButton(
        child: new Text("احسب"),
        onPressed: () {
          // Calculate tax and total
          double calculatedTax = billAmount * 0.05;
          double total = billAmount + calculatedTax;

          // Generate dialog
          AlertDialog dialog = new AlertDialog(
              content: new Text("القيمة المضافة: \ $calculatedTax \n"
                  "المجموع: \ $total"));

          // Show dialog
          showDialog(
              context: context, builder: (BuildContext context) => dialog);
        });

    Container container = new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
            children: [billAmountField, taxPercentageField, calculateButton]));

    AppBar appBar;
    appBar = new AppBar(title: new Text("حاسبة القيمة المضافة"),
    
    backgroundColor: Colors.lightGreen,
    
    );
    

    Scaffold scaffold = new Scaffold(appBar: appBar, body: container);
    return scaffold;
  }
}
