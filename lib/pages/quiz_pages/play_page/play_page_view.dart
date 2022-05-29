part of '../../pages.dart';

// ignore: must_be_immutable
class PlayQuizPage extends StatelessWidget {
  const PlayQuizPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            title: 'Mainkan Quiz',
            context: context,
            subtitle: 'Jawablah soal dibawah ini dengan benar',
          ),
          BlocBuilder<PlayPageBloc, PlayPageState>(
            builder: (context, state) {
              return Container(
                height: DeviceScreen.devHeight - 100,
                width: DeviceScreen.devWidth,
                padding: const EdgeInsets.all(defaultMargin),
                color: greyBackground,
                child: BlocListener<PlayPageBloc, PlayPageState>(
                  listener: (context, state) async {
                    if (state.gameState is GameOver) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => CounterPageCubit(),
                                  child: ResultPage(
                                    score: state.currentScore,
                                    total: state.listOfQuestions.length,
                                  ),
                                )),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: ListView(
                    children: [
                      Text('Pertanyaan:', style: blackFontStyle),
                      Text(
                          state.listOfQuestions[state.currentQuizIndex]
                              .quizTitle,
                          style: headerFontStyle2),
                      _answerBox()
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  Widget _answerBox() {
    return BlocBuilder<PlayPageBloc, PlayPageState>(
      builder: (context, state) {
        if (state.listOfQuestions[state.currentQuizIndex] is QuadChoiceModel) {
          return BlocProvider(
            create: (context) => QuadChoiceBloc(
                mainPlaybloc: context.read<PlayPageBloc>(),
                question: state.listOfQuestions[state.currentQuizIndex]
                    as QuadChoiceModel),
            child: QuestionQuadChoiceWidget(
                bloc: context.read<PlayPageBloc>(),
                quiz: state.listOfQuestions[state.currentQuizIndex]),
          );
        } else if (state.listOfQuestions[state.currentQuizIndex]
            is MultipleChoiceModel) {
          return BlocProvider(
            create: (context) => MultiChoiceBloc(
                mainPlaybloc: context.read<PlayPageBloc>(),
                question: state.listOfQuestions[state.currentQuizIndex]
                    as MultipleChoiceModel),
            child: QuestionMultipleChoiceWidget(
                bloc: context.read<PlayPageBloc>(),
                quiz: state.listOfQuestions[state.currentQuizIndex]),
          );
        } else if (state.listOfQuestions[state.currentQuizIndex]
            is QuadChoiceWtExtraEssayModel) {
          return BlocProvider(
            create: (context) => QuadExtraChoiceBloc(
                mainPlaybloc: context.read<PlayPageBloc>(),
                question: state.listOfQuestions[state.currentQuizIndex]
                    as QuadChoiceWtExtraEssayModel),
            child: QuestionQuadExtraChoiceWidget(
                bloc: context.read<PlayPageBloc>(),
                quiz: state.listOfQuestions[state.currentQuizIndex]),
          );
        } else if (state.listOfQuestions[state.currentQuizIndex]
            is MultipleChoiceWtExtraEssayModel) {
          return BlocProvider(
            create: (context) => MultiExtraChoiceBloc(
                mainPlaybloc: context.read<PlayPageBloc>(),
                question: state.listOfQuestions[state.currentQuizIndex]
                    as MultipleChoiceWtExtraEssayModel),
            child: QuestionMultiExtraChoiceWidget(
                bloc: context.read<PlayPageBloc>(),
                quiz: state.listOfQuestions[state.currentQuizIndex]),
          );
        } else if (state.listOfQuestions[state.currentQuizIndex]
            is ShortEssayModel) {
          return BlocProvider(
            create: (context) => ShortEssayChoiceBloc(
                mainPlaybloc: context.read<PlayPageBloc>(),
                question: state.listOfQuestions[state.currentQuizIndex]
                    as ShortEssayModel),
            child: ShortEssayChoiceWidget(
                bloc: context.read<PlayPageBloc>(),
                quiz: state.listOfQuestions[state.currentQuizIndex]),
          );
        } else if (state.listOfQuestions[state.currentQuizIndex]
            is LongEssayModel) {
          return BlocProvider(
            create: (context) => LongEssayChoiceBloc(
                mainPlaybloc: context.read<PlayPageBloc>(),
                question: state.listOfQuestions[state.currentQuizIndex]
                    as LongEssayModel),
            child: LongEssayChoiceWidget(
                bloc: context.read<PlayPageBloc>(),
                quiz: state.listOfQuestions[state.currentQuizIndex]),
          );
        }
        // LongEssayChoiceWidget
        return Container();
      },
    );
  }
}
