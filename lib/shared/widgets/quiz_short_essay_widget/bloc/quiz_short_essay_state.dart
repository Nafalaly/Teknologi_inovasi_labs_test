part of 'quiz_short_essay_bloc.dart';

class QuizShortEssayState {
  FormInputState inputState;
  String essayAnswer;
  QuizShortEssayState(
      {this.inputState = const FormInputIdle(), this.essayAnswer = ''});
  QuizShortEssayState copyWith(
      {FormInputState? inputState, String? essayAnswer}) {
    return QuizShortEssayState(
        inputState: inputState ?? this.inputState,
        essayAnswer: essayAnswer ?? this.essayAnswer);
  }

  int validator() {
    if (essayAnswer == '') {
      return 501;
    }
    return 0;
  }
}
