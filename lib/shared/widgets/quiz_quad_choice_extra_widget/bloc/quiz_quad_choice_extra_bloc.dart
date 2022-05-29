// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/bloc/quiz_page_bloc.dart';
import 'package:teknologi_inovasi_labs_test/shared/widgets/quiz_quad_choice_widget/bloc/quiz_quad_choice_bloc.dart';

part 'quiz_quad_choice_extra_event.dart';
part 'quiz_quad_choice_extra_state.dart';

class QuizQuadChoiceExtraBloc
    extends Bloc<QuizQuadChoiceExtraEvent, QuizQuadChoiceExtraState> {
  QuizQuadChoiceExtraBloc({required this.mainPageBloc})
      : super(QuizQuadChoiceExtraState()) {
    on(mapEvent);
  }

  QuizPageBloc mainPageBloc;

  Future<void> mapEvent(QuizQuadChoiceExtraEvent event,
      Emitter<QuizQuadChoiceExtraState> emit) async {
    if (event is QuizQuadChoiceExtraChangeTitleChoice) {
      state.choices[event.index].title = event.newTitle;
      emit(state.copyWith(newChoices: state.choices));
    } else if (event is QuizQuadChoiceExtraSetChoiceAsTrueAnswer) {
      for (var element in state.choices) {
        element.isTrueAnswer = false;
      }
      state.choices[event.index].isTrueAnswer = true;
      emit(state.copyWith(newChoices: state.choices, essayIsTrue: false));
    } else if (event is QuizQuadChoiceExtraAttemptAdd) {
      if (mainPageBloc.state.currentQuiz.quizTitle == '') {
        emit(state.copyWith(
            inputState: FormBadInputState(message: 'Pertanyaan harus diisi')));
      }
      switch (state.validator()) {
        case 0:
          createQuiz();
          state.clearTextField();
          emit(state.copyWith(textfieldController: state.textfieldController));
          emit(state.copyWith(
              inputState: const FormInputSucess(),
              newChoices: List.generate(4, (index) => ChoiceModel(title: ''))));
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
        case 503:
          emit(state.copyWith(
              inputState: FormBadInputState(message: 'Essay harus diisi')));
          break;
        default:
          break;
      }
      emit(state.copyWith(inputState: const FormInputIdle()));
    } else if (event is QuizQuadChoiceExtraChangeEssay) {
      emit(state.copyWith(essayTitle: event.newTitle));
    } else if (event is QuizQuadChoiceExtraEssayMarkAsTrue) {
      for (var element in state.choices) {
        element.isTrueAnswer = false;
      }
      emit(state.copyWith(essayIsTrue: true));
    }
  }

  void createQuiz() {
    QuadChoiceWtExtraEssayModel newQuiz = QuadChoiceWtExtraEssayModel(
        choices: state.choices,
        essayAnswer: state.essayTitle,
        isEssayTrue: state.essayIsTrue);
    newQuiz.quizTitle = mainPageBloc.state.currentQuiz.quizTitle;
    if (newQuiz.essayAnswer == '') {
      newQuiz.essayAnswer = 'No answer';
    }
    mainPageBloc.add(QuizPageAddQuiz(newQuiz: newQuiz));
  }
}
