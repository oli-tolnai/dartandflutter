// https://www.youtube.com/watch?v=792ek6Y9940

void main(){
  
  Map<String, String> planets = {
    "first": "mercury",
    "second": "venus",
    "third": "earth",
    "fourth": "mars",
    "fifth": "jupiter"
  };

  planets["sixth"] = "uranus";

  if(planets.containsKey("third")){
    print(planets.containsKey("third"));
    print(planets["third"]);
  }  

  if (planets.containsValue("uranus")) {
    print(planets.containsValue("uranus"));
  }

  print(planets.remove("first"));
  print(planets.keys);
  print(planets.values);

  print(planets);
  
}