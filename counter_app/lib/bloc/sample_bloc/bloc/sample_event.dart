part of 'sample_bloc.dart';

@immutable
sealed class SampleEvent {}

class FetchQuestionEvent extends SampleEvent {}
