import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Text("0.01",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
              ),
              ),TextField(
                style: TextStyle(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                    hintText: "Please Entry Your ammount",
                    hintStyle: TextStyle(
                      color: Colors.black
                    ),
                    prefixIcon: Icon(Icons.monetization_on),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
            ], 
          ),
        ),
      );
  }
}
// 10:26


