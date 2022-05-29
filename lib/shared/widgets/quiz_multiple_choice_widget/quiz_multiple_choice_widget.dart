// ignore_for_file: file_names

part of '../../shared.dart';

class QuizMultipleChoiceWidget extends StatelessWidget {
  const QuizMultipleChoiceWidget({Key? key, required this.bloc})
      : super(key: key);

  final QuizPageBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizMultipleChoiceBloc(mainPageBloc: bloc),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: defaultMargin),
        width: DeviceScreen.devWidth,
        child:
            BlocBuilder<QuizMultipleChoiceBloc, QuizMultipleChoiceChoiceState>(
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
                              .read<QuizMultipleChoiceBloc>()
                              .add(QuizMultipleChoiceChangeTitleChoice(
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
                            context.read<QuizMultipleChoiceBloc>().add(
                                QuizMultipleChoiceSetChoiceAsTrueAnswer(
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
                        .read<QuizMultipleChoiceBloc>()
                        .add(QuizMultipleChoiceAddChoices());
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 15),
                BlocListener<QuizMultipleChoiceBloc,
                    QuizMultipleChoiceChoiceState>(
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
                            .read<QuizMultipleChoiceBloc>()
                            .add(QuizMultipleChoiceAttemptAdd());
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
