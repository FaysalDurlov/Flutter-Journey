class Animal{
  String name;
  int age;

  Animal(this.name,this.age);
  void walk(){
    print("walking");
  }

  void makeSound(){
    print("generic Sound");
  }
}

class Cat extends Animal{
  String? CatColor;

  Cat(String name,int age, this.CatColor): super(name,age);

  @override
  void makeSound(){
    print("Meow Meow");
  }
}

void main(){
  Cat myCat = Cat("Tojo",4,"white");
  myCat.walk();
  myCat.makeSound();
  print(myCat.CatColor);
}

