// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test_app/bloc/internet_bloc.dart';
// import 'package:test_app/bloc/internet_state.dart';
import 'package:test_app/cubit/internet_cubit.dart';

class InternetCheckPage extends StatelessWidget {
  const InternetCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Intnetcheck App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocConsumer<InternetCubit, InternetSateteCubit>(
              listener: (context, state) {
                if (state == InternetSateteCubit.gained) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Internet Connected"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state == InternetSateteCubit.lost) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No Internet Connection"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state == InternetSateteCubit.gained) {
                  return const Text("connected");
                } else if (state == InternetSateteCubit.lost) {
                  return const Text("No Internet connection");
                } else {
                  return const Text("Loading...");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
