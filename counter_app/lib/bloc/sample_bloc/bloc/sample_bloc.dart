import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc() : super(SampleInitial()) {
    // on<SampleEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<FetchQuestionEvent>(fetchQuestionEvent);
  }

  FutureOr<void> fetchQuestionEvent(
      FetchQuestionEvent event, Emitter<SampleState> emit) async {
    final result = await fetchQuestion();
  }
}

fetchQuestion() async {
  try {
    final response = await http.get(
        Uri.parse("https://diginova-back.onrender.com/api/v1/knowledgebase"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImlvdEBkaWdpbm92YWNvbnRyb2xzLmNvbSIsImFkbWluSWQiOiI2NjhhNjdkZTA4ZjA2YTUwNGZmMmRhYzUiLCJjb21wYW55SWQiOiI2NjM5ZjdkNjU4NWVlOTAzMWM4MGI3YmUiLCJpYXQiOjE3MjEwMjg0MTUsImV4cCI6MTcyMzYyMDQxNX0.cWFmsuy9hEJyl55MfeNUDwi2_0fnayFTfqhmOBxsXEo', // Assuming it's a Bearer token
        });
    print("question fetch response = ${response.statusCode}");
    print("question fetch response body = ${response.body}");
  } catch (e) {
    log(e.toString());
  }
}
