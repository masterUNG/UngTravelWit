import 'dart:convert';

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:omise_flutter/omise_flutter.dart';

class OmeseModel {
  final String? name;
  final String? number;
  final String? expMonth;
  final String? extYesr;
  final String? security;
  final String? price;
  OmeseModel({
    this.name,
    this.number,
    this.expMonth,
    this.extYesr,
    this.security,
    this.price,
  });

  String? token;
  String? status;

  Future<String> getToken() async {
    String publicKey = 'pkey_test_5pp9n4x6lu8v0riuskf';
    var codec = latin1.fuse(base64);
    var specialKey = codec.encode(publicKey);

    try {
      Map<String, dynamic> data = {
        "expiration_month": '2',
        "expiration_year": '2022',
        "name": "Somchai Prasert",
        "number": "4242424242424242",
        "security_code": "123",
      };
      print('## data ข้อมูลบัตร ==> $data');

      OmiseFlutter omiseFlutter = OmiseFlutter(publicKey);
      await omiseFlutter.token
          .create(
        data['name'],
        data['number'],
        data['expiration_month'],
        data['expiration_year'],
        data['security_code'],
      )
          .then((value) async {
        print('### value from omiseFlutter = ${value.toJson()}');
        token = value.id;
        print('### token = $token');

        String secretKey = 'skey_test_5pj6xiqsml00cgz0ze2';
        String basicAuth =
            'Basic ' + base64Encode(utf8.encode(secretKey + ":"));
        Map<String, String> headerMap = {};
        headerMap['authorization'] = basicAuth;
        headerMap['Cache-Control'] = 'no-cache';
        headerMap['Content-Type'] = 'application/x-www-form-urlencoded';

        Map<String, dynamic> data = {
          'amount': '200000',
          'currency': 'thb',
          'card': token,
        };

        Uri chargeUri = Uri.parse('https://api.omise.co/charges');
        http.Response response = await http.post(
          chargeUri,
          headers: headerMap,
          body: data,
        );

        var resultCharge = json.decode(response.body);
        print('#### resultCharge = $resultCharge');
        print('#### status ของการตัดบัตร ==> ${resultCharge['status']}');
      });

      // String urlStr = 'https://vault.omise.co/tokens';
      //   Uri uri = Uri.parse(urlStr);

      //   String basicAuth =
      //       'Basic ' + base64Encode(utf8.encode(publicKey + ":"));
      //   Map<String, String> headerMap = {};
      //   headerMap['authorization'] = basicAuth;
      //   headerMap['Cache-Control'] = 'no-cache';
      //   headerMap['Content-Type'] = 'application/x-www-form-urlencoded';

      // Map<String, String> headerMap = {};
      // headerMap[HttpHeaders.authorizationHeader] = 'Basic $specialKey';

      // http.Response response = await http.post(
      //   uri,
      //   headers: headerMap,
      //   body: data,
      // );

      // var result = json.decode(response.body);
      // var myToken = result['id'];

      // print('result ==> $result');
      // print('myToken = $myToken');

      // Dio dio = Dio();
      // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      //     (HttpClient client) {
      //   client.badCertificateCallback =
      //       (X509Certificate x509certificate, String string, int i) => true;
      //   return client;
      // };
      // dio.options.headers[HttpHeaders.authorizationHeader] = headerMap;
      // dio.options.headers["Authorization"] = "Basic $specialKey";

      // dio.options.contentType = ContentType("application","x-www-form-urlencoded") as String?;
      // dio.options.contentType = ContentType(primaryType, subType)
      // dio.options.headers[HttpHeaders.authorizationHeader] ="Basic $specialKey";

      // Options options = Options(headers: headerMap);

      // await dio
      //     .post(
      //       'https://vault.omise.co/tokens',
      //       data: data,
      //       options: options,
      //     )
      //     .then((value) => print('value ==> $value'));
    } catch (e) {
      print('errer ==> ${e.toString()}');
    }

    return '';
  }
}
