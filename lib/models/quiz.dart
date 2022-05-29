part of 'models.dart';

abstract class QuizModel {
  late String quizTitle = '';
  late bool totalAnswer = false;
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
  String answer;
  MultipleChoiceWtExtraEssayModel(
      {required this.choices, required this.answer});

  bool isUserAnswerCorrect(
      {required int userAnswerIndex, required String userAnswerEssay}) {
    return choices[userAnswerIndex].isTrueAnswer &&
        userAnswerEssay.toLowerCase() == answer.toLowerCase();
  }
}

class ChoiceModel {
  String title;
  bool isTrueAnswer;
  ChoiceModel({required this.title, this.isTrueAnswer = false});
}
