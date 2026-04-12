// ===========================   This is Just a personal Note for me to Document what I learned about Flutter   ==========================
// for dart    https://github.com/Rayhan12/CSE-464-Mobile-Application-Development/tree/dart-advanced


//================================= Initial Intro =====================================
/*
  we Must put a widget in the runApp in main.dart to load that widget into the flutter app

*/

void main(){
  runApp(Text("Hello world!", textDirection: TextDirection.ltr,));
}
// here we passed the Widget to run the Text Widget into the runApp

/*
  Note: we save specify the text direction bcz we are using only Text widget as the main root of the Widget tree

    * If the Text is inside of another widget then mostly that widget wil automaticly specify that TextDirection

*/



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

//intially running app this is good but there is a option for key to pass to the mother class which we can to specify if we need

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



//================================= Design (Material) =====================================

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

const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text("This is a line")
    ); // Material
  }

/* Look here we use MaterialApp Widget inside that we use a home otional named property which expects a widget
   we used Text Widget here inside that we used a text to show !

   notice that we didn't use a text direction here. Bcz the MaterialApp retruns the text direction internally

*/



//================================= Scaffold =====================================

/* MaterialApp  gives me
  1. Material Design
  2. navigation
  3. Localisation
  4. Internationalisation
  5. Theming

  problem : So what If I need to design my app like
  1. what goes Top(header) ?
  2. what goes Bottum(Footer)?
  3. I need to add Items In body(Middle).
  4. how Showing a Dialoge box ?

  these Can't be done in MaterialApp So I need Scaffold Widget To specificly Deal with Them.
  Note: Scaffold takes care of Local Part.
        MaterialApp takes care of Global Part.


  It make More sence To have multiple scaffold since there might me Multiple Pages
  But it doesn't make sense to have Multiple MaterialApp to return in Build() method.
*/

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold( 
      body: Center(
        child: Text("Hello World !!!"),
      ),
    ),
  );
}

// here we wrap the text in a Center Widget to center the Text in side of the Scaffold

/* Note: there is a widget tree is forming its standard to extract all the widget and put every piace on separate Folder.
  Basically We import and Export Class just like In JS to organize our Widgets
*/




//*  Important When a mother widget is constant its child or inside of that widget tree all must be constant other wise it will throw error
/* for every const parent widget the child widget must also need to be cost
    but a non cost parent may have cost child
*/


@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: const Scaffold(   // here the scaffold is const
      body: Center(
        child: Text("Hello World !!!"),
      ),
    ),
  );
}

// since the scaffold is cost so all the widget inside of the scaffold must be also scaffold








//================================= BuildContext =====================================


// Example 1
class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text("Hello World !!!"),
        ),
      );
  }
}

/*  How a Flutter can track a Widget in ex.1?

  Ans: Only With BuildContex
   it tells the flutter that look this is were the CurrencyConverterMaterialPage() is defines


   Every widget that is extended with Stateless or statefull I will get access to a BuildContex so Flutter can track it.
*/

//=================================  Importing =====================================

/*
  In Flutter we have to import many things like we did In web Dev in js by "import" keyword

*/

//Relative Importing (import Relative to current File we are now)
import './Currency_Converter_material_page.dart';


// Normal impoting with SDK
import 'package:project_1/Currency_Converter_material_page.dart';



// Note:
import 'package:flutter/material.dart';
/*
  Notice We Normally use package:flutter when we import. wqhy is this?
  because when we create a project the Sateless widget that we extends its get imported from flutter SDK.
  and there is nothine in programming that can be used that isn't defined
*/

//=================================  Column Widget =====================================

/*
   till Now we can add widget in our screens but how can we set the layout?
   like what should go where? we can use column and Row widgets now lets talk about Column widgets

  Column widgets:
    we can set many widgets inside of the column widgets so that each widget can be stacked in vertically

  property Info;
  1. mainAxis --> for Column which is the main Axis? its Y- Axis the vertical Axis
  2. CrossAxis --> For Column which corssed the main axis? its X-Axis that crosses

*/

Widget build(BuildContext context) {
  return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("This is Hello World !!")
        ],
      ),
    );
}


//=================================  ColorBox Widget =====================================

/* Here the text is centered Vertically but it isn't center Horizontally. why is that?
  Here the text is getting the space as much as it needs nothing more so horizontall there is not space. so the 
  text can't go in the center because there is not such space left.

*/
// For expretiment try with colorBox Widget:
@override
Widget build(BuildContext context) {
  return const Scaffold(
      body: ColoredBox(
        color: Color.fromRGBO(255, 0, 0, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("This is Hello World !!")
          ],
        ),
      ),
    );
}



//=================================  TextStyle Widget =====================================

// Example 1
Text("0.00",
  style: TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold
  ),
)

// Example 2
@override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Text("0.00",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
              ),
              )
            ],
          ),
        ),
      );
  }



//=================================  TextField Widget =====================================

/*

  Now we need a user Input which we can get from text field so that can work with them
  

*/

// TextField Decoration
TextField(
  style: TextStyle(
    color: Colors.white 
  ),
  decoration: InputDecoration(
    label: Text("Please Entry Your ammount",
    style: TextStyle(
      color: Colors.white
    ),)
    )
)
/*
  This way we can customize our TextField like its color.
  here the Label is just a placeholder. but when I type it doesn't goes away it stays on the screen but gives the space to write
  inside the textfield
*/



// TextField -> InputDecoration ->  Prefix suffix
TextField(
style: TextStyle(
  color: Colors.white 
),
decoration: InputDecoration(
    hintText: "Please Entry Your ammount",
    hintStyle: TextStyle(
      color: Colors.white70
    ),
    prefixIcon: Icon(Icons.monetization_on),
    prefixIconColor: Colors.white70
  ),
)

/*
  Here the hintText goes away when I write something on the textfield
    prefixicon brings the icon to the start(Left side) of the Textfield
    suffixicon brings the icon to the end(right side) of the Textfield
*/

// TextField -> InputDecoration -> filled color
TextField(
style: TextStyle(
  color: Colors.white 
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
)
/*  

  here with [ fillColor: Colors.white ]  we only tell the flutter to color the background with white. but we didn't give the permission
  so to actully tell flutter to put that color in the widget we type  [  filled: true  ]
  
*/



// TextField -> InputDecoration ->  focusedBorder
TextField(
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
    focusedBorder: OutlineInputBorder(
      // focuseBorder -> when the writting cursure is in the Textfield (its called focuse)
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
        // this strokeAlign is for the border stroke does it inside or ourside of the part of the text field
      ),
    ),
  ),
)

// reminder:   Important When a mother widget is constant its child or inside of that widget tree all must be constant other wise it will throw error


// TextField -> InputDecoration ->  enableBorder
TextField(
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
    focusedBorder: OutlineInputBorder(
      // focuseBorder -> when the writting cursure is in the Textfield (its called focuse)
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
        // this strokeAlign is for the border stroke does it inside or ourside of the part of the text field
      ),
    ),
    
    // copy the same design from focuse
    enabledBorder: OutlineInputBorder(
      // focuseBorder -> when the writting cursure is in the Textfield (its called focuse)
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
        // this strokeAlign is for the border stroke does it inside or ourside of the part of the text field
      ),
    ),
  ),
)

/*
  previously we used focuseBorder. so inside that argument we have some designs related to textfield those designs is applied only when we 
  focuse(meaning writting something or our curser is in the textfield) on the textfield

  so then we restart the app we see another design then when we use the textfield or we can say focus on the textfield we get our desire design thatw e implemented

  therefore we use the same design inside of "focusedBorder" in the "enabledBorder"

  here "enabledBorder" allows use to put the design in the textfield in the start of the app
  so we have  design before focus and after focus. so we made both designs same so it give a illusion that the textfield has a constant designs but
  we know it is applying same design in 2 steps


  Tip: since we using same code we might save it in a variable and reuse it again;
  like:

*/
final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
);

// then we can use:
decoration: InputDecoration(
    focusedBorder: border
    enabledBorder: border
),



//=================================  Padding & Container Widget =====================================
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(vertical: 8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 5,
      ),
    ],
  ),
  child: Text('Hello Container!'),
)

// in contaner we can cutomize more but in padding widgets we can only wrap a anoither widget and set padding property nothing more


//=================================  Button Widget =====================================

/*
  in Material Ui there are 2 types of button 
  1. raised
  2. appears like Text
*/


// for testing we can print in debug mode my checking with if condition
TextButton(
  onPressed: (){
    if(kDebugMode){
      print("Button Click");
    }
  }, 
  child: const Text("Click Me"),
)