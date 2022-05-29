part of 'quad_choice_bloc.dart';

class QuadChoiceState {
  int? currentAnswer;
  late QuadChoiceModel question;
  QuadChoiceState({this.currentAnswer, QuadChoiceModel? question}) {
    if (question != null) {
      this.question = question;
    }
  }

  QuadChoiceState copyWith({
    int? currentAnswer,
  }) {
    return QuadChoiceState(
        currentAnswer: currentAnswer ?? this.currentAnswer, question: question);
  }

  bool isValid() {
    return currentAnswer != null;
  }
}
