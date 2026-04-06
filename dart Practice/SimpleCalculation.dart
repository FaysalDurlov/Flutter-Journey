import "dart:io";

void main(){
  stdout.write("Write Your First Number: ");
  double number_1 = double.parse(stdin.readLineSync()!);
  stdout.write("Write Your Second Name: ");
  double  number_2 = double.parse(stdin.readLineSync()!);

  print("This the Addition ${number_1} + ${number_2} = ${(number_2+number_1).round()}\nThis the Substraction ${number_1} - ${number_2} = ${(number_1 - number_2).round()}");
  print("This the Multiplication ${number_1} + ${number_2} = ${(number_2*number_1).round()}\nThis the Division ${number_1} - ${number_2} = ${(number_1 / number_2).round()}\n");
}