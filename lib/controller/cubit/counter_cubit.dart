import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInit());

  void increase() {
    emit(CounterUpdate(state.count + 1));
  }

  void decrease() {
    emit(CounterUpdate(state.count - 1));
  }
}
