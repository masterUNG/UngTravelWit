import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungtravel/utility/my_constant.dart';
import 'package:ungtravel/utility/my_dialog.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Container buildName(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
        controller: nameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Name in Blank';
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          hintText: 'Name :',
          prefixIcon: Icon(Icons.fingerprint),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildUser(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
        controller: userController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill User in Blank';
          } else {
            return null;
          }
        },
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
      margin: const EdgeInsets.only(top: 8),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Password in Blank';
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          hintText: 'Password :',
          prefixIcon: Icon(Icons.lock_clock_outlined),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildCreateAccount(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: constraints.maxWidth * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: MyConstant.dart),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            processCreateAccount();
          }
        },
        child: const Text('Create Account'),
      ),
    );
  }

  Future<void> processCreateAccount() async {
    String name = nameController.text;
    String user = userController.text;
    String password = passwordController.text;
    print('# name = $name, user = $user, password = $password');

    String apiCheckUser =
        '${MyConstant.domain}/ungtravel/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(apiCheckUser).then(
      (value) {
        print('# value = $value');

        if (value.toString() != 'null') {
          MyDialog().normalDialot(
              context, 'User False', 'Please Change User ? User Dulucape');
        } else {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Account'),
        backgroundColor: MyConstant.dart,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildName(constraints),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildUser(constraints),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildPassword(constraints),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCreateAccount(constraints),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
