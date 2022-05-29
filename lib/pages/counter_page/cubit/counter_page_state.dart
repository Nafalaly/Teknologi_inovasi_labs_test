part of 'counter_page_cubit.dart';

class CounterPageState {
  int counter;

  CounterPageState({this.counter = 0});
  CounterPageState copyWith({required int counter}) {
    return CounterPageState(counter: counter);
  }
}
