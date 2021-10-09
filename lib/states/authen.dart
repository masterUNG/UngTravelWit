import 'package:flutter/material.dart';
import 'package:ungtravel/utility/my_constant.dart';
import 'package:ungtravel/widgets/show_image.dart';
import 'package:ungtravel/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                buildImage(constraints),
                buildAppName(),
                buildUser(constraints),
                buildPassword(constraints),
                buildLogin(constraints),
                const Spacer(),
                buildCreateAccount(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ShowText(title: 'Non Account ? '),
        TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, MyConstant.routeCreateAccount),
            child: ShowText(
              title: 'Create Account',
              textStyle: MyConstant().h2Style(),
            ))
      ],
    );
  }

  Container buildLogin(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: constraints.maxWidth * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: MyConstant.dart),
        onPressed: () {},
        child: const Text('Login'),
      ),
    );
  }

  Container buildUser(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'User :',
          prefixIcon: Icon(Icons.perm_identity),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildPassword(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password :',
          prefixIcon: Icon(Icons.lock_outline),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  ShowText buildAppName() {
    return ShowText(
      title: MyConstant.appName,
      textStyle: MyConstant().h1Style(),
    );
  }

  Container buildImage(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.6,
      child: const ShowImage(),
    );
  }
}
