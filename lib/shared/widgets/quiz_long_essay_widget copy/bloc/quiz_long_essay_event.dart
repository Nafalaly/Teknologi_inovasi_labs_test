part of 'quiz_long_essay_bloc.dart';

@immutable
abstract class QuizLongEssayEvent {
  const QuizLongEssayEvent();
}

class QuizEssayLongChanged extends QuizLongEssayEvent {
  final String essay;
  const QuizEssayLongChanged({required this.essay});
}

class QuizEssayLongAttemptAdd extends QuizLongEssayEvent {}
