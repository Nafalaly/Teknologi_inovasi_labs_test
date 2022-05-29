part of '../../shared.dart';

class QuizEssayShortWidget extends StatelessWidget {
  QuizEssayShortWidget({Key? key, required this.bloc}) : super(key: key);

  final QuizPageBloc bloc;
  final TextEditingController essayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizShortEssayBloc(mainPageBloc: bloc),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: defaultMargin),
        width: DeviceScreen.devWidth,
        child: BlocBuilder<QuizShortEssayBloc, QuizShortEssayState>(
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
                    controller: essayController,
                    onChanged: (val) => context
                        .read<QuizShortEssayBloc>()
                        .add(QuizEssayChanged(essay: val)),
                    style: blackFontStyle2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                BlocListener<QuizShortEssayBloc, QuizShortEssayState>(
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
                            .read<QuizShortEssayBloc>()
                            .add(QuizEssayAttemptAdd());
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
