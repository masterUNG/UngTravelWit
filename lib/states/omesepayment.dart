import 'dart:async';

import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:ungtravel/models/omese_model.dart';
import 'package:ungtravel/utility/my_constant.dart';
import 'package:ungtravel/widgets/show_text.dart';

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
          TextFormField(),
        ],
      ),
    );
  }

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
        processDownload();
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

  Widget omeseButton() {
    return ElevatedButton(
        onPressed: () async {
          await OmeseModel().getToken().then((value) {
            print('omise Token ==> $value');
          });
        },
        child: const Text('Req Token'));
  }
}
