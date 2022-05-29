part of 'multi_choice_bloc.dart';

abstract class MultiChoiceEvent {}

class MultiChoiceChoosingAnswer extends MultiChoiceEvent {
  int index;
  MultiChoiceChoosingAnswer({required this.index});
}

class MultiChoiceSubmit extends MultiChoiceEvent {}
