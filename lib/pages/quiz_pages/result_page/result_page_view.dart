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
      body: Center(child: Text('Game Over\nJawaban benar $score/$total')),
    ));
  }
}
