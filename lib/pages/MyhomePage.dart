import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Cart.dart';
import 'Store.dart';
import 'Userinfo.dart';
import 'index.dart';

class MyhomePage extends StatefulWidget {
  MyhomePage({Key key}) : super(key: key);

  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  int index = 0;
  List<Widget> pagelist = List();

  @override
  void initState() {
    super.initState();
    pagelist..add(Myindex())..add(Store())..add(Cart())..add(Userinfo());
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('促销商城'),
      // ),
      // body: pagelist[this.index],
      body: IndexedStack(
        index: this.index,
        children: this.pagelist,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.index,
        onTap: (value) {
          setState(() {
            this.index = value;
          });
        },
        selectedItemColor: Colors.amber[800],
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            // ignore: deprecated_member_use
            title: Text('商城'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            // ignore: deprecated_member_use
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            // ignore: deprecated_member_use
            title: Text('我的'),
          ),
        ],
      ),
    );
  }
}
