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




// to get the data from TextField we can use


final TextEditingController textEditingController = TextEditingController();
// initilizating the controller

Widget build(BuildContext context) {

  return Scaffold(
    body: TextField(

            controller: textEditingController, // Here we assign the controller



            decoration: InputDecoration(
                hintText: "Please Entry Your Ammount",
                hintStyle: const TextStyle(
                  color: Colors.black
                )
              )
          )
  );
 }








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

// button style 
//ex1 
ButtonStyle(
    foregroundColor: WidgetStatePropertyAll(Colors.white),
    backgroundColor: WidgetStatePropertyAll(Colors.black),
    minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4)
          )
        )
      )
)
//ex2
ButtonStyle(
    foregroundColor: WidgetStatePropertyAll(Colors.white),
    backgroundColor: WidgetStatePropertyAll(Colors.black),
    maximumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4)
          )
        )
      )
)

/*
  ex1 explained => here the minimumsize is saying button needs to atlest take as much space left so button must take all space. (even if there is no text inside button the size
                        must take all the space)
  ex2 explained => here maximumSize is saying you can go to max this size but you don't need to if there is not much contained
                    so here I have a small word in button so the button stays small as much it needs to be

*/


// now lets try raised Button (ElevatedButton)
Container( // example of ElevatedButton
  margin: EdgeInsets.only(top: 10),
  padding: EdgeInsets.only(left: 10, right: 10),
  child: ElevatedButton(
    onPressed: (){
      if(kDebugMode){
        print("Button Click");
      }
    },
    style: const ButtonStyle(
      elevation: WidgetStatePropertyAll(50),
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
)

// Notice how we used WidgetStatePropertyAll() all the time we can skip this by only using TextButton.StyleFrom()
Container( // example of TextButton
  padding: EdgeInsets.only(left: 10, right: 10),
  child: TextButton(
    onPressed: (){
      if(kDebugMode){
        print("Button Click");
      }
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
)

// =============================================================== AppBar Widget =================================================
/*  
  Appbar has many name perameter lets talk about 2
  1. actions (we can give a list of widgets) that will be shown on the top right corner of the screeen
  2. leading (we can only give only one widger) that will be shown on the top left corner of the screeen
      altough in example it has text but generaly its used for icon picture logo etc for app

*/

//example
Scaffold(
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
    actions: [                  // action argumnet of AppBar
      Text("widget 1"),
      Text("widget 2")
    ],
    leading: Text("widget_1"), // leading argumnet of AppBar
  )
)


// ======================================================================  Stateful widgets ===================================

// example_1 (throws error)
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return const CurrencyConverterMaterialPage();
  }
}

// example_2 (correct)
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    int x = 0;
    return const CurrencyConverterMaterialPage();
  }
}

/*
  explanation:

  here in ex_1 we are extending a stateless widget. so thre property of stateless is inside of a stateless nothing can be changable or mutable 
    inshort stateless is immutable so if we used (const x = 0) or (final x = 0)  then its fine but except that it means we are changing the varibale which is not allowed in
    stateless widget

  so why ex_2 works?
  here we have a function which is "build" incide that function if we craeted a varibale that means it is a local varibale which in not inside of the stateless widget
    so bcz of the local varibale we can make changes inside that 

*/


//========= Why use statefull widget ???? =====

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int x = 0;
    return const scaffold(
      body: Text(x.toString())
      /*  
          let say we change the value of x here. so what will happen after this?
            1. the value of x will be changed !
            2. since we didn't call build(buildcontext context). so we will not see any changes visually but x has already changed !

          so how can we show the Text in app?

          problem :
          if we change the x value inside here then again call build() function 
          it will build the text with x = 0 bcz thats how we written it and we can't use a varible outside of the build() 
          so what can we do there we are stuck !!!!

          Solution : we use satedful widget here

      */
    );
  }
}


// how can we use syntax for StatefulWidgets ?

// First we extend the class for Sateful
class MyClassForStateFul extends StatefulWidget{

  const MyClassForStateFul({super.key});


  // Inside this we need to  create a new state that can our class use
  @override
  State createState()=> State(); // this requires a Type of State. (State is a type like int,double,String etc)
  // (Don't use this like this below there is a line that we gonna use)

  // but we can't use State() like this cz this is abstruct class so we also need to extend State class;

  // so we will use this line
  @override
  State createState()=> _MyClassForStateFul_State();
}


// since we can't use a abstruct State we will create one and pass it to our public statefulWidget class
class _MyPrivateClassForStateFul_State extends State{
  // here I have created my own State that I made private for sequirity. if I make it public class and use it still that will work in both
  // but its good practise to use as private




  double x = 23.0; // in this state we can use varible outsite of the function.
  // we only can use this in a state class not in stateless or statefull class bcz both are immutable class



  // inside state we also need to override the build function like stateless
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

/*
    here using this what I cant do is I can use a variable inside of the class wherever I want 
    for this feature we need stateful widget

*/

// Finaly we get 
// example of stateful widget
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




// Dart code with statedul setup
class CurrencyConverterMaterialPagee extends StatefulWidget{

  CurrencyConverterMaterialPagee({super.key}){
    print("Constructor");
  }

  @override
  State<CurrencyConverterMaterialPagee> createState(){
    print("Create State");
    return _CurrencyConverterMaterialPagee();
  }
}
class _CurrencyConverterMaterialPagee extends State<CurrencyConverterMaterialPagee>{

  @override
  Widget build(BuildContext context) {
    print("Build Fn");
  }
}

/* output:
    
    I/flutter ( 5328): Constructor
    I/flutter ( 5328): Create State
    I/flutter ( 5328): Build Fn

*/



// remember this example?????
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int x = 0;
    return const scaffold(
      body: Text(x.toString())
      /*  
          let say we change the value of x here. so what will happen after this?
            1. the value of x will be changed !
            2. since we didn't call build(buildcontext context). so we will not see any changes visually but x has already changed !

          so how can we show the Text in app?

          problem :
          if we change the x value inside here then again call build() function 
          it will build the text with x = 0 bcz thats how we written it and we can't use a varible outside of the build() 
          so what can we do there we are stuck !!!!

          Solution : we use satedful widget here

      */
    );
  }
}

/* 
  Note:
  problem:  here to show the change we would call build() again but it can't be loaded in the app bcz then it will start with x = 0 which resets the value of x regardless what we
    had previously.
  
  solution: we will use setState() method which is a method of the Sate class.

*/


// ==================================================================== setState() method =============================================================================

// setSate can only be used inside of a State class and its child classes


class _CurrencyConverterMaterialPagee extends State<CurrencyConverterMaterialPagee>{

  double x = 0;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
              body: Container( // example of TextButton
                      child: ElevatedButton(
                        onPressed: (){

                          // previously we call here the 
                          // build(context);


                          // Butnow  here we used setsate() so this will not reset the value of x. this only set the state doesn't interfere with code reseting like build
                          setState(() {
                            x = double.parse(textEditingController.text)*81;
                          });


                          /*
                            we can also use this like 

                            x = double.parse(textEditingController.text)*81;
                            setState(() {}});

                            this also works fine


                          */

                        },
                        child: const Text("CONVERT")
                      )
                    )
      )
      );
  }   
}

/* explain:  here the setSate notifys the flutter that there is a change in build function of the State class. 
    so rebuild the elementary tree again or we can say build the widgets which are nessecery to rebuilt
  
  setSate only rebuilt that in inside the build functions.
  unlike build() which will rebuilt the entire class which can reset value that we were facing problems



  fact : how serSate knows what to rebuit?

    This is why we use const on each widget as much we can so the setSate knows this is const so we don't have to rebuilt it 
*/










// ====================================================================== intiState() / SateLifeCycle ===================================



//example 1
class CurrencyConverterMaterialPagee extends StatefulWidget{
  CurrencyConverterMaterialPagee({super.key}){
    print("Constructor");
  }
  @override
  State<CurrencyConverterMaterialPagee> createState(){
    print("Create State");
    return _CurrencyConverterMaterialPagee();
  }
}


class _CurrencyConverterMaterialPagee extends State<CurrencyConverterMaterialPagee>{

  // Lets imagine we have a async function here.

  /*
    this is were we wait for a data to be loaded in a variable.


    problem:  so how the flutter will know that we need to wait here for a while to load data then execute the build method?

    solution: We will overrride a Sate method that is initState() then we will put our async code inside of that function block

  */
  @override
  void initState() {
    super.initState();

    // we will write our code here for the initSate after the function call
    print("rebuild");
  }

  @override
  Widget build(BuildContext context) {
    print("Build Fn");
  }
}

/* output:

  I/flutter ( 5328): Constructor
  I/flutter ( 5328): Create State
  I/flutter ( 5328): rebuild
  I/flutter ( 5328): Build Fn

*/




//========== Widget Life cycle of stateful widgets