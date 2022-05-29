// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/play_page/bloc/play_page_bloc.dart';

part 'multi_choice_event.dart';
part 'multi_choice_state.dart';

class MultiChoiceBloc extends Bloc<MultiChoiceEvent, MultiChoiceState> {
  MultiChoiceBloc(
      {required this.mainPlaybloc, required MultipleChoiceModel question})
      : super(MultiChoiceState(question: question)) {
    on(mapEvent);
  }
  PlayPageBloc mainPlaybloc;

  Future<void> mapEvent(
      MultiChoiceEvent event, Emitter<MultiChoiceState> emit) async {
    if (event is MultiChoiceChoosingAnswer) {
      emit(state.copyWith(currentAnswer: event.index));
    } else if (event is MultiChoiceSubmit) {
      if ((state).isValid()) {
        mainPlaybloc.add(NextQuestions(
            isUserAnswerCorrect: state.question
                .isUserAnswerCorrect(userAnswerIndex: state.currentAnswer!)));
      }
    }
  }
}
