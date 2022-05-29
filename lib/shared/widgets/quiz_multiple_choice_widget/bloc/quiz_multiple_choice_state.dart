part of 'quiz_multiple_choice_bloc.dart';

class QuizMultipleChoiceChoiceState {
  final List<String> alphabeticOrder = ['A', 'B', 'C', 'D'];
  List<TextEditingController> textfieldController =
      List.generate(4, (index) => TextEditingController());
  List<ChoiceModel> choices =
      List.generate(4, (index) => ChoiceModel(title: ''));
  FormInputState inputState;

  QuizMultipleChoiceChoiceState(
      {List<ChoiceModel>? choices,
      this.inputState = const FormInputIdle(),
      List<TextEditingController>? textfieldController}) {
    if (textfieldController != null) {
      this.textfieldController = textfieldController;
    }
    if (choices != null) {
      this.choices = choices;
    }
  }

  QuizMultipleChoiceChoiceState copyWith(
      {List<ChoiceModel>? newChoices,
      FormInputState? inputState,
      List<TextEditingController>? textfieldController}) {
    return QuizMultipleChoiceChoiceState(
        choices: newChoices ?? choices,
        inputState: inputState ?? this.inputState,
        textfieldController: textfieldController ?? this.textfieldController);
  }

  void clearTextField() {
    for (var element in textfieldController) {
      element.clear();
    }
  }

  int validator() {
    for (var element in choices) {
      if (element.title == '') {
        return 501;
      }
    }
    try {
      choices.firstWhere((element) => element.isTrueAnswer);
    } on StateError {
      return 502;
    }
    return 0;
  }
}
