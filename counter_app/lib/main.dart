// to cubix and bloc
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/counter_bloc.dart';
import 'package:flutter_application_1/bloc/sample_bloc/bloc/sample_bloc.dart';
import 'package:flutter_application_1/cubit/counter_cubit.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SampleBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

//to_do_list
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/add_todo_page.dart';
// import 'package:flutter_application_1/cubit/cubit/todo_cubit.dart';
// import 'package:flutter_application_1/todo_list.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TodoCubit(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         initialRoute: '/',
//         routes: {
//           '/': (_) => const TodoList(),
//           '/add-todo': (_) => const AddTodoPage(),
//         },
//       ),
//     );
//   }
// }
