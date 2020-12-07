import 'package:flutter_app/Store/store.dart';
import 'package:provider/provider.dart';
import '../untils/request.dart';

class cart {
  getCarInfo() async {
    var data;
    data = await HttpManager().postForm('searchCart/', data: {'WXuserid': 1});
    print(data);
    ChangeNotifierProvider<Changecartlist>.value(
        value: Changecartlist(data.data['data'], data.data['countprice']));
  }
}
