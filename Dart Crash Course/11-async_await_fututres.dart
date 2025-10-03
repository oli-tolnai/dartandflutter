// https://www.youtube.com/watch?v=i5qLpkfa8NQ

void main() async {

  // then
  //  fetchPost().then((p)  {
  //     print(p.title);
  //     print(p.userId);
  //  });

  //async await
  final post = await fetchPost();
  print(post.title);

}

Future<Post> fetchPost() {
  const delay = Duration(seconds: 3);


  return Future.delayed(delay, (){
    return Post('my post', 123);
  });   
}


class Post {
  String title;
  int userId;

  Post(this.title, this.userId);
}