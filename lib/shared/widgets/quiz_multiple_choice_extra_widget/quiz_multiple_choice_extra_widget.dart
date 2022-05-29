// ignore_for_file: file_names

part of '../../shared.dart';

class QuizMultipleChoiceExtraWidget extends StatelessWidget {
  QuizMultipleChoiceExtraWidget({Key? key, required this.bloc})
      : super(key: key);

  final QuizPageBloc bloc;
  final TextEditingController essayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizMultipleChoiceExtraBloc(mainPageBloc: bloc),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: defaultMargin),
        width: DeviceScreen.devWidth,
        child: BlocBuilder<QuizMultipleChoiceExtraBloc,
            QuizMultipleChoiceExtraState>(
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
                              .read<QuizMultipleChoiceExtraBloc>()
                              .add(QuizMultipleChoiceExtraChangeTitleChoice(
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
                            context.read<QuizMultipleChoiceExtraBloc>().add(
                                QuizMultipleChoiceExtraSetChoiceAsTrueAnswer(
                                    index: index));
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                FloatingActionButton(
                  onPressed: () {
                    context
                        .read<QuizMultipleChoiceExtraBloc>()
                        .add(QuizMultipleChoiceExtraAddChoices());
                  },
                  child: const Icon(Icons.add),
                ),
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
                            .read<QuizMultipleChoiceExtraBloc>()
                            .add(QuizMultipleChoiceExtraChangeEssay(
                                newTitle: val)),
                        style: blackFontStyle2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: greyFontStyle,
                        ),
                      ),
                    ),
                    BlocBuilder<QuizMultipleChoiceExtraBloc,
                        QuizMultipleChoiceExtraState>(
                      builder: (context, state) {
                        return CheckboxListTile(
                          activeColor: Colors.green,
                          value: state.essayIsTrue,
                          onChanged: (val) {
                            if (val!) {
                              context.read<QuizMultipleChoiceExtraBloc>().add(
                                  QuizMultipleChoiceExtraEssayMarkAsTrue());
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
                BlocListener<QuizMultipleChoiceExtraBloc,
                    QuizMultipleChoiceExtraState>(
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
                            .read<QuizMultipleChoiceExtraBloc>()
                            .add(QuizMultipleChoiceExtraAttemptAdd());
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
