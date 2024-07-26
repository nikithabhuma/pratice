part of 'sample_test_bloc.dart';

@immutable
sealed class SampleTestState {}

final class SampleTestInitial extends SampleTestState {}

class FetchQuestionSuccesfulState extends SampleTestState {
  final List<Question> data;

  FetchQuestionSuccesfulState(this.data);
}

class FetchQuestionFailureState extends SampleTestState {}
