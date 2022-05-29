part of 'quad_extra_choice_bloc.dart';

abstract class QuadExtraChoiceEvent {}

class QuadExtraChoiceChoosingAnswer extends QuadExtraChoiceEvent {
  int index;
  QuadExtraChoiceChoosingAnswer({required this.index});
}

class QuadExtraChoiceSubmit extends QuadExtraChoiceEvent {}

class QuadChooseCustomInput extends QuadExtraChoiceEvent {}

class QuadExtraEssayFill extends QuadExtraChoiceEvent {
  String answer;
  QuadExtraEssayFill({required this.answer});
}
