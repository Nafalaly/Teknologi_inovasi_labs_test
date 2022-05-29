part of 'quiz_quad_choice_bloc.dart';

@immutable
abstract class QuizQuadChoiceEvent {
  const QuizQuadChoiceEvent();
}

class QuizQuadChangeTitleChoice extends QuizQuadChoiceEvent {
  final int index;
  final String newTitle;
  const QuizQuadChangeTitleChoice(
      {required this.index, required this.newTitle});
}

class QuizQuadSetChoiceAsTrueAnswer extends QuizQuadChoiceEvent {
  final int index;
  const QuizQuadSetChoiceAsTrueAnswer({required this.index});
}

class QuizQuadAttemptAdd extends QuizQuadChoiceEvent {}
