part of 'quiz_quad_choice_extra_bloc.dart';

class QuizQuadChoiceExtraState {
  List<TextEditingController> textfieldController =
      List.generate(4, (index) => TextEditingController());
  List<ChoiceModel> choices =
      List.generate(4, (index) => ChoiceModel(title: ''));
  FormInputState inputState;
  bool essayIsTrue;
  String essayTitle;

  QuizQuadChoiceExtraState(
      {List<ChoiceModel>? choices,
      this.essayIsTrue = false,
      this.essayTitle = '',
      this.inputState = const FormInputIdle(),
      List<TextEditingController>? textfieldController}) {
    if (textfieldController != null) {
      this.textfieldController = textfieldController;
    }
    if (choices != null) {
      this.choices = choices;
    }
  }

  QuizQuadChoiceExtraState copyWith(
      {List<ChoiceModel>? newChoices,
      FormInputState? inputState,
      bool? essayIsTrue,
      String? essayTitle,
      List<TextEditingController>? textfieldController}) {
    return QuizQuadChoiceExtraState(
        essayIsTrue: essayIsTrue ?? this.essayIsTrue,
        essayTitle: essayTitle ?? this.essayTitle,
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
    if (!essayIsTrue) {
      try {
        choices.firstWhere((element) => element.isTrueAnswer);
      } on StateError {
        return 502;
      }
    } else {
      if (essayTitle == '') {
        return 503;
      }
    }
    return 0;
  }
}
