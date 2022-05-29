part of 'quiz_page_bloc.dart';

@immutable
abstract class QuizPageEvent {}

class QuizPageQuestionTitleChanged extends QuizPageEvent {
  final String title;
  QuizPageQuestionTitleChanged({required this.title});
}

class QuizPageChangeQuizTypeEvent extends QuizPageEvent {
  final String type;
  final QuizModel quizModel;
  QuizPageChangeQuizTypeEvent({required this.type, required this.quizModel});
}

class QuizPageSwitchTabEvent extends QuizPageEvent {
  final int index;
  QuizPageSwitchTabEvent({required this.index});
}

class QuizPageAddQuiz extends QuizPageEvent {
  final QuizModel newQuiz;
  QuizPageAddQuiz({required this.newQuiz});
}
