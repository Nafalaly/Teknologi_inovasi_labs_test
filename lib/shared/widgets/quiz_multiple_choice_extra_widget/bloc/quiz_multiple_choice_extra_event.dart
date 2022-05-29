part of 'quiz_multiple_choice_extra_bloc.dart';

@immutable
abstract class QuizMultipleChoiceExtraEvent {
  const QuizMultipleChoiceExtraEvent();
}

class QuizMultipleChoiceExtraChangeTitleChoice
    extends QuizMultipleChoiceExtraEvent {
  final int index;
  final String newTitle;
  const QuizMultipleChoiceExtraChangeTitleChoice(
      {required this.index, required this.newTitle});
}

class QuizMultipleChoiceExtraChangeEssay extends QuizMultipleChoiceExtraEvent {
  final String newTitle;
  const QuizMultipleChoiceExtraChangeEssay({required this.newTitle});
}

class QuizMultipleChoiceExtraSetChoiceAsTrueAnswer
    extends QuizMultipleChoiceExtraEvent {
  final int index;
  const QuizMultipleChoiceExtraSetChoiceAsTrueAnswer({required this.index});
}

class QuizMultipleChoiceExtraEssayMarkAsTrue
    extends QuizMultipleChoiceExtraEvent {}

class QuizMultipleChoiceExtraAttemptAdd extends QuizMultipleChoiceExtraEvent {}

class QuizMultipleChoiceExtraAddChoices extends QuizMultipleChoiceExtraEvent {}
