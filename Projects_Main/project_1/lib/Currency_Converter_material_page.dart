import 'package:flutter/foundation.dart';
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

    return MaterialApp(
      home: Scaffold(
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
                ),Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
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
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextButton(
                    onPressed: (){
                      if(kDebugMode){
                        print("Button Click");
                      }
                    },
                    style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                      fixedSize: WidgetStatePropertyAll(Size(410, 50)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4)
                            )
                          )
                        )
                    ), 
                    child: const Text("CONVERT"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextButton(
                    onPressed: (){
                      if(kDebugMode){
                        print("Button Click");
                      }
                    },
                    style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                      fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4)
                            )
                          )
                        )
                    ), 
                    child: const Text("CONVERT"),
                  ),
                )
              ], 
            ),
          ),
        ),
    );
  }
}
// 11:29


