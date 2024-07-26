part of 'add_counter_bloc.dart';

@immutable
sealed class AddCounterState {}

final class AddCounterInitial extends AddCounterState {}

class Added extends AddCounterState {
  final int number;

  Added({required this.number});
}
