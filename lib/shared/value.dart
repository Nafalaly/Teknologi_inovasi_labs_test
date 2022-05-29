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
  } else if (model is MultipleChoiceWtExtraEssayModel) {
    return 'Pilihan Ganda(>4) + User Input';
  } else if (model is QuadChoiceWtExtraEssayModel) {
    return 'Pilihan Ganda(4) + User Input';
  } else if (model is ShortEssayModel) {
    return 'Essay pendek';
  } else if (model is LongEssayModel) {
    return 'Essay Panjang';
  } else {
    return 'Undefined';
  }
}

QuizModel initQuizModelbyModel(QuizModel model) {
  if (model is QuadChoiceModel) {
    return QuadChoiceModel(choices: []);
  } else if (model is QuadChoiceWtExtraEssayModel) {
    return QuadChoiceWtExtraEssayModel(choices: [], essayAnswer: '');
  } else if (model is MultipleChoiceModel) {
    return MultipleChoiceModel(choices: []);
  } else if (model is MultipleChoiceWtExtraEssayModel) {
    return MultipleChoiceWtExtraEssayModel(choices: [], essayAnswer: '');
  } else if (model is ShortEssayModel) {
    return ShortEssayModel(answer: '');
  } else if (model is LongEssayModel) {
    return LongEssayModel(answer: '');
  }
  return QuadChoiceModel(choices: []);
}
