part of '../../../../pages.dart';

// ignore: must_be_immutable
class QuestionMultipleChoiceWidget extends StatelessWidget {
  QuestionMultipleChoiceWidget(
      {Key? key, required this.quiz, required this.bloc})
      : super(key: key);
  QuizModel quiz;
  PlayPageBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceScreen.devWidth,
      child: Column(
        children: [
          Column(
            children: List.generate(
                (quiz as MultipleChoiceModel).choices.length, (index) {
              return ListTile(
                leading: BlocBuilder<MultiChoiceBloc, MultiChoiceState>(
                  builder: (context, state) {
                    return Checkbox(
                      value: index == state.currentAnswer ? true : false,
                      onChanged: (val) {
                        if (val!) {
                          context
                              .read<MultiChoiceBloc>()
                              .add(MultiChoiceChoosingAnswer(index: index));
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
                      (quiz as MultipleChoiceModel).choices[index].title,
                      style: blackFontStyle),
                ),
              );
            }),
          ),
          const SizedBox(
            height: defaultMargin,
          ),
          SizedBox(
            height: 45,
            width: DeviceScreen.devWidth - defaultMargin * 2,
            child: ElevatedButton(
              onPressed: () {
                context.read<MultiChoiceBloc>().add(MultiChoiceSubmit());
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
