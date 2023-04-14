import 'dart:convert';
import 'package:get/get.dart';
import '../../Model/data_model.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  var dataList = <DataModel>[].obs;
  var name = 'Qaim Raza'.obs;
  RxInt number = 0.obs;

  void changeName() {
    // number+=1;
    name.value = "Engr Qaim Raza Nutkani";
    print("clicked");
  }

  Future<void> getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts/1/comments";
    var res = await http.get(Uri.parse(url));
    dataList.value = jsonDecode(res.body)
        .map((item) => DataModel.fromJson(item))
        .toList()
        .cast<DataModel>();
    print("**************************");
    print(res.body);
    print("**************************");
  }
}
