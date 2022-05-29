part of 'multi_extra_choice_bloc.dart';

abstract class MultiExtraChoiceEvent {}

class MultiExtraChoiceChoosingAnswer extends MultiExtraChoiceEvent {
  int index;
  MultiExtraChoiceChoosingAnswer({required this.index});
}

class MultiExtraChoiceSubmit extends MultiExtraChoiceEvent {}

class MultiChooseCustomInput extends MultiExtraChoiceEvent {}

class MultiExtraEssayFill extends MultiExtraChoiceEvent {
  String answer;
  MultiExtraEssayFill({required this.answer});
}
