part of 'sample_test_bloc.dart';

@immutable
sealed class SampleTestEvent {}

class FetchQuestionEvent extends SampleTestEvent {}

class FetchUserData extends SampleTestEvent {}
