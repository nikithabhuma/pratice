import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sample_bloc/model/question_model.dart';

part 'sample_test_event.dart';
part 'sample_test_state.dart';

class SampleBloc extends Bloc<SampleTestEvent, SampleTestState> {
  SampleBloc() : super(SampleTestInitial()) {
    // on<SampleEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<FetchQuestionEvent>(fetchQuestionEvent);
    on<FetchUserData>(fetchUserData);
  }

  FutureOr<void> fetchQuestionEvent(
      FetchQuestionEvent event, Emitter<SampleTestState> emit) async {
    final result = await fetchQuestion();
    print("Result: $result");
    emit(FetchQuestionSuccesfulState(result));
  }

  FutureOr<void> fetchUserData(
      FetchUserData event, Emitter<SampleTestState> emit) {
    // final resul =
  }
}

Future<List<Question>> fetchQuestion() async {
  try {
    final response = await http.get(
      Uri.parse("https://diginova-back.onrender.com/api/v1/knowledgebase"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImlvdEBkaWdpbm92YWNvbnRyb2xzLmNvbSIsImFkbWluSWQiOiI2NjhhNjdkZTA4ZjA2YTUwNGZmMmRhYzUiLCJjb21wYW55SWQiOiI2NjM5ZjdkNjU4NWVlOTAzMWM4MGI3YmUiLCJpYXQiOjE3MjEwMjg0MTUsImV4cCI6MTcyMzYyMDQxNX0.cWFmsuy9hEJyl55MfeNUDwi2_0fnayFTfqhmOBxsXEo', // Replace with your actual token
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      // Successfully received a response
      print("question fetch response = ${response.statusCode}");

      // Decode the response body
      final responseBody = response.body;

      // Convert the JSON response to a list of Question objects
      final List<dynamic> jsonList = json.decode(responseBody);

      // Ensure the JSON response is a list of questions
      List<Question> questions = questionFromJson(json.encode(jsonList));

      return questions; // Return the list of Question objects
    } else {
      // Handle unexpected status codes
      print("Failed to load questions, status code: ${response.statusCode}");
      return []; // Return an empty list on failure
    }
  } catch (e) {
    // Handle errors
    log(e.toString());
    return []; // Return an empty list on error
  }
}
