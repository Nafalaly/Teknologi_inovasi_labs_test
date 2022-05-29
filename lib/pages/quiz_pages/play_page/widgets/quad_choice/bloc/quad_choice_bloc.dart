// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/play_page/bloc/play_page_bloc.dart';

part 'quad_choice_event.dart';
part 'quad_choice_state.dart';

class QuadChoiceBloc extends Bloc<QuadChoiceEvent, QuadChoiceState> {
  QuadChoiceBloc(
      {required this.mainPlaybloc, required QuadChoiceModel question})
      : super(QuadChoiceState(question: question)) {
    on(mapEvent);
  }
  PlayPageBloc mainPlaybloc;

  Future<void> mapEvent(
      QuadChoiceEvent event, Emitter<QuadChoiceState> emit) async {
    if (event is QuadChoiceChoosingAnswer) {
      emit(state.copyWith(currentAnswer: event.index));
    } else if (event is QuadChoiceSubmit) {
      if ((state).isValid()) {
        mainPlaybloc.add(NextQuestions(
            isUserAnswerCorrect: state.question
                .isUserAnswerCorrect(userAnswerIndex: state.currentAnswer!)));
      }
    }
  }
}
