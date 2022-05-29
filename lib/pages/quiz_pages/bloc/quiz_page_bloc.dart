// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/shared/shared.dart';

part 'quiz_page_event.dart';
part 'quiz_page_state.dart';

class QuizPageBloc extends Bloc<QuizPageEvent, QuizPageState> {
  QuizPageBloc() : super(QuizPageState()) {
    on(mapEvent);
  }

  Future<void> mapEvent(
      QuizPageEvent event, Emitter<QuizPageState> emit) async {
    if (event is QuizPageChangeQuizTypeEvent) {
      emit(state.copyWith(selectedQuizType: event.type));
    } else if (event is QuizPageSwitchTabEvent) {
      emit(state.copyWith(tabIndex: event.index));
    } else if (event is QuizPageAddQuiz) {
      emit(state.copyWith(
          listOfQuestions: state.listOfQuestions..add(event.newQuiz),
          currentQuiz: initQuizModelbyModel(event.newQuiz)));
    } else if (event is QuizPageQuestionTitleChanged) {
      state.currentQuiz.quizTitle = event.title;
      emit(state.copyWith(currentQuiz: state.currentQuiz));
    }
  }
}
