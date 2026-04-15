import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context){
    final borderDesign = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text("Currency Converter",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("0.00",
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5,left: 5,right: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Your The Ammount",
                    prefixIcon: Icon(Icons.monetization_on),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: borderDesign,
                    enabledBorder: borderDesign,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5,left: 5,right: 5),
                child: TextButton(
                  onPressed: (){
                    if(kDebugMode){
                      print("button pressed");
                    }
                  }, 
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                  child: Text("CONVERT")
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}