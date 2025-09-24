// https://www.youtube.com/watch?v=5udl_LBpAHk

void main(){
 List<int> scores = [50, 75, 20, 99, 100, 30];

 for (int i = 0; i < scores.length; i++){
  print(scores[i]);
 }

 for (var score in scores.where((a) => a > 50)){
    print("the score is $score");
 }

  var high = scores.reduce((prev, current) => prev > current ? prev : current);
  print(high);
  
  var sum = scores.reduce((prev, current) => prev + current);
  print(sum);


  // compute the sum of all length
  final list = ['a', 'bb', 'ccc'];
  list.fold(0, (sum, current) => sum + current.length); // result is 6
}