mixin Flyable{
  void Fly(){
    print("I Belive I can Fly !");
  }
  void Land(){
    print("I Belive I can Land !");
  }
}

mixin Swimmable{
  void Swim(){
    print("Swim Swim");
  }
}

abstract class Bird with Flyable, Swimmable{
  String name;
  int age;

  Bird(this.name,this.age);

  void makeSound();

  void run(){
    print("runing");
  }
}

class Duck extends Bird{


  Duck(String name, int age): super(name, age);

  @override
  void makeSound(){
    print("Quak Quak");
  }

  @override
  void run(){
    print("Duck Running");
  }
}

void main(){
  Duck myDuck = Duck("Donald",2);
  myDuck.run();
  myDuck.makeSound();
  myDuck.Swim();
  myDuck.Fly();
  print(myDuck.toString());
}