part of 'quiz_multiple_choice_bloc.dart';

@immutable
abstract class QuizMultipleChoiceChoiceEvent {
  const QuizMultipleChoiceChoiceEvent();
}

class QuizMultipleChoiceChangeTitleChoice
    extends QuizMultipleChoiceChoiceEvent {
  final int index;
  final String newTitle;
  const QuizMultipleChoiceChangeTitleChoice(
      {required this.index, required this.newTitle});
}

class QuizMultipleChoiceSetChoiceAsTrueAnswer
    extends QuizMultipleChoiceChoiceEvent {
  final int index;
  const QuizMultipleChoiceSetChoiceAsTrueAnswer({required this.index});
}

class QuizMultipleChoiceAttemptAdd extends QuizMultipleChoiceChoiceEvent {}

class QuizMultipleChoiceAddChoices extends QuizMultipleChoiceChoiceEvent {}
