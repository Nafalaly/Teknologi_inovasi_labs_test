part of 'multi_choice_bloc.dart';

class MultiChoiceState {
  int? currentAnswer;
  late MultipleChoiceModel question;
  MultiChoiceState({this.currentAnswer, MultipleChoiceModel? question}) {
    if (question != null) {
      this.question = question;
    }
  }

  MultiChoiceState copyWith({
    int? currentAnswer,
  }) {
    return MultiChoiceState(
        currentAnswer: currentAnswer ?? this.currentAnswer, question: question);
  }

  bool isValid() {
    return currentAnswer != null;
  }
}
