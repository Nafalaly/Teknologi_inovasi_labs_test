part of 'short_choice_bloc.dart';

abstract class ShortEssayChoiceEvent {}

class ShortEssayChoiceSubmit extends ShortEssayChoiceEvent {}

class EssayFill extends ShortEssayChoiceEvent {
  final String answer;
  EssayFill({required this.answer});
}
