part of 'long_choice_bloc.dart';

abstract class LongEssayChoiceEvent {}

class LongEssayChoiceSubmit extends LongEssayChoiceEvent {}

class EssayLongFill extends LongEssayChoiceEvent {
  final String answer;
  EssayLongFill({required this.answer});
}
