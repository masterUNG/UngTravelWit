import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungtravel/models/get_main_icon_model.dart';
import 'package:ungtravel/utility/my_constant.dart';
import 'package:ungtravel/widgets/show_progress.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  Future<List<GetMainIconModel>> processReadData() async {
    List<GetMainIconModel> getMainIconModels = [];
    var result = await Dio().get(MyConstant.apiData);
    for (var item in result.data) {
      getMainIconModels.add(GetMainIconModel.fromMap(item));
    }
    return getMainIconModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Data'),
      ),
      body: FutureBuilder(
        future: processReadData(),
        builder: (context, AsyncSnapshot<List<GetMainIconModel>> snapshot) {
          if (snapshot.hasData) {
            List<GetMainIconModel>? getMainIconModels = snapshot.data;
            return ListView.builder(itemCount: getMainIconModels!.length,
              itemBuilder: (context, index) =>
                  Text(getMainIconModels[index].text),
            );
          } else {
            return const ShowProgress();
          }
        },
      ),
    );
  }
}
