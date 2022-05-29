// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

part 'counter_page_state.dart';

class CounterPageCubit extends Cubit<CounterPageState> {
  CounterPageCubit() : super(CounterPageState());

  void increaseNumber() {
    var a = state.counter + 1;
    emit(state.copyWith(counter: a));
  }
}
