import 'package:test_app/todo/todo_model.dart';
import 'package:test_app/todo/todo_repo.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

class TodoViewModel {
  final TodoRepo todoRepo;
  TodoViewModel(this.todoRepo);

  final VelocityBloc<TodoModel?> todoViewModelBloc =
      VelocityBloc<TodoModel?>(null);

  getToData() async {
    try {
      var data = await todoRepo.getTodoData();
      todoViewModelBloc.onUpdateData(data);
    } catch (e) {
      todoViewModelBloc.onFailedResponse(error: e.toString());
    }
  }
}
