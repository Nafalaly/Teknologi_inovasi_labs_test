part of 'multi_extra_choice_bloc.dart';

class MultiExtraChoiceState {
  int? currentAnswer;
  late MultipleChoiceWtExtraEssayModel question;
  bool isChosseCustomInput;
  String answerInput;
  MultiExtraChoiceState(
      {this.currentAnswer,
      MultipleChoiceWtExtraEssayModel? question,
      this.isChosseCustomInput = false,
      this.answerInput = ''}) {
    if (question != null) {
      this.question = question;
    }
  }

  MultiExtraChoiceState copyWith(
      {int? currentAnswer, bool? isChosseCustomInput, String? answerInput}) {
    return MultiExtraChoiceState(
        currentAnswer: currentAnswer ?? this.currentAnswer,
        question: question,
        answerInput: answerInput ?? this.answerInput,
        isChosseCustomInput: isChosseCustomInput ?? this.isChosseCustomInput);
  }

  bool isValid() {
    return currentAnswer != null;
  }
}
