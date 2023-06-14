import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/users/cubit/users_cubit.dart';
import 'package:test_app/widgets/circular_loader.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users Data"),
        ),
        body: BlocConsumer<UsersCubit, UsersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return const CircularLoader();
            } else if (state is UsersLoadedState) {
              return ListView.builder(
                  itemCount: state.userModelList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Text(
                            state.userModelList[index].username.toString()));
                  });
            } else if (state is UsersErrorState) {
              return Center(
                child: Text(state.errorMessage.toString()),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
