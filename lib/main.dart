import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teknologi_inovasi_labs_test/pages/dashboard/dashboard_page_view.dart';
import 'package:teknologi_inovasi_labs_test/pages/pages.dart';
import 'package:teknologi_inovasi_labs_test/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Dashboard',
      routes: {
        '/Dashboard': (context) => const Dashboard(),
        '/CounterPage': (context) => const CounterPage(),
      },
      theme: ThemeData(primarySwatch: Colors.blue),
      builder: (context, child) {
        DeviceScreen.setup(context: context);
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(0.8, 0.8);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
          child: child!,
        );
      },
      title: 'TILabs Test',
    );
  }
}
