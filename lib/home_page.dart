import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/sample1/bloc/sample_test_bloc.dart';
import 'package:sample_bloc/sample_bloc/bloc/add_counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  @override
  void initState() {
    print("Hi");
    context.read<SampleBloc>().add(FetchQuestionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          BlocConsumer<AddCounterBloc, AddCounterState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is Added) {
                count = state.number;
                return Text("count = ${state.number}");
              } else {
                return Text("press the button");
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                print("count = $count");

                context.read<AddCounterBloc>().add(add(number: count));

                Text(" after presscount = $count");
              },
              child: Text("add")),
          BlocBuilder<SampleBloc, SampleTestState>(
            builder: (context, state) {
              int count = 0;
              if (state is FetchQuestionSuccesfulState) {
                print("data= ${state.data[0].faQs!.question!}");
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (ctx, index) {
                        return customCard(state.data[index].faQs!.question!,
                            state.data[index].faQs!.answer!);
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

samplecard() {
  return Text("data");
}

customCard(question, answer) {
  return Card(
    child: Column(
      children: [
        Text(question),
        SizedBox(
          height: 15,
        ),
        Text(answer)
      ],
    ),
  );
}
