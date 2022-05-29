part of 'quad_choice_bloc.dart';

abstract class QuadChoiceEvent {}

class QuadChoiceChoosingAnswer extends QuadChoiceEvent {
  int index;
  QuadChoiceChoosingAnswer({required this.index});
}

class QuadChoiceSubmit extends QuadChoiceEvent {}
