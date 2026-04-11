import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              const Text("0.00",
              style:  TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
              ),
              ),TextField(
                style: const TextStyle(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                    hintText: "Please Entry Your ammount",
                    hintStyle: const TextStyle(
                      color: Colors.black
                    ),
                    prefixIcon: const Icon(Icons.monetization_on),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                ),
            ], 
          ),
        ),
      );
  }
}
// 10:50


