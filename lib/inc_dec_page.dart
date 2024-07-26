
// import 'package:flutter/material.dart';

// import 'package:sample_bloc/sample_bloc/bloc/sample_bloc.dart';

// class IncDecPage extends StatefulWidget {
//   const IncDecPage({super.key});

//   @override
//   State<IncDecPage> createState() => _IncDecPageState();
// }

// class _IncDecPageState extents State<IncDecPage>{
//   @override
//   void initState(){
//     print("Increment page");
//     context.read<SampleBloc>().add(FetchQuestionEvent());
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final counterBloc = BlocProvider.of<CounterBloc>(context);
//     return Scaffold(
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               counterBloc.add(CounterIncremented());
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               counterBloc.add(CounterDecremented());
//             },
//             tooltip: 'Decrement',
//             child: const Icon(Icons.minimize),
//           ),
//         ],
//       ),
//     );
//   }
// }
