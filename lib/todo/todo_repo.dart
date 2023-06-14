import 'package:http/http.dart' as http;
import 'package:test_app/todo/todo_model.dart';

class TodoRepo {
  Future<TodoModel> getTodoData() async {
    var res = await http.get(Uri.parse("https://dummyjson.com/todos"));
    if (res.statusCode == 200) {
      return todoModelFromJson(res.body);
    } else {
      throw Exception("User data is not loaded");
    }
  }
}
