// https://www.youtube.com/watch?v=R5wAK_kgqjo

void main() {
  // title, price, format() -> string
  MenuItem noodles = MenuItem('veg noodles', 9.99);
  var pizza = Pizza(["mushrooms", "peppers"], "veg volcano", 15.99);

  print(noodles.title);
  print(noodles.price);
  print(pizza.title);
  print(pizza.price);
  
  print(pizza.format());
  print(noodles.format());

  print("-----------------------------");

  var jani = Person("János", 14);
  var bela = Student("primary school", "Béla", 12);

  jani.format();
  bela.format();


}

class MenuItem{
  String title;
  double price;

  // constructor, one way to do it
  // MenuItem(String title, double price ){
  //   this.title = title;
  //   this.price = price;
  // }
  // constructor, another way to do it
  //MenuItem(String this.title, double this.price);
  // or just:
  MenuItem(this.title, this.price);

  String format(){
    return "$title\t-->\t$price HUF";
  }
}


class Pizza extends MenuItem{
  List<String> toppings;

  //Pizza(List<String> this.toppings, String title,  double price): super(title, price);
  // shorthand:
  Pizza(this.toppings, super.title,  super.price);


}



class Person{
  String name;
  int age;

  Person(this.name, this.age);

  void format(){
    print("My name is $name and I'm $age");
  }
}


class Student extends Person{
  String schoolType;

  Student(this.schoolType, super.name, super.age);

  @override
  void format() {
    // TODO: implement format
    print("My name is $name, I'm $age and I'm going to a $schoolType");
  }
}