import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_counter_event.dart';
part 'add_counter_state.dart';

class AddCounterBloc extends Bloc<AddCounterEvent, AddCounterState> {
  AddCounterBloc() : super(AddCounterInitial()) {
    on<add>(adding);
  }

  FutureOr<void> adding(add event, Emitter<AddCounterState> emit) {
    emit(Added(number: event.number + 1));
  }
}
