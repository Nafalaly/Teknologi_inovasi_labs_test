part of 'quiz_long_essay_bloc.dart';

class QuizLongEssayState {
  FormInputState inputState;
  String essayAnswer;
  QuizLongEssayState(
      {this.inputState = const FormInputIdle(), this.essayAnswer = ''});
  QuizLongEssayState copyWith(
      {FormInputState? inputState, String? essayAnswer}) {
    return QuizLongEssayState(
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
