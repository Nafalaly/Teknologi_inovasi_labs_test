part of 'short_choice_bloc.dart';

class ShortEssayChoiceState {
  String answer;
  late ShortEssayModel question;
  ShortEssayChoiceState({this.answer = '', ShortEssayModel? question}) {
    if (question != null) {
      this.question = question;
    }
  }

  ShortEssayChoiceState copyWith({
    String? currentAnswer,
  }) {
    return ShortEssayChoiceState(
        answer: currentAnswer ?? answer, question: question);
  }

  bool isValid() {
    return answer != '';
  }
}
