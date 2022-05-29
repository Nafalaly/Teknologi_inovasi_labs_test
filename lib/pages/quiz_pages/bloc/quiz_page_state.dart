part of 'quiz_page_bloc.dart';

const List<String> defaultQuizTypes = [
  'Piliihan Ganda (4)',
  'Piliihan Ganda (>4)',
  'Piliihan Ganda (4) + User Input',
  'Piliihan Ganda (>4) + User Input',
  'Essay Pendek',
  'Essay Panjang',
];

class QuizPageState {
  final List<String> quizTypes = defaultQuizTypes;
  late List<QuizModel> listOfQuestions;
  late String selectedQuizType;
  int tabIndex;
  late QuizModel currentQuiz = QuadChoiceModel(choices: []);

  QuizPageState({
    this.tabIndex = 0,
    QuizModel? currentQuiz,
    String? selectedQuizType,
    List<QuizModel>? listOfQuestions,
  }) {
    if (listOfQuestions != null) {
      this.listOfQuestions = listOfQuestions;
    } else {
      this.listOfQuestions = [];
    }
    if (currentQuiz != null) {
      this.currentQuiz = currentQuiz;
    }
    if (selectedQuizType != null) {
      this.selectedQuizType = selectedQuizType;
    } else {
      this.selectedQuizType = quizTypes[0];
    }
  }

  QuizPageState copyWith({
    int? tabIndex,
    String? selectedQuizType,
    QuizModel? currentQuiz,
    List<QuizModel>? listOfQuestions,
  }) {
    return QuizPageState(
      tabIndex: tabIndex ?? this.tabIndex,
      selectedQuizType: selectedQuizType ?? this.selectedQuizType,
      listOfQuestions: listOfQuestions ?? this.listOfQuestions,
      currentQuiz: currentQuiz ?? this.currentQuiz,
    );
  }
}
