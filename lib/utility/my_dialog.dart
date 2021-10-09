import 'package:flutter/material.dart';
import 'package:ungtravel/utility/my_constant.dart';
import 'package:ungtravel/widgets/show_image.dart';
import 'package:ungtravel/widgets/show_text.dart';

class MyDialog {
  Future<void> normalDialot(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: const ShowImage(),
          title: ShowText(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(title: message),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
