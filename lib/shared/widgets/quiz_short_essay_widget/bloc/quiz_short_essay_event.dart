part of 'quiz_short_essay_bloc.dart';

@immutable
abstract class QuizShortEssayEvent {
  const QuizShortEssayEvent();
}

class QuizEssayChanged extends QuizShortEssayEvent {
  final String essay;
  const QuizEssayChanged({required this.essay});
}

class QuizEssayAttemptAdd extends QuizShortEssayEvent {}
