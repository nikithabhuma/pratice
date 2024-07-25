import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/counter_bloc.dart';
import 'package:flutter_application_1/bloc/sample_bloc/bloc/sample_bloc.dart';
import 'package:flutter_application_1/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatefulWidget {
  const IncDecPage({super.key});

  @override
  State<IncDecPage> createState() => _IncDecPageState();
}

class _IncDecPageState extends State<IncDecPage> {
  @override
  void initState() {
    print("increment page");
    context.read<SampleBloc>().add(FetchQuestionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncremented());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecremented());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
