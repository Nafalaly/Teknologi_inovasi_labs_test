// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/bloc/quiz_page_bloc.dart';

part 'quiz_quad_choice_event.dart';
part 'quiz_quad_choice_state.dart';

class QuizQuadChoiceBloc
    extends Bloc<QuizQuadChoiceEvent, QuizQuadChoiceState> {
  QuizQuadChoiceBloc({required this.mainPageBloc})
      : super(QuizQuadChoiceState()) {
    on(mapEvent);
  }

  QuizPageBloc mainPageBloc;

  Future<void> mapEvent(
      QuizQuadChoiceEvent event, Emitter<QuizQuadChoiceState> emit) async {
    if (event is QuizQuadChangeTitleChoice) {
      state.choices[event.index].title = event.newTitle;
      emit(state.copyWith(newChoices: state.choices));
    } else if (event is QuizQuadSetChoiceAsTrueAnswer) {
      for (var element in state.choices) {
        element.isTrueAnswer = false;
      }
      state.choices[event.index].isTrueAnswer = true;
      emit(state.copyWith(newChoices: state.choices));
    } else if (event is QuizQuadAttemptAdd) {
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
    }
  }

  void createQuiz() {
    QuadChoiceModel newQuiz = QuadChoiceModel(choices: state.choices);
    newQuiz.quizTitle = mainPageBloc.state.currentQuiz.quizTitle;
    mainPageBloc.add(QuizPageAddQuiz(newQuiz: newQuiz));
  }
}
