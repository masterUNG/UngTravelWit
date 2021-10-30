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
    String publicKey = 'pkey_test_5pjubjexgt8xnb46qbo';
    var codec = latin1.fuse(base64);
    var specialKey = codec.encode(publicKey);

    Map<String, dynamic> data = {
      "expiration_month": '2',
      "expiration_year": '2022',
      "name": "Somchai Prasert",
      "number": "4242424242424242",
      "security_code": "123",
      "street1": "476 Fifth Avenue",
      "city": "New York",
      "state": "NY",
      "postal_code": "10320",
      "country": "US",
      // "price":"123"
    };

    try {
      OmiseFlutter omiseFlutter = OmiseFlutter(publicKey);
      await omiseFlutter.token
          .create(
        "Somchai Prasert",
        "4242424242424242",
        '2',
        '2022',
        "123",
      )
          .then((value) {
        print('token ==> ${value.id}');
        token = value.id;
      });
    } catch (e) {
      print('errer ==> ${e.toString()}');
    }

    return token!;
  }
}
