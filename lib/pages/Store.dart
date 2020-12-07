import 'dart:ui';
import 'package:flutter_app/Store/store.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../untils/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Store extends StatefulWidget {
  Store({Key key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  int index = 0;
  int catrid;
  List cateList = [];
  List goodList = [];
  var controller = new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getcareList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(46.w),
              color: Color.fromRGBO(249, 123, 81, 1),
              // height: 120,
              width: double.infinity,
              child: Container(
                  child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Container(
                    width: 900.w,
                    child: Text(
                      '商城',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      height: 70.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '搜索',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      width: 100.w,
                      color: Color.fromRGBO(0, 0, 0, 0.02),
                      height: ScreenUtil().screenHeight - 530.h,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          controller: this.controller,
                          children: this.cateList.asMap().keys.map((e) {
                            return Container(
                              height: 130.h,
                              // color: this.index == listindex ? Colors.grey : Colors.white,
                              child: ListTile(
                                focusColor: Colors.red,
                                selected: this.index == e ? true : false,
                                title: Text(this.cateList[e]['catename'],
                                    textAlign: TextAlign.center),
                                onTap: () {
                                  print(this.cateList[e]['catename']);
                                  // print(this.cateList[e]['cateid']);
                                  this._getGoodsById(
                                      this.cateList[e]['cateid']);
                                  setState(() {
                                    this.index = e;

                                    // this.controller.animateTo(
                                    //       (this.index) * 130.h,
                                    //       duration: new Duration(
                                    //           milliseconds: 300), // 300ms
                                    //       curve: Curves.bounceIn, // 动画方式
                                    //     );
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                  flex: 1,
                ),
                Expanded(
                    child: Container(
                      width: ScreenUtil().screenWidth - 200.w,
                      height: ScreenUtil().screenHeight - 530.h,
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: EasyRefresh(
                              footer: ClassicalFooter(
                                  loadText: '加载loadtest',
                                  loadedText: '没有更多了',
                                  noMoreText: '',
                                  showInfo: false,
                                  loadingText: '正在加载中'),
                              header: ClassicalHeader(
                                  noMoreText: '',
                                  showInfo: false,
                                  refreshText: '上拉加载更多',
                                  refreshReadyText: '上拉加载更多',
                                  refreshingText: '正在刷新',
                                  refreshedText: '刷新完成'),
                              onRefresh: () async {
                                print('onRefresh');
                                this._getcareList();
                                this.index = 0;
                              },
                              onLoad: () async {
                                print('onLoad');
                              },
                              child: ListView(
                                children: this.goodList.asMap().keys.map((e) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Color(0xffe5e5e5)))),
                                    padding: EdgeInsets.only(
                                        bottom: 30.h, top: 30.h),
                                    // color: Colors.blue,
                                    width: ScreenUtil().screenWidth - 320.w,
                                    child: ListTile(
                                      leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                          child: Image.network(
                                              this.goodList[e]['mainimage'],
                                              width: 200.w,
                                              height: 480.h,
                                              fit: BoxFit.cover)),
                                      title: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              this.goodList[e]['name'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: 5.h),
                                            Text(
                                                '库存:' +
                                                    this
                                                        .goodList[e]['stock']
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(height: 5.h),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 400.w,
                                                  child: Text(
                                                      '¥' +
                                                          this
                                                              .goodList[e]
                                                                  ['price']
                                                              .toString(),
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 15)),
                                                ),
                                                GestureDetector(
                                                  child: Icon(Icons.add_circle,
                                                      size: 20,
                                                      color: Color.fromRGBO(
                                                          249, 123, 81, 1)),
                                                  onTap: () {
                                                    this._addCart(this
                                                        .goodList[e]['proid']);
                                                  },
                                                ),
                                                // Icon(Icons.add_circle,
                                                //     size: 20,
                                                //     color: Color.fromRGBO(
                                                //         249, 123, 81, 1)),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                              ],
                                            ),
                                            // SizedBox(height: 20.h)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ))),
                    ),
                    flex: 3),
              ],
            )
          ],
        ),
      ),
    );
  }

  _getcareList() async {
    var data;
    data = await HttpManager().postForm('SearchCategoryName/', data: {});

    var id = data.data['data'][0]['cateid'];
    setState(() {
      this.cateList = data.data['data'];
      this.catrid = id;
    });
    this._getGoodsById(id);
  }

  _getGoodsById(id) async {
    print(id);
    var data;
    data = await HttpManager().postForm('productList/', data: {'cateid': id});
    print(data);
    setState(() {
      this.goodList = data.data['data'];
    });
  }

  //  获取购物车刷新
  _getCarInfo() async {
    var data;
    data = await HttpManager().postForm('searchCart/', data: {'WXuserid': 1});
    print(data);
    Provider.of<Changecartlist>(context, listen: false).changecartlist(
        data.data['data'], double.parse(data.data['countprice']));
  }

  //加入购物车
  _addCart(index) async {
    var data;
    data = await HttpManager().postForm('addtoCart/',
        data: {'WXuserid': 1, "proid": index, "quantity": 1});
    this._getCarInfo();
    Fluttertoast.showToast(
        msg: '加入购物车成功！',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
