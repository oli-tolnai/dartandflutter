// https://www.youtube.com/watch?v=Od7UP8FyYu8


void main(){

  var noodles = MenuItem("ved noodles", 9.99);
  var pizza = Pizza(["mushroom", "veg"], "vegg", 16.99);


  print(noodles.format());
  print(pizza.format());

  // use toString()
  print("");
  print(noodles);
  print(pizza);

}


class MenuItem{
  String title;
  double price;

  MenuItem(this.title, this.price);

  String format(){
    return "$title -> $price";
  }

  @override
  String toString() {
    return format();
  }

} 

class Pizza extends MenuItem{
  List<String> toppings;


  Pizza(this.toppings, super.title, super.price);

  @override
  String format() {
    var formattedTopping = "Contains:";

    for (var topping in toppings) {
      //formattedTopping += ' $topping';
      formattedTopping = '$formattedTopping $topping';
    }

    return "$title -> $price HUF\n$formattedTopping";
  }

  @override
  String toString() {
    return "Instance of pizza: $title, $price, $toppings";
  }

}