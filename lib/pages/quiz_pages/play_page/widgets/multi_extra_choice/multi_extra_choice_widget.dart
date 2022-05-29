part of '../../../../pages.dart';

// ignore: must_be_immutable
class QuestionMultiExtraChoiceWidget extends StatelessWidget {
  QuestionMultiExtraChoiceWidget(
      {Key? key, required this.quiz, required this.bloc})
      : super(key: key);
  QuizModel quiz;
  PlayPageBloc bloc;
  final TextEditingController questionTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceScreen.devWidth,
      child: Column(
        children: [
          Column(
            children: List.generate(
                (quiz as MultipleChoiceWtExtraEssayModel).choices.length,
                (index) {
              return ListTile(
                leading:
                    BlocBuilder<MultiExtraChoiceBloc, MultiExtraChoiceState>(
                  builder: (context, state) {
                    return Checkbox(
                      value: index == state.currentAnswer ? true : false,
                      onChanged: (val) {
                        if (val!) {
                          context.read<MultiExtraChoiceBloc>().add(
                              MultiExtraChoiceChoosingAnswer(index: index));
                        }
                      },
                    );
                  },
                ),
                title: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: greyColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                      (quiz as MultipleChoiceWtExtraEssayModel)
                          .choices[index]
                          .title,
                      style: blackFontStyle),
                ),
              );
            }),
          ),
          BlocBuilder<MultiExtraChoiceBloc, MultiExtraChoiceState>(
            builder: (context, state) {
              return Row(
                children: [
                  Checkbox(
                    activeColor: Colors.green,
                    value: state.isChosseCustomInput,
                    onChanged: (val) {
                      if (val!) {
                        context
                            .read<MultiExtraChoiceBloc>()
                            .add(MultiChooseCustomInput());
                      }
                    },
                  ),
                  Container(
                    width: DeviceScreen.devWidth - 100,
                    height: 45,
                    key: key,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: BlocListener<MultiExtraChoiceBloc,
                        MultiExtraChoiceState>(
                      listener: (context, state) {
                        // if (state.inputState is FormInputSucess) {
                        //   questionTitleController.clear();
                        // }
                      },
                      child: TextField(
                        controller: questionTitleController,
                        onChanged: (val) => context
                            .read<MultiExtraChoiceBloc>()
                            .add(MultiExtraEssayFill(answer: val)),
                        style: blackFontStyle2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: greyFontStyle,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
          const SizedBox(
            height: defaultMargin,
          ),
          SizedBox(
            height: 45,
            width: DeviceScreen.devWidth - defaultMargin * 2,
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<MultiExtraChoiceBloc>()
                    .add(MultiExtraChoiceSubmit());
              },
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  backgroundColor: MaterialStateProperty.all(mainColor)),
              child: Text(
                'Submit',
                style: blackFontStyle.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
