
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/sigin/bloc/sign_bloc.dart';
import 'package:test_app/sigin/bloc/signin_event.dart';
import 'package:test_app/sigin/bloc/signin_state.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SigInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage.toString(),
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              onChanged: (val) {
                BlocProvider.of<SigInBloc>(context).add(
                  SigInTextChangeEvent(
                      emailController.text, passwordController.text),
                );
              },
              decoration:
                  const InputDecoration(hintText: "Entern email address"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              onChanged: (value) {
                BlocProvider.of<SigInBloc>(context).add(
                  SigInTextChangeEvent(
                      emailController.text, passwordController.text),
                );
              },
              decoration: const InputDecoration(hintText: "Entern password"),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SigInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: state is SignInValidState
                                ? Colors.blue
                                : Colors.grey),
                        onPressed: () {
                          if (state is SignInValidState) {
                            BlocProvider.of<SigInBloc>(context).add(
                              SigInSubmitedEvent(emailController.text,
                                  passwordController.text),
                            );
                          }
                        },
                        child: const Text("SignIn")));
              },
            ),
          ],
        ),
      ),
    );
  }
}
