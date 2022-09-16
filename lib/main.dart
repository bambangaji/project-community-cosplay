import 'package:coscos/component/color.dart';
import 'package:coscos/component/sizeConfig.dart';
import 'package:coscos/page/dashboard/view/dashboard.dart';
import 'package:coscos/page/main_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  String fileName = '.env-develop';
  await dotenv.load(fileName: fileName);
  if (fileName == '.env-develop') {
    // logger.setLevel(
    //   Level.INFO,
    //   // Includes  caller info, but this is expensive.
    //   includeCallerInfo: true,
    // );
  } else {
    // logger.setLevel(
    //   Level.WARNING,
    // );
  }
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: lightMode ? Warna.softMerahMuda2 : Warna.softMerahMuda2,
      body: Center(
          child: lightMode
              ? Padding(
                  padding: EdgeInsets.all(Get.height / 10),
                  child: Image.asset('lib/assets/bg/logo-bg.png'),
                )
              : Padding(
                  padding: EdgeInsets.all(Get.height / 10),
                  child: Image.asset('lib/assets/bg/logo-bg.png'),
                )),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardPage(), //
      },
      title: 'Coscos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
