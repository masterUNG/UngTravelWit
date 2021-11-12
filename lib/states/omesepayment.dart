import 'dart:async';

import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omise_flutter/omise_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:ungtravel/models/omese_model.dart';
import 'package:ungtravel/utility/my_constant.dart';
import 'package:ungtravel/widgets/show_text.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

class OmesePayment extends StatefulWidget {
  const OmesePayment({Key? key}) : super(key: key);

  @override
  _OmesePaymentState createState() => _OmesePaymentState();
}

class _OmesePaymentState extends State<OmesePayment> {
  StreamController streamController = StreamController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamController.add('Test Doramon');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Omese Payment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildStream(),
          omeseButton(),
          saveTextButton(),
          buildDownloadImage(),
          TextFormField(),
        ],
      ),
    );
  }

  ElevatedButton buildDownloadImage() => ElevatedButton(
        onPressed: () async {
          // await Permission.photos.status.then((value) async {
          //   print('## value11 permission ==> $value');
          //   if (value.isDenied) {
          //     await Permission.photos.request().then((value) {
          //       print('## value22 permission ==> $value');
          //     });
          //   }
          // });
        },
        child: const Text('Download Image'),
      );

  Container buildStream() => Container(
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return ShowText(
                title: 'Test Build Stream',
                textStyle: MyConstant().h1Style(),
              );
            }),
      );

  ElevatedButton saveTextButton() {
    return ElevatedButton(
      onPressed: () {
        Clipboard.setData(
            ClipboardData(text: 'https://promptpay.io/0818595309.png'));
        // processDownload();
      },
      child: const Text('Save Text'),
    );
  }

  Future<void> processDownload() async {
    String urlDownload =
        'https://www.androidthai.in.th/election/data/iconMasterUng.png';
    String path = '/sdcard/download';
    print('## path ==>> $path');
    try {
      await FileUtils.mkdir([path]);
      await Dio()
          .download(urlDownload, '$path/masterung.png')
          .then((value) => print('## Download finish'));
    } catch (e) {
      print('## error ==>>${e.toString()}');
    }
  }

  Future<void> findTokenAnCharge() async {

    Map<String, dynamic> data = {
      "expiration_month": 2,
      "expiration_year": 2024,
      "name": "Somchai Prasert",
      "number": "4111111111111111",
      "security_code": 123,
    };

    var codec = latin1.fuse(base64);
    var specialKey = codec.encode('pkey_test_5pjubjexgt8xnb46qbo');

    String urlStr = 'https://vault.omise.co/tokens';
    Uri uri = Uri.parse(urlStr);
    String basicAuth = 'Basic ' + base64Encode(utf8.encode(publicKey + ":"));

    Map<String, String> headerMap = {};
    headerMap['authorization'] = basicAuth;
    headerMap['Cache-Control'] = 'no-cache';
    headerMap['Content-Type'] = 'application/x-www-form-urlencoded';

    http.Response response = await http.post(
      uri,
      headers: headerMap,
      body: data,
    );

    print('## res ==> ${response.body.toString()}');
  }

  Widget omeseButton() {
    return ElevatedButton(
      onPressed: () {
        // findTokenAnCharge();
        OmeseModel().getToken();
      },
      child: const Text('Req Token'),
    );
  }

  String publicKey = 'pkey_test_5pjubjexgt8xnb46qbo';

  Future<void> tokenByPackage() async {
    OmiseFlutter omiseFlutter = OmiseFlutter(publicKey);

    await omiseFlutter.token
        .create('Master Ung', '4242424242424242', '2', '2022', '123')
        .then((value) async {
      String? token = value.id;
      print('## token = $token');
      await omiseFlutter.source
          .create(
        1000,
        'thb',
        'internet_banking_bay',
      )
          .then((value) {
        print('## value ==>> ${value.toJson()}');
      });
    });

    // await tokenByPackage(omiseFlutter);

    // await OmeseModel().getToken().then((value) async {
    //   String token = value;
    //   print('omise Token ==> $token');

    //   // await omiseFlutter.capability.retrieve().then((value) {
    //   //   print('retricve ==> ${value.toJson()}');
    //   // });
    // });

    // await omiseFlutter.source
    //     .create(
    //   100,
    //   'thb',
    //   'internet_banking_bay',
    //   // terminalId: token,
    // )
    //     .then((value) {
    //   print('source => ${value.toJson()}');
    // });

    // await OmeseModel().getToken().then((value) async {
    //   String token = value;
    //   print('omise Token ==> $token');

    //   // await omiseFlutter.capability.retrieve().then((value) {
    //   //   print('retricve ==> ${value.toJson()}');
    //   // });
  }
}
