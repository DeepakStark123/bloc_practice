import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/checkbox/cubit_checkbox/checkbox_cubit.dart';
import 'package:test_app/debug/app_observer.dart';
import 'package:test_app/home/home_page.dart';
import 'package:test_app/products/bloc/products_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_app/products/repo/products_repo.dart';
import 'package:test_app/todo/todo_repo.dart';
import 'package:test_app/users/cubit/users_cubit.dart';
import 'package:test_app/users/users_repo/users_repo.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => ProductRepo(),
      ),
      RepositoryProvider(
        create: (context) => UsersRepo(),
      ),
      RepositoryProvider(
        create: (context) => TodoRepo(),
      ),
      // RepositoryProvider(
      //   create: (context) => PostRepo(),
      // ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(ProductRepo()),
        ),
        BlocProvider(
          create: (context) => UsersCubit(UsersRepo()),
        ),
        BlocProvider(
          create: (context) => CheckboxCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Homepage()),
    );
  }
}
