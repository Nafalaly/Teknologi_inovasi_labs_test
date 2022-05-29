part of 'long_choice_bloc.dart';

class LongEssayChoiceState {
  String answer;
  late LongEssayModel question;
  LongEssayChoiceState({this.answer = '', LongEssayModel? question}) {
    if (question != null) {
      this.question = question;
    }
  }

  LongEssayChoiceState copyWith({
    String? currentAnswer,
  }) {
    return LongEssayChoiceState(
        answer: currentAnswer ?? answer, question: question);
  }

  bool isValid() {
    return answer != '';
  }
}
