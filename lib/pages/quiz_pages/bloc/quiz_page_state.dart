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
  FormInputState inputState;
  QuizState quizState;
  late QuizModel currentQuiz = QuadChoiceModel(choices: []);

  bool validToStart() {
    return listOfQuestions.isNotEmpty;
  }

  QuizPageState({
    this.tabIndex = 0,
    this.quizState = const QuizIdle(),
    this.inputState = const FormInputIdle(),
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
    FormInputState? inputState,
    QuizState? quizState,
    List<QuizModel>? listOfQuestions,
  }) {
    return QuizPageState(
      quizState: quizState ?? this.quizState,
      inputState: inputState ?? this.inputState,
      tabIndex: tabIndex ?? this.tabIndex,
      selectedQuizType: selectedQuizType ?? this.selectedQuizType,
      listOfQuestions: listOfQuestions ?? this.listOfQuestions,
      currentQuiz: currentQuiz ?? this.currentQuiz,
    );
  }
}

abstract class QuizState {
  const QuizState();
}

class QuizReadyToStart extends QuizState {
  const QuizReadyToStart();
}

class QuizIdle extends QuizState {
  const QuizIdle();
}

class QuizNotReady extends QuizState {
  const QuizNotReady();
}
