part of 'quiz_quad_choice_bloc.dart';

class QuizQuadChoiceState {
  final List<String> alphabeticOrder = ['A', 'B', 'C', 'D'];
  List<TextEditingController> textfieldController =
      List.generate(4, (index) => TextEditingController());
  List<ChoiceModel> choices =
      List.generate(4, (index) => ChoiceModel(title: ''));
  FormInputState inputState;

  QuizQuadChoiceState(
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

  QuizQuadChoiceState copyWith(
      {List<ChoiceModel>? newChoices,
      FormInputState? inputState,
      List<TextEditingController>? textfieldController}) {
    return QuizQuadChoiceState(
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

abstract class FormInputState {
  const FormInputState();
}

class FormInputSucess extends FormInputState {
  const FormInputSucess();
}

class FormBadInputState extends FormInputState {
  final String message;
  FormBadInputState({required this.message});
}

class FormInputIdle extends FormInputState {
  const FormInputIdle();
}
