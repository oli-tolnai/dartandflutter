// https://www.youtube.com/watch?v=v-2rWplEDoA

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {

  final post = await fetchPost();

  print(post.title);
  print(post.userId);
}

// https://api.siposm.hu
// /getDevelopers

Future<Post> fetchPost() async {
  var url = Uri.http('jsonplaceholder.typicode.com', '/posts/2');

  final response = await http.get(url);

  Map<String, dynamic> data = convert.jsonDecode(response.body);

  return Post(data["title"], data["userId"]);
}

class Post{
  String title;
  int userId;

  Post(this.title, this.userId);
}