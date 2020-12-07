import 'package:flutter/material.dart';
import 'package:flutter_app/Store/store.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../untils/request.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GoodsDetail extends StatefulWidget {
  String data;
  GoodsDetail({this.data = ""});
  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  String data;
  String name = '暂无';
  List goodsDetail;
  List list;
  List mainimg;
  List<Widget> imglist;
  List<Widget> detailimg;

  // List<Widget> mainimg;
  @override
  void initState() {
    // TODO: implement initState
    this.data = widget.data;
    this._getDetail(data);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('商品详情'),
          backgroundColor: Color.fromRGBO(249, 123, 81, 1)),
      body: this.goodsDetail == null
          ? Text('数据加载中.....')
          : Container(
              width: double.infinity,
              height: ScreenUtil().screenHeight,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().screenHeight - 380.h,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: new Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return FadeInImage.assetNetwork(
                                  placeholder: 'images/loading.png',
                                  image: this.mainimg[index],
                                  fit: BoxFit.cover,
                                );
                              },
                              pagination: new SwiperPagination(),
                              // control: new SwiperControl(),
                              itemCount: this.mainimg.length,
                            ),
                            height: 600.h,
                            width: 1330.w,
                          ),
                          // SizedBox(height: 40.h),
                          Container(
                            width: 1000.w,
                            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                            child: Text(
                              this.name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 1000.w,
                              color: Color.fromRGBO(249, 123, 81, 1),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(30.w),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '¥' +
                                                    this
                                                        .goodsDetail[0]['price']
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 28),
                                              ),
                                              SizedBox(height: 20.h),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30.w),
                                                child: Container(
                                                  width: 500.w,
                                                  color: Colors.white,
                                                  padding: EdgeInsets.all(10.w),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.ac_unit,
                                                        size: 15,
                                                      ),
                                                      Flexible(
                                                          flex: 1,
                                                          child: Text(
                                                            '累计销量：9999999',
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                      flex: 3),
                                  Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('店长推荐',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      253, 241, 114, 1),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25)),
                                          SizedBox(height: 20.h),
                                          Text(
                                            '好物推荐，不容错过',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      flex: 2)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Column(children: this.imglist),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1000.w,
                    height: 130.h,
                    child: MaterialButton(
                      color: Color.fromRGBO(249, 123, 81, 1),
                      textColor: Colors.white,
                      child: new Text(
                        '立即购买',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        // ...
                        this._addCart();
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }

  _getDetail(id) async {
    var data;

    data =
        await HttpManager().postForm('SearchProudById/', data: {'proid': id});

    setState(() {
      this.goodsDetail = data.data['data'];
      this.name = data.data['data'][0]['name'];
      this.list = data.data['data'][0]['detail'].split(',');
      this.mainimg = data.data['data'][0]['mainimage'].split(',');
    });
    this._getdetailimg();
    this._getDetaiIMg();
    print(this.goodsDetail);
  }

//获取详情图
  _getDetaiIMg() {
    List<Widget> list = new List();
    for (int j = 0; j < this.list.length; j++) {
      list.add(
        Container(
          width: 1000.w,
          height: 600.h,
          child: Image.network(this.list[j], fit: BoxFit.cover),
        ),
      );
      list.add(SizedBox(height: 20.h));
    }
    list.add(SizedBox(height: 40.h));
    this.imglist = list;
  }

  //获取商品主图
  _getdetailimg() {
    List list = new List();
    for (int j = 0; j < this.mainimg.length; j++) {
      print(this.mainimg[j]);
      list.add(
        Image.network(
          this.mainimg[j],
          fit: BoxFit.cover,
        ),
      );
    }
    return list;
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
  _addCart() async {
    var data;
    data = await HttpManager().postForm('addtoCart/',
        data: {'WXuserid': 1, "proid": this.data, "quantity": 1});

    print(data);
    Fluttertoast.showToast(
        msg: '加入购物车成功！',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    this._getCarInfo();
  }
}
