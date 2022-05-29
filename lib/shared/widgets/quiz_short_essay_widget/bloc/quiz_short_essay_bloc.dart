// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/bloc/quiz_page_bloc.dart';
import 'package:teknologi_inovasi_labs_test/shared/widgets/quiz_quad_choice_widget/bloc/quiz_quad_choice_bloc.dart';

part 'quiz_short_essay_event.dart';
part 'quiz_short_essay_state.dart';

class QuizShortEssayBloc
    extends Bloc<QuizShortEssayEvent, QuizShortEssayState> {
  QuizShortEssayBloc({required this.mainPageBloc})
      : super(QuizShortEssayState()) {
    on(mapEvent);
  }

  QuizPageBloc mainPageBloc;

  Future<void> mapEvent(
      QuizShortEssayEvent event, Emitter<QuizShortEssayState> emit) async {
    if (event is QuizEssayChanged) {
      emit(state.copyWith(essayAnswer: event.essay));
    } else if (event is QuizEssayAttemptAdd) {
      if (mainPageBloc.state.currentQuiz.quizTitle == '') {
        emit(state.copyWith(
            inputState: FormBadInputState(message: 'Pertanyaan harus diisi')));
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
    ShortEssayModel newQuiz = ShortEssayModel(answer: state.essayAnswer);
    newQuiz.quizTitle = mainPageBloc.state.currentQuiz.quizTitle;
    mainPageBloc.add(QuizPageAddQuiz(newQuiz: newQuiz));
  }
}
