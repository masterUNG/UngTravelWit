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
          child: Container(
            decoration: BoxDecoration(color: Colors.purple.withOpacity(0.3)),
            child: Center(
              child: CustomScrollView(
                // mainAxisAlignment: MainAxisAlignment.center,
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      children: [
                        const Spacer(flex: 1,),
                        buildImage(constraints),
                        buildAppName(),
                        buildUser(constraints),
                        buildPassword(constraints),
                        buildLogin(constraints),
                        const Spacer(flex: 2,),
                        buildCreateAccount(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Container buildCreateAccount() {
    return Container(margin: const EdgeInsets.only(bottom: 16),
      child: Row(
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
      ),
    );
  }

  Container buildLogin(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: constraints.maxWidth * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: MyConstant.dart, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),),
        onPressed: () {},
        child: const Text('Login'),
      ),
    );
  }

  Container buildUser(BoxConstraints constraints) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(0.5),
      ),
      margin: const EdgeInsets.only(top: 8),
      width: constraints.maxWidth * 0.6,
      height: 40,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          hintText: 'User :',
          hintStyle: MyConstant().h3Style(),
          prefixIcon: Icon(
            Icons.perm_identity,
            color: MyConstant.dart,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: MyConstant.dart),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: MyConstant.dart),
          ),
        ),
      ),
    );
  }

  Container buildPassword(BoxConstraints constraints) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(0.5),
      ),
      margin: const EdgeInsets.only(top: 16),
      width: constraints.maxWidth * 0.6,
      height: 40,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          hintText: 'Password :',
          hintStyle: MyConstant().h3Style(),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: MyConstant.dart,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: MyConstant.dart),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: MyConstant.dart),
          ),
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
