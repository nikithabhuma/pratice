part of 'add_counter_bloc.dart';

@immutable
sealed class AddCounterEvent {}

class add extends AddCounterEvent {
  final int number;

  add({required this.number});
}
