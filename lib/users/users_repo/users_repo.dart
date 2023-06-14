import 'package:http/http.dart' as http;
import 'package:test_app/users/model/users_model.dart';

class UsersRepo {
  Future<List<UsersModel>> getUserData() async {
    var res =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (res.statusCode == 200) {
      return usersModelFromJson(res.body);
    } else {
      throw Exception("User data is not loaded");
    }
  }
}
