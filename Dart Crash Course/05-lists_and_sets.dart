// https://www.youtube.com/watch?v=OjX0lOCn-8Q
void main(){
  List<int> scores = [10, 12, 32, 43];

  print(scores);

  scores[1] = 9999;
  print(scores[1]);
  scores.add(12);
  // scores.remove(10);
  scores.shuffle();

  for (var score in scores) {
    print("- $score");
  }

  print(scores.reduce((a,b) => a - b));
  print(scores.indexOf(43));



  Set<String> names = {"mari", "orig", "pach"};
  names.add("bowser");
  names.remove("orig");
  print(names);
}