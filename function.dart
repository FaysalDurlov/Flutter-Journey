void main() {
  greet('foysal', 24, "this is a test");
  int num = giveNum(3,6);
  print(num);
}

void greet(name, age, massage) { // This is a just void funtions that returns nothing.
  print('hello $name \nAge = $age \nYou said: $massage');
}

int giveNum(a,b){
  return a+b;
} // This has a return type



// Optional position name parameter Function
void greatPosParamFun(String name, [int? age, String? massage]){
  print('hello $name \nAge = $age \nYou said: $massage');
}
/*
  Order matters
  You must follow position order
  You cannot skip middle arguments
*/

//Optional named parameter Function
void greatNameParamFun({String? name, int? age, String? massage}){
  print('hello $name \nAge = $age \nYou said: $massage');
}
/*
  Order does NOT matter
  You can skip any parameter
  call ->
  student(name: 'Faysal');
  student(cgpa: 3.80, name: 'Faysal');
  student(age: 24);
  student();
*/

// mandatory Named Function
void greatManNameFunction({required String name, int? age, String? massage }){
  print('hello $name \nAge = $age \nYou said: $massage');
}