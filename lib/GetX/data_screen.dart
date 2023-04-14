import 'package:flutter/material.dart';
import 'package:get_data/GetX/Controller/controller.dart';
import 'package:get/get.dart';

class DataScreen extends StatelessWidget {
  DataScreen({Key? key}) : super(key: key);

  final DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    dataController.dataList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Api Data"),
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${dataController.name}"),
            dataController.dataList != null
                ? getList()
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //dataController.changeName();
          dataController.getData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getList() {
    return Expanded(
      child: ListView.builder(
          itemCount: dataController.dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    //margin: const EdgeInsets.all(5),
                    elevation: 5,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${dataController.dataList[index].id}"),
                            Text(dataController.dataList[index].email),
                            Text(dataController.dataList[index].name),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
