// ignore_for_file: file_names

part of '../../shared.dart';

class QuizQuadChoiceExtraWidget extends StatelessWidget {
  QuizQuadChoiceExtraWidget({Key? key, required this.bloc}) : super(key: key);

  final QuizPageBloc bloc;
  final TextEditingController essayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizQuadChoiceExtraBloc(mainPageBloc: bloc),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: defaultMargin),
        width: DeviceScreen.devWidth,
        child: BlocBuilder<QuizQuadChoiceExtraBloc, QuizQuadChoiceExtraState>(
          builder: (context, state) {
            return Column(
              children: [
                Column(
                  children: List.generate(state.choices.length, (index) {
                    return ListTile(
                      leading: Text(
                        (index + 1).toString(),
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
                              .read<QuizQuadChoiceExtraBloc>()
                              .add(QuizQuadChoiceExtraChangeTitleChoice(
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
                            context.read<QuizQuadChoiceExtraBloc>().add(
                                QuizQuadChoiceExtraSetChoiceAsTrueAnswer(
                                    index: index));
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User Input :', style: blackFontStyle),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: greyColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: TextField(
                        controller: essayController,
                        onChanged: (val) => context
                            .read<QuizQuadChoiceExtraBloc>()
                            .add(QuizQuadChoiceExtraChangeEssay(newTitle: val)),
                        style: blackFontStyle2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: greyFontStyle,
                        ),
                      ),
                    ),
                    BlocBuilder<QuizQuadChoiceExtraBloc,
                        QuizQuadChoiceExtraState>(
                      builder: (context, state) {
                        return CheckboxListTile(
                          activeColor: Colors.green,
                          value: state.essayIsTrue,
                          onChanged: (val) {
                            if (val!) {
                              context
                                  .read<QuizQuadChoiceExtraBloc>()
                                  .add(QuizQuadChoiceExtraEssayMarkAsTrue());
                            }
                          },
                          title: Text('Tandai sebagai jawaban yang benar',
                              style: blackFontStyle2),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(height: 15),
                BlocListener<QuizQuadChoiceExtraBloc, QuizQuadChoiceExtraState>(
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
                            .read<QuizQuadChoiceExtraBloc>()
                            .add(QuizQuadChoiceExtraAttemptAdd());
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
