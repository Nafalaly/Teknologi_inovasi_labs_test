// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/play_page/bloc/play_page_bloc.dart';

part 'long_choice_event.dart';
part 'long_choice_state.dart';

class LongEssayChoiceBloc
    extends Bloc<LongEssayChoiceEvent, LongEssayChoiceState> {
  LongEssayChoiceBloc(
      {required this.mainPlaybloc, required LongEssayModel question})
      : super(LongEssayChoiceState(question: question)) {
    on(mapEvent);
  }
  PlayPageBloc mainPlaybloc;

  Future<void> mapEvent(
      LongEssayChoiceEvent event, Emitter<LongEssayChoiceState> emit) async {
    if (event is LongEssayChoiceSubmit) {
      if ((state).isValid()) {
        mainPlaybloc.add(NextQuestions(
            isUserAnswerCorrect: state.question
                .isUserAnswerCorrect(userAnswerEssay: state.answer)));
      }
    } else if (event is EssayLongFill) {
      emit(state.copyWith(currentAnswer: event.answer));
    }
  }
}
