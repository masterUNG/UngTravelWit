import 'package:flutter/material.dart';
import 'package:ungtravel/states/add_travel.dart';
import 'package:ungtravel/states/authen.dart';
import 'package:ungtravel/states/create_account.dart';
import 'package:ungtravel/states/list_travel.dart';
import 'package:ungtravel/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => const Authen(),
  '/createAccount': (BuildContext context) => const CreateAccount(),
  '/listTravel': (BuildContext context) => const ListTravel(),
  '/addTravel': (BuildContext context) => const AddTravel(),
};

String? firstState;

main() {
  firstState = MyConstant.routeAuthen;
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
