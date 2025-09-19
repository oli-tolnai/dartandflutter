void main() {
  var name = "Oliver";
  name = "James";

  print(name);

  final age; // you cant change the value after it is set 
  age = 31; // you can set the value only once 
  print(age);

  const isOpen = true; // you cant change the value bc what you give here is the constant value
  print(isOpen);

  // difference between final and const is that final can be set at runtime but const is compile time constant. So when you use the final keyword you can set the value later in the code but when you use const you have to set the value immediately.
  // when we dont know the value at compile time we use final, for example when we get the value from user input or from a database or from an API


  /*
  print(age + 10);
  print(age - 10);
  print(age * 10);
  print(age / 5);
  print(age % 10);
  */


  print("my name is $name and I am ${age} years old");
  // if there is a person object with a name property we can do this
  // print("my name is ${person.name} and I am ${person.age} years old"); 
  // we use ${} when we want to access a property or method of an object inside a string interpolation
  // interpolation means inserting a variable or expression inside a string

 
}