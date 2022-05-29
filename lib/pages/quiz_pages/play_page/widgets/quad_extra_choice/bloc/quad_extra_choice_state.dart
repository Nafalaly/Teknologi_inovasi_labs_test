part of 'quad_extra_choice_bloc.dart';

class QuadExtraChoiceState {
  int? currentAnswer;
  late QuadChoiceWtExtraEssayModel question;
  bool isChosseCustomInput;
  String answerInput;
  QuadExtraChoiceState(
      {this.currentAnswer,
      QuadChoiceWtExtraEssayModel? question,
      this.isChosseCustomInput = false,
      this.answerInput = ''}) {
    if (question != null) {
      this.question = question;
    }
  }

  QuadExtraChoiceState copyWith(
      {int? currentAnswer, bool? isChosseCustomInput, String? answerInput}) {
    return QuadExtraChoiceState(
        currentAnswer: currentAnswer ?? this.currentAnswer,
        question: question,
        answerInput: answerInput ?? this.answerInput,
        isChosseCustomInput: isChosseCustomInput ?? this.isChosseCustomInput);
  }

  bool isValid() {
    return currentAnswer != null;
  }
}
