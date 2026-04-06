// ===========================   This is Just a personal Note for me to Document what I learned about Flutter   ==========================
// for dart    https://github.com/Rayhan12/CSE-464-Mobile-Application-Development/tree/dart-advanced



//================================= Widgets =====================================

// types of widgets:
/*
    1. Stateless
    2. Stateful

    Steless:  means the value or the Sate of that specific components won't change after once it has been created in the APP.
    Steleful:  means the value or the Sate of that specific components might change after once it has been created in the APP.

    Tip: all the names of Widgets start with a Capital latter like "Text" here text is a widget. bcz "T"
*/


class MyApp extends StatelessWidget{  
  @override
  Widget build(BuildContext context) {
    return Text(
    "Hello This is Faysal so ?", 
    textDirection: TextDirection.ltr
    );
  }
}
// here build method has to return a widgets so that the main function can run it.
// here statelessWidget is a abstruct class and its method ("which is buid") must be override each time we extends a Stateless widget

/* intially running app this is good but there is a option for key to pass to the mother class which we can to specify if we need

*/

class MyApp extends StatelessWidget{
    const MyApp({super.key})   // this is shorthand of   MyApp({Key? key}):super(key: key);

    /* here key is just a class to indentify each specific widget with a specific keys. so the flutter can identify a specific widget
    */
   
  @override
  Widget build(BuildContext context) {
    return Text(
    "Hello This is Faysal so ?", 
    textDirection: TextDirection.ltr
    );
  }
}



//================================= Design =====================================

/* As of now we are not following any Design guideline. so We might create a worst design of our app
    where the other co worker might have problem. so We need to follow a Design system
    there are 2 most popular Design:
    1. Material Design (google)
    2. Cupertino Design (Apple)

    for these first we import 1 of these 2 design then we design our app
*/

// like this
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart;


/* after importing how we make our app Follow that specefic design?


    To do that we need to return MaterialApp in out buil method that we returned after extending the stateless widget
*/

@override
Widget build(BuildContext context) {
    return MaterialApp();            // For material App
}

@override
Widget build(BuildContext context) {
    return CupertinoApp();            // For Cupernito App
}
