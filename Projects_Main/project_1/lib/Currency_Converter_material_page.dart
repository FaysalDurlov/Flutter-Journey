import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class CurrencyConverterMaterialPagee extends StatefulWidget{

  const CurrencyConverterMaterialPagee({super.key});

  @override
  State<CurrencyConverterMaterialPagee> createState()=>_CurrencyConverterMaterialPagee();
}

class _CurrencyConverterMaterialPagee extends State<CurrencyConverterMaterialPagee>{
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    double result = 0.00;
    final TextEditingController textEditingController = TextEditingController();
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Currency Converter",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
          elevation: 30,
          shadowColor: Colors.black,
        ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Text(
                  result.toString(),
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textEditingController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    decoration: InputDecoration(
                        hintText: "Please Entry Your Ammount",
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
                ),
                
                // Button
                Container( // example of TextButton
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      result = double.parse(textEditingController.text)*81;
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      fixedSize: const Size(410, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            )
                        )
                    ),
                    child: const Text("CONVERT")
                  )
                ),
              ]
            ),
          ),
        ),
    );
  }
}

// 12:16


