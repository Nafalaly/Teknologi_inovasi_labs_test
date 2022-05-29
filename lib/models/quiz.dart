part of 'models.dart';

abstract class QuizModel {
  String quizTitle = '';
  bool totalAnswer = false;
}

class ShortEssayModel extends QuizModel {
  String answer;
  ShortEssayModel({required this.answer});
  bool isUserAnswerCorrect({required String userAnswerEssay}) {
    return userAnswerEssay.toLowerCase() == answer.toLowerCase();
  }
}

class LongEssayModel extends QuizModel {
  String answer;
  LongEssayModel({required this.answer});
  bool isUserAnswerCorrect({required String userAnswerEssay}) {
    return userAnswerEssay.toLowerCase() == answer.toLowerCase();
  }
}

class QuadChoiceModel extends QuizModel {
  List<ChoiceModel> choices;
  QuadChoiceModel({required this.choices});

  bool isUserAnswerCorrect({required int userAnswerIndex}) {
    return choices[userAnswerIndex].isTrueAnswer;
  }
}

class MultipleChoiceModel extends QuizModel {
  List<ChoiceModel> choices;
  MultipleChoiceModel({required this.choices});
  bool isUserAnswerCorrect({required int userAnswerIndex}) {
    return choices[userAnswerIndex].isTrueAnswer;
  }
}

class MultipleChoiceWtExtraEssayModel extends QuizModel {
  List<ChoiceModel> choices;
  String essayAnswer;
  bool isEssayTrue;
  MultipleChoiceWtExtraEssayModel({
    required this.choices,
    required this.essayAnswer,
    this.isEssayTrue = false,
  });

  bool isUserAnswerCorrect(
      {required int userAnswerIndex, required String userAnswerEssay}) {
    return choices[userAnswerIndex].isTrueAnswer ||
        userAnswerEssay.toLowerCase() == essayAnswer.toLowerCase();
  }
}

class QuadChoiceWtExtraEssayModel extends QuizModel {
  List<ChoiceModel> choices;
  String essayAnswer;
  bool isEssayTrue;
  QuadChoiceWtExtraEssayModel({
    required this.choices,
    required this.essayAnswer,
    this.isEssayTrue = false,
  });

  bool isUserAnswerCorrect(
      {required int userAnswerIndex, required String userAnswerEssay}) {
    if (userAnswerIndex == -1) {
      userAnswerIndex = 0;
    }
    return choices[userAnswerIndex].isTrueAnswer ||
        userAnswerEssay.toLowerCase() == essayAnswer.toLowerCase();
  }
}

class ChoiceModel {
  String title;
  bool isTrueAnswer;
  ChoiceModel({required this.title, this.isTrueAnswer = false});
}
