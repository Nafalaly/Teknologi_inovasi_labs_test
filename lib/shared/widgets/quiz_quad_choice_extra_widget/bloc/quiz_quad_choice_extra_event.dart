part of 'quiz_quad_choice_extra_bloc.dart';

@immutable
abstract class QuizQuadChoiceExtraEvent {
  const QuizQuadChoiceExtraEvent();
}

class QuizQuadChoiceExtraChangeTitleChoice extends QuizQuadChoiceExtraEvent {
  final int index;
  final String newTitle;
  const QuizQuadChoiceExtraChangeTitleChoice(
      {required this.index, required this.newTitle});
}

class QuizQuadChoiceExtraChangeEssay extends QuizQuadChoiceExtraEvent {
  final String newTitle;
  const QuizQuadChoiceExtraChangeEssay({required this.newTitle});
}

class QuizQuadChoiceExtraSetChoiceAsTrueAnswer
    extends QuizQuadChoiceExtraEvent {
  final int index;
  const QuizQuadChoiceExtraSetChoiceAsTrueAnswer({required this.index});
}

class QuizQuadChoiceExtraEssayMarkAsTrue extends QuizQuadChoiceExtraEvent {}

class QuizQuadChoiceExtraAttemptAdd extends QuizQuadChoiceExtraEvent {}
