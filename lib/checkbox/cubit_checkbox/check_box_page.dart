import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/checkbox/cubit_checkbox/checkbox_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCheckBoxPage1 extends StatelessWidget {
  const MyCheckBoxPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My check box"),
      ),
      body: Column(
        children: [
          50.heightBox,
          BlocBuilder<CheckboxCubit, CheckboxToggleState>(
            builder: (context, state) {
              return Checkbox(
                checkColor: Colors.amber,
                value: state.checkbox,
                onChanged: (val) {
                  BlocProvider.of<CheckboxCubit>(context)
                      .toggleChcekBox(state.checkbox.toggle());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
