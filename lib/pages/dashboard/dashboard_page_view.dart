import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknologi_inovasi_labs_test/pages/counter_page/cubit/counter_page_cubit.dart';
import 'package:teknologi_inovasi_labs_test/pages/pages.dart';
import 'package:teknologi_inovasi_labs_test/pages/quiz_pages/bloc/quiz_page_bloc.dart';
import 'package:teknologi_inovasi_labs_test/services/services.dart';
import 'package:teknologi_inovasi_labs_test/shared/shared.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: DeviceScreen.devHeight * 0.4,
            width: DeviceScreen.devWidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/dashboard_asset.jpg'),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(defaultMargin),
                height: DeviceScreen.devHeight * 0.3,
                width: DeviceScreen.devWidth,
                child: Container(
                  color: Colors.black45,
                  padding: const EdgeInsets.all(5),
                  child: Text('Dashboard',
                      style: headerFontStyle2.copyWith(color: Colors.white)),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: DeviceScreen.devHeight * 0.3),
                height: DeviceScreen.devHeight * 0.7,
                width: DeviceScreen.devWidth,
                decoration: BoxDecoration(
                    color: greyBackground,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    )),
                child: _mainComp(context),
              ),
            ],
          )
        ],
      ),
    ));
  }

  Widget _mainComp(BuildContext context) {
    final List<_TestDashboardClass> availableTest = [
      _TestDashboardClass(
          title: 'Counter App',
          subTitle:
              'Buatlah aplikasi sederhana, yang menampilkan jumlah berapa kali button di click. Tiap click pada button, angka akan berubah',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => CounterPageCubit(),
                        child: const CounterPage(),
                      )),
            );
          }),
      _TestDashboardClass(
          title: 'Quiz App',
          subTitle:
              '2.Buatlah aplikasi (tanpa menggunakan back-end). Yang memiliki kemampuan untuk:..',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => QuizPageBloc(),
                        child: QuizDashboard(),
                      )),
            );
          }),
    ];
    return Container(
      padding: const EdgeInsets.all(defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Soal :', style: blackFontStyle),
          const SizedBox(height: 10),
          Column(
            children: List.generate(availableTest.length, (index) {
              return testWidget(
                  index: (index + 1).toString(),
                  title: availableTest[index].title,
                  subTitle: availableTest[index].subTitle,
                  onTap: availableTest[index].onTap);
            }),
          )
        ],
      ),
    );
  }

  Widget testWidget({
    required String index,
    required String title,
    required String subTitle,
    required Function onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultMargin),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        onTap: () => onTap(),
        leading: Text(index, style: blackFontStyle),
        title: Text(title, style: blackFontStyle),
        subtitle: Text(subTitle, style: greyFontStyle),
      ),
    );
  }
}

class _TestDashboardClass {
  String title;
  String subTitle;
  Function onTap;
  _TestDashboardClass({
    required this.title,
    required this.subTitle,
    required this.onTap,
  });
}
