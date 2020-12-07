import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../untils/request.dart';
import 'GoodsDetail.dart';
import 'search.dart';

class Myindex extends StatefulWidget {
  Myindex({Key key}) : super(key: key);

  @override
  _MyindexState createState() => _MyindexState();
}

class _MyindexState extends State<Myindex> {
  List mylist = [];
  List limitlist = [];
  List salelist = [];

  @override
  int chegeid = 1;
  @override
  void initState() {
    print('init');
    super.initState();
    this._getRecommomt();
    this._getLimitTimeList();
    this._getSaleLits();
  }

  var controller = new ScrollController();
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        width: 900.w,
                        child: Text(
                          '福建省厦门市思明区软件园',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => search()),
                      );
                    },
                    child: ClipRRect(
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
                  )
                ],
              ))),
          Container(
            color: Colors.white,
            // height: 180.h,
            padding: EdgeInsets.all(46.w),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        this.chegeid = 1;
                        this.controller.animateTo(
                              0,
                              duration:
                                  new Duration(milliseconds: 300), // 300ms
                              curve: Curves.bounceIn, // 动画方式
                            );
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          '精选',
                          style: this.chegeid == 1
                              ? TextStyle(
                                  color: Color.fromRGBO(249, 123, 81, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)
                              : TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                        ),
                        ClipRRect(
                          child: Container(
                            width: 180.w,
                            color: this.chegeid == 1
                                ? Color.fromRGBO(249, 123, 81, 1)
                                : Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              '好货专区',
                              style: this.chegeid == 1
                                  ? TextStyle(color: Colors.white, fontSize: 12)
                                  : TextStyle(
                                      color: Colors.black, fontSize: 12),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(30.w),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        this.chegeid = 2;
                        this.controller.animateTo(
                              500.0.h,
                              duration:
                                  new Duration(milliseconds: 300), // 300ms
                              curve: Curves.bounceIn, // 动画方式
                            );
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          '限时抢购',
                          style: this.chegeid == 2
                              ? TextStyle(
                                  color: Color.fromRGBO(249, 123, 81, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)
                              : TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                        ),
                        ClipRRect(
                          child: Container(
                            width: 180.w,
                            color: this.chegeid == 2
                                ? Color.fromRGBO(249, 123, 81, 1)
                                : Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              '超值限量',
                              style: this.chegeid == 2
                                  ? TextStyle(color: Colors.white, fontSize: 12)
                                  : TextStyle(
                                      color: Colors.black, fontSize: 12),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(30.w),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        this.chegeid = 3;
                        this.controller.animateTo(
                              1130.h,
                              duration:
                                  new Duration(milliseconds: 300), // 300ms
                              curve: Curves.bounceIn, // 动画方式
                            );
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          '疯狂折扣',
                          style: this.chegeid == 3
                              ? TextStyle(
                                  color: Color.fromRGBO(249, 123, 81, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)
                              : TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                        ),
                        ClipRRect(
                          child: Container(
                            width: 180.w,
                            color: this.chegeid == 3
                                ? Color.fromRGBO(249, 123, 81, 1)
                                : Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              '天天特价',
                              style: this.chegeid == 3
                                  ? TextStyle(color: Colors.white, fontSize: 12)
                                  : TextStyle(
                                      color: Colors.black, fontSize: 12),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(30.w),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 1030.w,
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
                    this._getRecommomt();
                    this._getLimitTimeList();
                    this._getSaleLits();
                  },
                  onLoad: () async {
                    print('onLoad');
                  },
                  child: ListView(
                    controller: this.controller,
                    children: [
                      Container(
                        color: Color.fromRGBO(249, 123, 81, 1),
                        // width: 60,
                        padding: EdgeInsets.all(10),
                        height: 500.h,
                        child: new Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Row(
                              children: this.mylist.map<Widget>((e) {
                                return Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      GoodsDetail(
                                                    data: e['proid'].toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(20.w),
                                                      width: double.infinity,
                                                      height: 300.h,
                                                      child: FadeInImage
                                                          .assetNetwork(
                                                        placeholder:
                                                            'images/loading.png',
                                                        image: e['mainimage'],
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                Text(
                                                  e['name'],
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                GestureDetector(
                                                  onTap: () => {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            GoodsDetail(
                                                          data: e['proid']
                                                              .toString(),
                                                        ),
                                                      ),
                                                    )
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(3),
                                                      child: Text(
                                                        '¥' +
                                                            e['price']
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          232, 70, 58, 1),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                    flex: 1);
                              }).toList(),
                            );
                          },
                          itemCount: 1,
                          pagination: new SwiperPagination(),
                          control: new SwiperControl(
                            size: 0,
                          ),
                        ),
                      ),
                      //店长推荐轮播商品结束
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        width: 200.w,
                        height: 600.h,
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timelapse),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text('限时抢购'),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20.w),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              right: 10.w, left: 10.w),
                                          color:
                                              Color.fromRGBO(249, 123, 81, 1),
                                          child: Text(
                                            '距离开始',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      SizedBox(
                                        width: 14.w,
                                      ),
                                      Text(
                                        '00:00:00',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                249, 123, 81, 1)),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: new Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(
                                          249,
                                          123,
                                          81,
                                          1,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        '更多',
                                        style: TextStyle(color: Colors.grey),
                                        textAlign: TextAlign.right,
                                      )),
                                  flex: 1,
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Expanded(
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: this.limitlist.map<Widget>((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => GoodsDetail(
                                              data: e['proid'].toString(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 200.h,
                                        width: 282.h,
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Container(
                                                  padding: EdgeInsets.all(20.w),
                                                  width: double.infinity,
                                                  height: 350.h,
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                    placeholder:
                                                        'images/loading.png',
                                                    image: e['mainimage'],
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                            Text(
                                              e['name'],
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            GestureDetector(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Text(
                                                    '¥' + e['price'].toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      232, 70, 58, 1),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList()),
                              flex: 1,
                            )
                          ],
                        ),
                      ),

                      //限时抢购头部
                      SizedBox(
                        height: 30.w,
                      ),
                      Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.ac_unit_sharp),
                                  SizedBox(width: 20.w),
                                  Container(
                                      child: Text(
                                        '疯狂折扣',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      alignment: Alignment.topLeft),
                                ],
                              ),
                              SizedBox(height: 20.w),
                              Column(
                                children: this.salelist.map<Widget>((e) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GoodsDetail(
                                            data: e['proid'].toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xffe5e5e5)))),
                                      padding: EdgeInsets.only(bottom: 20.w),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.w),
                                              child: Container(
                                                width: 200.w,
                                                height: 200.h,
                                                padding: EdgeInsets.only(
                                                    bottom: 10.h),
                                                child: FadeInImage.assetNetwork(
                                                  placeholder:
                                                      'images/loading.png',
                                                  image: e['mainimage'],
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                          SizedBox(width: 30.w),
                                          Expanded(
                                              child: Container(
                                            alignment: Alignment.topLeft,
                                            width: double.infinity,
                                            height: 200.h,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(e['name'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                SizedBox(height: 20.w),
                                                Text(
                                                    '库存：' +
                                                        e['stock'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                                SizedBox(height: 40.w),
                                                Row(children: [
                                                  Text(
                                                      '¥' +
                                                          e['price'].toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  SizedBox(width: 20.w),
                                                  Text(
                                                    '¥' + e['price'].toString(),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                  SizedBox(width: 300.w),
                                                  GestureDetector(
                                                    onTap: () {
                                                      print('加入购物车');
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Color.fromRGBO(
                                                          232, 70, 58, 1),
                                                    ),
                                                  )
                                                ])
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                      width: double.infinity,
                                      height: 300.w,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

//  店长推荐商品获取
  _getRecommomt() async {
    var data;
    data = await HttpManager()
        .postForm('SearchStatutList/', data: {'status': '2'});
    setState(() {
      this.mylist = data.data['data'];
    });
  }

// 限时抢购商品
  _getLimitTimeList() async {
    var data1;
    data1 = await HttpManager()
        .postForm('SearchStatutList/', data: {'status': '3'});
    setState(() {
      this.limitlist = data1.data['data'];
    });
  }

  //折扣商品
  _getSaleLits() async {
    var data;
    data = await HttpManager()
        .postForm('SearchStatutList/', data: {'status': '1'});
    setState(() {
      this.salelist = data.data['data'];
    });
  }
}
