import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../untils/request.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class search extends StatefulWidget {
  search({Key key}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  String searchValue;
  List searchList = [];
  @override
  Widget build(BuildContext context) {
    // String userName = Provider.of(context).username;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //修改颜色
        ),
        brightness: Brightness.dark, //设置为白色字体
        backgroundColor: Color.fromRGBO(249, 123, 81, 1),
        // shadowColor: Colors.white,
        elevation: 0, //appbar 的阴影效果
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.w),
              child: Container(
                width: 600.w,
                height: 70.h,
                color: Colors.white,
                child: TextField(
                  style: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      color: Colors.black),
                  maxLines: 1,
                  decoration: InputDecoration(
                    isDense: true, //输入框图标文字对齐
                    hintText: '请输入搜索内容',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    this.searchValue = value;
                  },
                ),
              ),
            ),
            SizedBox(width: 30.w),
            Container(
              width: 200.w,
              height: 70.h,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(60.w))),
                color: Colors.white,
                textColor: Colors.grey,
                child: new Text(
                  '搜索',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  print(this.searchValue);
                  // this._seachGoods(this.searchValue);
                  // ChangeNotifierProvider.value(value: User('确定', 'oooo'));
                  // Provider.of<change>(context, listen: false).changeUser('点击了');
                },
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: this._searchBox(),
          ),
        ),
      ),
    );
  }

  _seachGoods(value) async {
    var data;
    data = await HttpManager()
        .postForm('SearchProudByName/', data: {'name': value});
    print(data);
    setState(() {
      this.searchList = data.data['data'];
    });
  }

  _searchBox() {
    List<Widget> list = new List();
    for (int i = 0; i < this.searchList.length; i++) {
      list.add(SizedBox(height: 40.h));
      list.add(Container(
        width: 1030.w,
        padding: EdgeInsets.all(20.w),
        // height: 200.h,
        // color: Colors.blueGrey,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.w)),
            color: Color.fromRGBO(240, 240, 240, 0.5)),
        child: Row(
          children: [
            Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.w),
                  child: Container(
                    color: Colors.deepOrange,
                    child: Image.network(
                      this.searchList[i]['mainimage'].toString(),
                      width: 200.w,
                      height: 200.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                flex: 1),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(this.searchList[i]['name'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                          Text('库存:' + this.searchList[i]['stock'],
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(width: 30.w),
                              Text('¥100',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(width: 30.w),
                              Text('¥100',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  )),
                            ],
                          ),
                          flex: 5,
                        ),
                        Expanded(child: Icon(Icons.add), flex: 1)
                      ],
                    )
                  ],
                ),
                flex: 4)
          ],
        ),
      ));
    }
    return list;
  }
}
