// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/play_page/bloc/play_page_bloc.dart';

part 'quad_extra_choice_event.dart';
part 'quad_extra_choice_state.dart';

class QuadExtraChoiceBloc
    extends Bloc<QuadExtraChoiceEvent, QuadExtraChoiceState> {
  QuadExtraChoiceBloc(
      {required this.mainPlaybloc,
      required QuadChoiceWtExtraEssayModel question})
      : super(QuadExtraChoiceState(question: question)) {
    on(mapEvent);
  }
  PlayPageBloc mainPlaybloc;

  Future<void> mapEvent(
      QuadExtraChoiceEvent event, Emitter<QuadExtraChoiceState> emit) async {
    if (event is QuadExtraChoiceChoosingAnswer) {
      emit(state.copyWith(
          currentAnswer: event.index, isChosseCustomInput: false));
    } else if (event is QuadChooseCustomInput) {
      emit(state.copyWith(
        isChosseCustomInput: true,
        currentAnswer: -1,
      ));
    } else if (event is QuadExtraChoiceSubmit) {
      if ((state).isValid()) {
        mainPlaybloc.add(NextQuestions(
            isUserAnswerCorrect: state.question.isUserAnswerCorrect(
                userAnswerIndex: state.currentAnswer!,
                userAnswerEssay: state.answerInput)));
      }
    } else if (event is QuadExtraEssayFill) {
      emit(state.copyWith(answerInput: event.answer));
    }
  }
}
