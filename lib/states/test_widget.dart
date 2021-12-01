import 'package:flutter/material.dart';
import 'package:ungtravel/widgets/show_textformfield.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppBar(),
      body: Center(
        child: SizedBox(
          width: 250,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShowTextFormField(
                  label: 'Name',
                  mySave: myName,
                  myValidate: myVerlidate,
                ),
                const SizedBox(
                  height: 16,
                ),
                ShowTextFormField(
                  label: 'Surname',
                  mySave: mySurname,
                  myValidate: myVerlidate,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar newAppBar() {
    return AppBar(
      title: const Text('Test Widget'),
    );
  }

  String? myVerlidate(String? string) {
    if (string!.isEmpty) {
      return 'Fill In Blank';
    } else {
      return null;
    }
  }

  myName(String? string) {
    print('Name ==>> $string');
  }

  mySurname(String? string) {
    print('Surname ==>> $string');
  }
}
