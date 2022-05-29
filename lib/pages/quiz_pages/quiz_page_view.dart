part of '../pages.dart';

class QuizDashboard extends StatelessWidget {
  QuizDashboard({Key? key}) : super(key: key);
  final TextEditingController questionTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            title: 'Quiz App',
            context: context,
            subtitle: 'Create Quiz and play it !',
          ),
          Container(
            height: DeviceScreen.devHeight - 100,
            width: DeviceScreen.devWidth,
            color: greyBackground,
            child: Column(
              children: [_tabWidget(), _mainDisplay()],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _mainDisplay() {
    return BlocBuilder<QuizPageBloc, QuizPageState>(
      builder: (context, state) {
        switch (state.tabIndex) {
          case 0:
            return _createScreen(context);
          case 1:
            return _showListOfQuestions();
          default:
            return Center(
              child: Text('Something went wrong', style: blackFontStyle2),
            );
        }
      },
    );
  }

  Widget _showListOfQuestions() {
    return Container(
      height: DeviceScreen.devHeight - (defaultTabBarHeight + 100),
      width: DeviceScreen.devWidth,
      padding: const EdgeInsets.all(15),
      child: BlocBuilder<QuizPageBloc, QuizPageState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Soal sudah dibuat :', style: blackFontStyle),
              ListView(
                shrinkWrap: true,
                children: List.generate(
                    state.listOfQuestions.length,
                    (index) => Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading:
                                Text('${index + 1}', style: blackFontStyle),
                            title: Text(state.listOfQuestions[index].quizTitle,
                                style: blackFontStyle),
                            subtitle: Text(
                                'Tipe soal :${getQuizModelStr(state.listOfQuestions[index])}',
                                style: blackFontStyle2),
                          ),
                        )),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _createScreen(BuildContext context) {
    return Container(
      height: DeviceScreen.devHeight - (defaultTabBarHeight + 100),
      width: DeviceScreen.devWidth,
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pertanyaan:', style: blackFontStyle2),
              Container(
                width: DeviceScreen.devWidth,
                height: 45,
                key: key,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: TextField(
                  controller: questionTitleController,
                  onChanged: (val) => context
                      .read<QuizPageBloc>()
                      .add(QuizPageQuestionTitleChanged(title: val)),
                  style: blackFontStyle2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tipe soal:', style: blackFontStyle2),
                  Container(
                    height: 50,
                    width: 180,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: BlocBuilder<QuizPageBloc, QuizPageState>(
                      builder: (context, state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            autofocus: true,
                            value: state.selectedQuizType,
                            dropdownMaxHeight: 200,
                            // dropdownWidth: 150,
                            scrollbarAlwaysShow: true,
                            dropdownDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            items: state.quizTypes
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              context.read<QuizPageBloc>().add(
                                  QuizPageChangeQuizTypeEvent(
                                      type: val as String,
                                      quizModel: initQuizModelbyString(val)));
                            },
                            offset: const Offset(-10, -10),
                            style: blackFontStyle3.copyWith(
                                color: mainColor, fontWeight: FontWeight.w600),
                            isExpanded: true,
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
          _quizWidget()
        ],
      ),
    );
  }

  Widget _quizWidget() {
    return BlocBuilder<QuizPageBloc, QuizPageState>(
      builder: (context, state) {
        switch (state.selectedQuizType) {
          case 'Piliihan Ganda (4)':
            return QuizQuadWidget(bloc: context.read<QuizPageBloc>());
          case "Piliihan Ganda (>4)":
            return QuizMultipleChoiceWidget(bloc: context.read<QuizPageBloc>());
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _tabWidget() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 4,
          blurRadius: 5,
          offset: const Offset(0, -3), // changes position of shadow
        ),
      ]),
      height: defaultTabBarHeight,
      width: DeviceScreen.devWidth,
      child: BlocBuilder<QuizPageBloc, QuizPageState>(
        builder: (context, state) {
          return Row(
            children: [
              GestureDetector(
                onTap: () => context
                    .read<QuizPageBloc>()
                    .add(QuizPageSwitchTabEvent(index: 0)),
                child: Container(
                  height: defaultTabBarHeight,
                  width: DeviceScreen.devWidth / 2,
                  alignment: Alignment.center,
                  child: Text('Buat Baru',
                      style: blackFontStyle2.copyWith(
                          color: state.tabIndex == 0 ? mainColor : greyColor)),
                ),
              ),
              GestureDetector(
                onTap: () => context
                    .read<QuizPageBloc>()
                    .add(QuizPageSwitchTabEvent(index: 1)),
                child: Container(
                  height: defaultTabBarHeight,
                  width: DeviceScreen.devWidth / 2,
                  alignment: Alignment.center,
                  child: Text('Pertanyaan',
                      style: blackFontStyle2.copyWith(
                          color: state.tabIndex == 1 ? mainColor : greyColor)),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
