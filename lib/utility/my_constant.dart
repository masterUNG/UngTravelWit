import 'package:flutter/material.dart';

class MyConstant {
  // field
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeListTravel = '/listTravel';
  static String routeAddTravel = '/addTravel';
  static String routePromPayment = '/promPayment';
  static String routeOmesepayment = '/omesePayment';

  static String appName = 'Ung Travel';
  static String urlPrompay = 'https://promptpay.io/0818595309.png';

  static Color dart = const Color(0xff99004c);

  static String domain =
      'https://13da-2405-9800-bc01-e26f-70d7-828b-6a4d-fbe0.ngrok.io';

  // method
  TextStyle h1Style() => TextStyle(
        color: dart,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        color: dart,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        color: dart,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
}
