part of 'play_page_bloc.dart';

abstract class GameState {
  const GameState();
}

class GameRunning extends GameState {
  const GameRunning();
}

class GameOver extends GameState {
  const GameOver();
}

class PlayPageState {
  int currentQuizIndex = 0;
  int currentScore = 0;
  GameState gameState = const GameRunning();
  late FormInputState inputState;
  late List<QuizModel> listOfQuestions;
  PlayPageState.initQuestions({required this.listOfQuestions}) {
    inputState = const FormInputIdle();
  }
  PlayPageState(
      {this.currentQuizIndex = 0,
      this.currentScore = 0,
      this.gameState = const GameRunning(),
      this.listOfQuestions = const [],
      this.inputState = const FormInputIdle()});

  PlayPageState copyWith(
      {int? currentQuizIndex = 0,
      int? currentScore = 0,
      GameState? gameState,
      List<QuizModel>? listOfQuestions,
      FormInputState? inputState}) {
    return PlayPageState(
      gameState: gameState ?? this.gameState,
      listOfQuestions: listOfQuestions ?? this.listOfQuestions,
      currentQuizIndex: currentQuizIndex ?? this.currentQuizIndex,
      currentScore: currentScore ?? this.currentScore,
      inputState: inputState ?? this.inputState,
    );
  }
}
