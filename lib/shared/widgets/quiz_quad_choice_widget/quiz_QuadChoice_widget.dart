// ignore_for_file: file_names

part of '../../shared.dart';

class QuizQuadWidget extends StatelessWidget {
  const QuizQuadWidget({Key? key, required this.bloc}) : super(key: key);

  final QuizPageBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizQuadChoiceBloc(mainPageBloc: bloc),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: defaultMargin),
        width: DeviceScreen.devWidth,
        child: BlocBuilder<QuizQuadChoiceBloc, QuizQuadChoiceState>(
          builder: (context, state) {
            return Column(
              children: [
                Column(
                  children:
                      List.generate(state.alphabeticOrder.length, (index) {
                    return ListTile(
                      leading: Text(
                        state.alphabeticOrder[index],
                        style: blackFontStyle2,
                      ),
                      title: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: greyColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: TextField(
                          controller: state.textfieldController[index],
                          onChanged: (val) => context
                              .read<QuizQuadChoiceBloc>()
                              .add(QuizQuadChangeTitleChoice(
                                  index: index, newTitle: val)),
                          style: blackFontStyle2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: greyFontStyle,
                          ),
                        ),
                      ),
                      trailing: Checkbox(
                        activeColor: Colors.green,
                        value: state.choices[index].isTrueAnswer,
                        onChanged: (val) {
                          if (val!) {
                            context.read<QuizQuadChoiceBloc>().add(
                                QuizQuadSetChoiceAsTrueAnswer(index: index));
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                BlocListener<QuizQuadChoiceBloc, QuizQuadChoiceState>(
                  listener: (context, state) {
                    if (state.inputState is FormBadInputState) {
                      showWarning(
                          message:
                              (state.inputState as FormBadInputState).message,
                          context: context);
                    }
                    if (state.inputState is FormInputSucess) {
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
                            .read<QuizQuadChoiceBloc>()
                            .add(QuizQuadAttemptAdd());
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
