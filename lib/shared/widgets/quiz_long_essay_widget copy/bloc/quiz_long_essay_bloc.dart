// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/bloc/quiz_page_bloc.dart';
import 'package:teknologi_inovasi_labs_test/shared/widgets/quiz_quad_choice_widget/bloc/quiz_quad_choice_bloc.dart';

part 'quiz_long_essay_event.dart';
part 'quiz_long_essay_state.dart';

class QuizLongEssayBloc extends Bloc<QuizLongEssayEvent, QuizLongEssayState> {
  QuizLongEssayBloc({required this.mainPageBloc})
      : super(QuizLongEssayState()) {
    on(mapEvent);
  }

  QuizPageBloc mainPageBloc;

  Future<void> mapEvent(
      QuizLongEssayEvent event, Emitter<QuizLongEssayState> emit) async {
    if (event is QuizEssayLongChanged) {
      emit(state.copyWith(essayAnswer: event.essay));
    } else if (event is QuizEssayLongAttemptAdd) {
      if (mainPageBloc.state.currentQuiz.quizTitle == '') {
        emit(state.copyWith(
            inputState: FormBadInputState(message: 'Pertanyaan harus diisi')));
        emit(
            state.copyWith(inputState: const FormInputIdle(), essayAnswer: ''));
        return;
      }
      switch (state.validator()) {
        case 0:
          createQuiz();
          emit(state.copyWith(inputState: const FormInputSucess()));
          break;
        case 501:
          emit(state.copyWith(
              inputState:
                  FormBadInputState(message: 'jawaban Essay belum diisi')));
          break;
        default:
          break;
      }
      emit(state.copyWith(inputState: const FormInputIdle()));
    }
  }

  void createQuiz() {
    LongEssayModel newQuiz = LongEssayModel(answer: state.essayAnswer);
    newQuiz.quizTitle = mainPageBloc.state.currentQuiz.quizTitle;
    mainPageBloc.add(QuizPageAddQuiz(newQuiz: newQuiz));
  }
}
