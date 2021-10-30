import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ungtravel/states/add_travel.dart';
import 'package:ungtravel/states/authen.dart';
import 'package:ungtravel/states/create_account.dart';
import 'package:ungtravel/states/list_travel.dart';
import 'package:ungtravel/states/omesepayment.dart';
import 'package:ungtravel/states/prompayment.dart';
import 'package:ungtravel/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => const Authen(),
  '/createAccount': (BuildContext context) => const CreateAccount(),
  '/listTravel': (BuildContext context) => const ListTravel(),
  '/addTravel': (BuildContext context) => const AddTravel(),
  '/promPayment': (BuildContext context) => const Prompayment(),
  MyConstant.routeOmesepayment: (BuildContext context) => const OmesePayment(),
};

String? firstState;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();

  firstState = MyConstant.routeOmesepayment;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: firstState,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
