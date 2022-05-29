part of 'shared.dart';

QuizModel initQuizModelbyString(String val) {
  switch (val) {
    case 'Piliihan Ganda (4)':
      return QuadChoiceModel(choices: []);
    default:
      return QuadChoiceModel(choices: []);
  }
}

String getQuizModelStr(QuizModel model) {
  if (model is QuadChoiceModel) {
    return 'Pilihan Ganda(4)';
  } else if (model is MultipleChoiceModel) {
    return 'Pilihan Ganda(>4)';
  } else {
    return 'Undefined';
  }
}

QuizModel initQuizModelbyModel(QuizModel model) {
  if (model is QuadChoiceModel) {
    return QuadChoiceModel(choices: []);
  }
  return QuadChoiceModel(choices: []);
}
