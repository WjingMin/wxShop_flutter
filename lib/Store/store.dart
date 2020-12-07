import 'package:flutter/widgets.dart';

class Changecartlist with ChangeNotifier {
  List cartlist = [];
  double countprice = 0;
  Changecartlist(this.cartlist, this.countprice);

  void changecartlist(content, value) {
    print(content);
    print(value);

    cartlist = content;
    countprice = value;
    notifyListeners();
  }

  get user => cartlist;
}
