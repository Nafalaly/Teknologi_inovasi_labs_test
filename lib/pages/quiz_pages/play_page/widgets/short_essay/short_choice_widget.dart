part of '../../../../pages.dart';

// ignore: must_be_immutable
class ShortEssayChoiceWidget extends StatelessWidget {
  ShortEssayChoiceWidget({Key? key, required this.quiz, required this.bloc})
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
          BlocBuilder<ShortEssayChoiceBloc, ShortEssayChoiceState>(
            builder: (context, state) {
              return Container(
                width: DeviceScreen.devWidth - 100,
                height: 45,
                key: key,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child:
                    BlocListener<ShortEssayChoiceBloc, ShortEssayChoiceState>(
                  listener: (context, state) {
                    // if (state.inputState is FormInputSucess) {
                    //   questionTitleController.clear();
                    // }
                  },
                  child: TextField(
                    controller: questionTitleController,
                    onChanged: (val) => context
                        .read<ShortEssayChoiceBloc>()
                        .add(EssayFill(answer: val)),
                    style: blackFontStyle2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                    ),
                  ),
                ),
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
                    .read<ShortEssayChoiceBloc>()
                    .add(ShortEssayChoiceSubmit());
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
