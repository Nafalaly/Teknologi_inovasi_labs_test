part of '../pages.dart';

class FunctionalProgrammingPage extends StatelessWidget {
  const FunctionalProgrammingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              Text('Functional Programming', style: headerFontStyle2),
              Text(
                'Menurut saya functional programming adalah salah satu metode yang diterapkan dalam dunia pemrograman dan pengembangan perangkat lunak, Berbeda dari Object Oriented Programming atau OOP, Functional Programming lebih cenderung bersifat statis dalam pengolahanya berbeda dari OOP yang bersifat dinamis artinya setiap input yang kita masukan dalam sebuah fungsi yang kita buat akan selalu menghasilkan output yang sama',
                style: blackFontStyle,
                maxLines: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
