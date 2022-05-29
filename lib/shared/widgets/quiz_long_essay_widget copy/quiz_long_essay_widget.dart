part of '../../shared.dart';

class QuizEssayLongWidget extends StatelessWidget {
  QuizEssayLongWidget({Key? key, required this.bloc}) : super(key: key);

  final QuizPageBloc bloc;
  final TextEditingController essayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizLongEssayBloc(mainPageBloc: bloc),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: defaultMargin),
        width: DeviceScreen.devWidth,
        child: BlocBuilder<QuizLongEssayBloc, QuizLongEssayState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jawaban :', style: blackFontStyle),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: greyColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: TextField(
                    maxLines: 4,
                    enableInteractiveSelection: true,
                    controller: essayController,
                    onChanged: (val) => context
                        .read<QuizLongEssayBloc>()
                        .add(QuizEssayLongChanged(essay: val)),
                    style: blackFontStyle2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                BlocListener<QuizLongEssayBloc, QuizLongEssayState>(
                  listener: (context, state) {
                    if (state.inputState is FormBadInputState) {
                      showWarning(
                          message:
                              (state.inputState as FormBadInputState).message,
                          context: context);
                    }
                    if (state.inputState is FormInputSucess) {
                      essayController.clear();
                      showWarning(
                          message: 'Berhasil menambahkan soal',
                          context: context,
                          backgroundColor: Colors.green,
                          icon: Icons.done);
                    }
                  },
                  child: SizedBox(
                    height: 45,
                    width: DeviceScreen.devWidth - defaultMargin * 2,
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<QuizLongEssayBloc>()
                            .add(QuizEssayLongAttemptAdd());
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          backgroundColor:
                              MaterialStateProperty.all(mainColor)),
                      child: Text(
                        'Tambahkan Soal',
                        style: blackFontStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
