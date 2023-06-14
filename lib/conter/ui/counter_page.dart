// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/conter/bloc/counter_bloc.dart';
import 'package:test_app/conter/bloc/counter_event.dart';
import 'package:test_app/conter/bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counteer app"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterIncrementState) {
                    return Text(state.count.toString());
                  } else if (state is CounterDecrementState) {
                    return Text(state.count.toString());
                  } else {
                    return Text(0.toString());
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(CounterIncrementEvent());
                },
                child: const Text("Increment")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(CounterDecrementEvent());
                },
                child: const Text("Decrement")),
          ],
        ));
  }
}
