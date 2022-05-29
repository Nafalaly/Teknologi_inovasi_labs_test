// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/play_page/bloc/play_page_bloc.dart';

part 'short_choice_event.dart';
part 'short_choice_state.dart';

class ShortEssayChoiceBloc
    extends Bloc<ShortEssayChoiceEvent, ShortEssayChoiceState> {
  ShortEssayChoiceBloc(
      {required this.mainPlaybloc, required ShortEssayModel question})
      : super(ShortEssayChoiceState(question: question)) {
    on(mapEvent);
  }
  PlayPageBloc mainPlaybloc;

  Future<void> mapEvent(
      ShortEssayChoiceEvent event, Emitter<ShortEssayChoiceState> emit) async {
    if (event is ShortEssayChoiceSubmit) {
      if ((state).isValid()) {
        mainPlaybloc.add(NextQuestions(
            isUserAnswerCorrect: state.question
                .isUserAnswerCorrect(userAnswerEssay: state.answer)));
      }
    } else if (event is EssayFill) {
      emit(state.copyWith(currentAnswer: event.answer));
    }
  }
}
