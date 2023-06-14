import 'package:http/http.dart' as http;
import 'package:test_app/posts/post_model.dart';

class PostRepo {
  Future<PostModel> getPostData() async {
    var res = await http.get(Uri.parse("https://dummyjson.com/posts"));
    if (res.statusCode == 200) {
      return postModelFromJson(res.body);
    } else {
      throw Exception("User data is not loaded");
    }
  }
}
