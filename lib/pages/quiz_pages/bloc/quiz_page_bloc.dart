// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/shared/shared.dart';
import 'package:teknologi_inovasi_labs_test/shared/widgets/quiz_quad_choice_widget/bloc/quiz_quad_choice_bloc.dart';

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
      List<QuizModel> a = List.from(state.listOfQuestions);
      a.add(event.newQuiz);
      emit(state.copyWith(
          listOfQuestions: a,
          currentQuiz: initQuizModelbyModel(event.newQuiz),
          inputState: const FormInputSucess()));
      emit(state.copyWith(inputState: const FormInputIdle()));
    } else if (event is QuizPageQuestionTitleChanged) {
      state.currentQuiz.quizTitle = event.title;
      emit(state.copyWith(currentQuiz: state.currentQuiz));
    } else if (event is QuizPagePlayHit) {
      if (state.validToStart()) {
        emit(state.copyWith(quizState: const QuizReadyToStart()));
      } else {
        emit(state.copyWith(quizState: const QuizNotReady()));
      }
      emit(state.copyWith(quizState: const QuizIdle()));
    }
  }
}
