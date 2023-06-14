import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/todo/todo_model.dart';
import 'package:test_app/todo/todo_repo.dart';
import 'package:test_app/todo/todo_view_model.dart';
import 'package:test_app/widgets/circular_loader.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TodoViewModel todoViewModel;
  @override
  void initState() {
    todoViewModel = TodoViewModel(context.read<TodoRepo>())..getToData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo Screen"),
        ),
        body: BlocConsumer<VelocityBloc<TodoModel?>, VelocityState<TodoModel?>>(
          listener: (context, state) {},
          bloc: todoViewModel.todoViewModelBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const CircularLoader();
            } else if (state is VelocityUpdateState) {
              return ListView.builder(
                  itemCount: state.data!.todos!.length,
                  itemBuilder: (context, index) {
                    var todoData = state.data!.todos![index];
                    return ListTile(
                      title: Text(todoData.todo.toString()),
                      subtitle: Text(todoData.completed.toString()),
                    );
                  });
            } else if (state is VelocityFailedState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
