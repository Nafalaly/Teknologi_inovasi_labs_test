// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/bloc/quiz_page_bloc.dart';
import 'package:teknologi_inovasi_labs_test/shared/widgets/quiz_quad_choice_widget/bloc/quiz_quad_choice_bloc.dart';

part 'quiz_multiple_choice_event.dart';
part 'quiz_multiple_choice_state.dart';

class QuizMultipleChoiceBloc
    extends Bloc<QuizMultipleChoiceChoiceEvent, QuizMultipleChoiceChoiceState> {
  QuizMultipleChoiceBloc({required this.mainPageBloc})
      : super(QuizMultipleChoiceChoiceState()) {
    on(mapEvent);
  }

  QuizPageBloc mainPageBloc;

  Future<void> mapEvent(QuizMultipleChoiceChoiceEvent event,
      Emitter<QuizMultipleChoiceChoiceState> emit) async {
    if (event is QuizMultipleChoiceChangeTitleChoice) {
      state.choices[event.index].title = event.newTitle;
      emit(state.copyWith(newChoices: state.choices));
    } else if (event is QuizMultipleChoiceSetChoiceAsTrueAnswer) {
      for (var element in state.choices) {
        element.isTrueAnswer = false;
      }
      state.choices[event.index].isTrueAnswer = true;
      emit(state.copyWith(newChoices: state.choices));
    } else if (event is QuizMultipleChoiceAttemptAdd) {
      if (mainPageBloc.state.currentQuiz.quizTitle == '') {
        emit(state.copyWith(
            inputState: FormBadInputState(message: 'Pertanyaan harus diisi')));
      }
      switch (state.validator()) {
        case 0:
          createQuiz();
          state.clearTextField();
          emit(state.copyWith(textfieldController: state.textfieldController));
          emit(state.copyWith(inputState: const FormInputSucess()));
          break;
        case 501:
          emit(state.copyWith(
              inputState: FormBadInputState(
                  message: 'Judul jawaban belum terisi lengkap')));
          break;
        case 502:
          emit(state.copyWith(
              inputState: FormBadInputState(
                  message:
                      'Silahkan centang salah satu jawaban sebagai jawaban yang benar')));
          break;
        default:
          break;
      }
      emit(state.copyWith(inputState: const FormInputIdle()));
    } else if (event is QuizMultipleChoiceAddChoices) {
      if (state.choices[state.choices.length - 1].title != '' ||
          state.choices.length < 5) {
        state.choices.add(ChoiceModel(title: ''));
        state.textfieldController.add(TextEditingController());
        emit(state.copyWith(newChoices: state.choices));
      }
    }
  }

  void createQuiz() {
    MultipleChoiceModel newQuiz = MultipleChoiceModel(choices: state.choices);
    newQuiz.quizTitle = mainPageBloc.state.currentQuiz.quizTitle;
    mainPageBloc.add(QuizPageAddQuiz(newQuiz: newQuiz));
  }
}
