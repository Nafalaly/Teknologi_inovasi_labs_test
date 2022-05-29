// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:teknologi_inovasi_labs_test/models/models.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/play_page/bloc/play_page_bloc.dart';

part 'multi_extra_choice_event.dart';
part 'multi_extra_choice_state.dart';

class MultiExtraChoiceBloc
    extends Bloc<MultiExtraChoiceEvent, MultiExtraChoiceState> {
  MultiExtraChoiceBloc(
      {required this.mainPlaybloc,
      required MultipleChoiceWtExtraEssayModel question})
      : super(MultiExtraChoiceState(question: question)) {
    on(mapEvent);
  }
  PlayPageBloc mainPlaybloc;

  Future<void> mapEvent(
      MultiExtraChoiceEvent event, Emitter<MultiExtraChoiceState> emit) async {
    if (event is MultiExtraChoiceChoosingAnswer) {
      emit(state.copyWith(
          currentAnswer: event.index, isChosseCustomInput: false));
    } else if (event is MultiChooseCustomInput) {
      emit(state.copyWith(
        isChosseCustomInput: true,
        currentAnswer: -1,
      ));
    } else if (event is MultiExtraChoiceSubmit) {
      if ((state).isValid()) {
        mainPlaybloc.add(NextQuestions(
            isUserAnswerCorrect: state.question.isUserAnswerCorrect(
                userAnswerIndex: state.currentAnswer!,
                userAnswerEssay: state.answerInput)));
      }
    } else if (event is MultiExtraEssayFill) {
      emit(state.copyWith(answerInput: event.answer));
    }
  }
}
