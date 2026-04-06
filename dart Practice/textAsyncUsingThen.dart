import "dart:async";

import "asyncAwait.dart";

Future<String> fetchUserInfo(int id){

  return Future.delayed(Duration(seconds: 3),(){
    if(id == 1){
    return "Alice";
  }else if(id == 2){
    return "Bob";
  }else{
    throw "User Not Found !";
  }
  });
}

Future<void>laodUserInfo(int UserID){
  return Future.delayed(Duration(seconds: 1),(){

    print("Loading Data");

  }).then(
    (_){
    return fetchUserInfo(UserID).then((name){

      print("User Name: $name");

    }).catchError((e){

      print("Error: $e");
      
    });
    }
  );
}


void main() async{
  print("======= Async Demo ====");
  await laodUserInfo(2);
}