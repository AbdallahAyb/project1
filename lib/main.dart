import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyConverterApp(),
    );
  }
}
class MyConverterApp extends StatefulWidget {
  @override
  _MyConverterAppState createState() => _MyConverterAppState();
}

class _MyConverterAppState extends State<MyConverterApp> {
  TextEditingController amountController = TextEditingController();
  double liraToUsdRate = 0.0000111111; // 1 LBP = 0.0000111111 USD
  double usdToLiraRate = 90000.0; // 1 USD = 90000 LBP
  double result = 0.0;
  bool convertToUsd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: convertToUsd ? 'Enter amount in LBP' : 'Enter amount in USD',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _convertCurrency();
              },
              child: Text('Convert',style: TextStyle(color:Colors.orange),),
            ),
            SizedBox(height: 20),
            Text(
              convertToUsd ? 'USD: $result' : 'LBP: $result',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  convertToUsd = !convertToUsd;
                  result = 0.0;
                  amountController.clear();
                });
              },
              child: Text('Switch Conversion'),
            ),
          ],
        ),
      ),
    );
  }

  void _convertCurrency() {
    double inputAmount = double.tryParse(amountController.text) ?? 0.0;
    setState(() {
      result = convertToUsd ? inputAmount * liraToUsdRate : inputAmount * usdToLiraRate;
    });
  }
}