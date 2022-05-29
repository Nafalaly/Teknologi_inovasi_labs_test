// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/shared/widgets/quiz_quad_choice_widget/bloc/quiz_quad_choice_bloc.dart';

part 'play_page_event.dart';
part 'play_page_state.dart';

class PlayPageBloc extends Bloc<PlayPageEvent, PlayPageState> {
  PlayPageBloc({required List<QuizModel> listOfQuestions})
      : super(PlayPageState.initQuestions(listOfQuestions: listOfQuestions)) {
    on(mapEvent);
  }
  Future<void> mapEvent(
      PlayPageEvent event, Emitter<PlayPageState> emit) async {
    if (event is NextQuestions) {
      int currentScore = state.currentScore;
      GameState? currentState;
      if (event.isUserAnswerCorrect) {
        currentScore = currentScore + 1;
      }
      int next = state.currentQuizIndex + 1;
      if (next == state.listOfQuestions.length) {
        next = state.listOfQuestions.length - 1;
        currentState = const GameOver();
      }
      emit(state.copyWith(
          currentQuizIndex: next,
          currentScore: currentScore,
          gameState: currentState));
    }
  }
}
