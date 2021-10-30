import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ungtravel/utility/my_constant.dart';
import 'package:ungtravel/widgets/show_text.dart';

class Prompayment extends StatefulWidget {
  const Prompayment({Key? key}) : super(key: key);

  @override
  _PrompaymentState createState() => _PrompaymentState();
}

class _PrompaymentState extends State<Prompayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PromPay'),
      ),
      body: Center(
        child: Column(
          children: [
            ShowText(
              title: 'PromPay :',
              textStyle: MyConstant().h1Style(),
            ),CachedNetworkImage(imageUrl: MyConstant.urlPrompay)
          ],
        ),
      ),
    );
  }
}
