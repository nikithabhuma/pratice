part of 'sample_bloc.dart';

@immutable
sealed class SampleState {}

final class SampleInitial extends SampleState {}

class FetchQuestionSuccefullState extends SampleState {}
