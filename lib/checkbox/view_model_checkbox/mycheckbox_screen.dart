import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/checkbox/view_model_checkbox/mycheckbox_view_model.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCheckBoxPage extends StatelessWidget {
  const MyCheckBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyCheckBoxViewModel myCheckBoxViewModel = MyCheckBoxViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My check box"),
      ),
      body: Column(
        children: [
          50.heightBox,
          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
            bloc: myCheckBoxViewModel.mycheckboxBloc,
            builder: (context, state) {
              return Checkbox(
                checkColor: Colors.amber,
                value: state.data,
                onChanged: (val) {
                  myCheckBoxViewModel.mycheckboxBloc
                      .onUpdateData(state.data.toggle());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
