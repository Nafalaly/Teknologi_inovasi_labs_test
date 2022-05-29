part of '../../pages.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.score,
    required this.total,
  }) : super(key: key);
  final int score;
  final int total;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(defaultMargin),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Terimakasih sudah bermain',
                  style: headerFontStyle2.copyWith(color: mainColor)),
              Text('Jawaban kamu benar $score/$total', style: blackFontStyle),
            ]),
      ),
    ));
  }
}
