// https://www.youtube.com/watch?v=NsrlCADdWdw
void main(){
  final greeting = greet(age: 10, name: "Lajos");

  print(greeting);
}

String greet({String? name = "csacsacsa", required int age}){
  return "Hi, my name is $name, and I am $age";
}