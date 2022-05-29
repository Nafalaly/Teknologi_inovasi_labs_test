part of 'play_page_bloc.dart';

@immutable
abstract class PlayPageEvent {}

class IncreaseThePoint extends PlayPageEvent {}

class NextQuestions extends PlayPageEvent {
  final bool isUserAnswerCorrect;
  NextQuestions({required this.isUserAnswerCorrect});
}
