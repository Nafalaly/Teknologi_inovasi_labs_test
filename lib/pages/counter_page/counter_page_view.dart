part of '../pages.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Counter App',
            context: context,
            subtitle: '',
          ),
          Container(
            height: DeviceScreen.devHeight - 100,
            width: DeviceScreen.devWidth,
            padding: const EdgeInsets.all(defaultMargin),
            color: greyBackground,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Anda sudah menekan tombol sebanyak:',
                  style: blackFontStyle,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<CounterPageCubit, CounterPageState>(
                    builder: (context, state) {
                      return Text(
                        '${state.counter} kali',
                        style: blackFontStyle,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
                SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterPageCubit>(context)
                            .increaseNumber();
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          backgroundColor:
                              MaterialStateProperty.all(mainColor)),
                      child: Text(
                        'Tambah',
                        style: blackFontStyle.copyWith(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
