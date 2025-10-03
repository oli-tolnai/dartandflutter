// https://www.youtube.com/watch?v=8MywaeBqFmI

import 'dart:ffi';

void main(){

  var noodles = MenuItem("ved noodles", 9.99);
  var pizza = Pizza(["mushroom", "veg"], "vegg", 16.99);
  var roast = MenuItem("veggoe rpast dommer", 12.49);
  var kebab = MenuItem("plant kebab", 7.49);

  print("$noodles, $pizza, $roast, $kebab");



  var foods = Collection<MenuItem>(
    'MenuItem', [noodles, pizza, roast, kebab]
    );

  var random = foods.randomItem();

  print(random);

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


class Collection<T> {
  String name;
  List<T> data;

  Collection(this.name, this.data);

  T randomItem(){
    data.shuffle();

    return data[0];
  }
}