part of '../../../../pages.dart';

// ignore: must_be_immutable
class QuestionQuadChoiceWidget extends StatelessWidget {
  QuestionQuadChoiceWidget({Key? key, required this.quiz, required this.bloc})
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
            children: List.generate((quiz as QuadChoiceModel).choices.length,
                (index) {
              return ListTile(
                leading: BlocBuilder<QuadChoiceBloc, QuadChoiceState>(
                  builder: (context, state) {
                    return Checkbox(
                      value: index == state.currentAnswer ? true : false,
                      onChanged: (val) {
                        if (val!) {
                          context
                              .read<QuadChoiceBloc>()
                              .add(QuadChoiceChoosingAnswer(index: index));
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
                  child: Text((quiz as QuadChoiceModel).choices[index].title,
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
                context.read<QuadChoiceBloc>().add(QuadChoiceSubmit());
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
