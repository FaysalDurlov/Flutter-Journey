import 'dart:io';

void main(){
  stdout.write("Type your Name here: ");
  String? name = stdin.readLineSync();
  print(name);
}