import 'package:flutter/material.dart';
import 'package:flutter_app/Store/store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../untils/request.dart';
import 'package:common_utils/common_utils.dart'; //数值精准度修改

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List cartList = [];
  double countprice;
  @override
  void initState() {
    // TODO: implement initState
    this._getCarInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('购物车'),
            backgroundColor: Color.fromRGBO(249, 123, 81, 1)),
        body: Container(
          height: ScreenUtil().screenHeight,
          child: Stack(
            children: [
              Container(
                  height: ScreenUtil().screenHeight - 130.h,
                  padding: EdgeInsets.all(20.w),
                  child: ListView(
                    children: this.getShopCarList(),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              top: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      width: ScreenUtil().screenWidth,
                      height: 130.h,
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.panorama_fisheye, size: 18),
                                  SizedBox(width: 8.w),
                                  Text('全选')
                                ],
                              ),
                              flex: 1),
                          Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    // color: Colors.blueAccent,
                                    alignment: Alignment.center,
                                    height: 100.h,
                                    width: 700.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '合计:',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          // width: 400.w,
                                          child: Text(
                                            Provider.of<Changecartlist>(context)
                                                .countprice
                                                .toString(),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    249, 123, 81, 1),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        Container(
                                          padding: EdgeInsets.all(10.w),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  249, 123, 81, 1),
                                              borderRadius:
                                                  BorderRadius.circular(10.w)),
                                          child: Text('立即支付',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600)),
                                          // color: Colors.deepOrange,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              flex: 3)
                        ],
                      )))
            ],
          ),
        ));
  }

  getShopCarList() {
    List<Widget> list = new List();
    print(Provider.of<Changecartlist>(context).cartlist.length);
    for (var i = 0;
        i < Provider.of<Changecartlist>(context).cartlist.length;
        i++) {
      list.add(
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          // height: 500.h,
          padding: EdgeInsets.all(30.w),
          color: Colors.white,
          child: Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  child: Icon(Icons.panorama_fisheye, size: 18)),
              Container(
                width: 300.w,
                // color: Colors.white,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        Provider.of<Changecartlist>(context)
                            .cartlist[i]['mainimage']
                            .toString(),
                        width: 200.w,
                        height: 200.h,
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 30.w,
              ),
              Container(
                width: 550.w,
                // color: Colors.blue,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Provider.of<Changecartlist>(context)
                          .cartlist[i]['name']
                          .toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                        '销量:' +
                            Provider.of<Changecartlist>(context)
                                .cartlist[i]['stock']
                                .toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        '¥' +
                            Provider.of<Changecartlist>(context)
                                .cartlist[i]['price']
                                .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        )),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 260.w,
                                color: Colors.white,
                                child: Text(
                                  '¥' +
                                      Provider.of<Changecartlist>(context)
                                          .cartlist[i]['price']
                                          .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Icon(Icons.remove_circle,
                                      size: 20,
                                      color: Color.fromRGBO(249, 123, 81, 1)),
                                  onTap: () {
                                    this._reduceCart(i);
                                  },
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  Provider.of<Changecartlist>(context)
                                      .cartlist[i]['quantity']
                                      .toString(),
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                GestureDetector(
                                  child: Icon(Icons.add_circle,
                                      size: 20,
                                      color: Color.fromRGBO(249, 123, 81, 1)),
                                  onTap: () {
                                    this._addCart(i);
                                  },
                                )
                              ],
                            ),
                            flex: 1)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      list.add(SizedBox(
        height: 30.h,
      ));
    }
    list.add(SizedBox(height: 100.h));
    return list;
  }

  //获取购物车信息
  _getCarInfo() async {
    var data;
    data = await HttpManager().postForm('searchCart/', data: {'WXuserid': 1});
    print(data);
    setState(() {
      this.cartList = data.data['data'];
      this.countprice = double.parse(data.data['countprice']);
    });
    Provider.of<Changecartlist>(context, listen: false)
        .changecartlist(this.cartList, this.countprice);
  }

  //加入购物车
  _addCart(index) async {
    var data;
    data = await HttpManager().postForm('addtoCart/', data: {
      'WXuserid': 1,
      "proid": this.cartList[index]['proid_id'],
      "quantity": 1
    });
    setState(() {
      this.cartList[index]['quantity'] = this.cartList[index]['quantity'] + 1;
      this.countprice =
          NumUtil.add(this.countprice, this.cartList[index]['price']);
    });
    Provider.of<Changecartlist>(context, listen: false)
        .changecartlist(this.cartList, this.countprice);
    print(data);
  }

  //减少购物车
  _reduceCart(index) async {
    var data;
    data = await HttpManager().postForm('reduce/', data: {
      'WXuserid': 1,
      "proid": this.cartList[index]['proid_id'],
      "quantity": 1
    });
    setState(() {
      if (this.cartList[index]['quantity'] == 1) {
        print('删除购物车');
        this._delShopcartGood(index);
      } else {
        this.cartList[index]['quantity'] = this.cartList[index]['quantity'] - 1;
        this.countprice =
            NumUtil.subtract(this.countprice, this.cartList[index]['price']);
      }
    });
    Provider.of<Changecartlist>(context, listen: false)
        .changecartlist(this.cartList, this.countprice);
    print(data);
  }

  //删除购物车
  _delShopcartGood(index) async {
    var data;
    data = await HttpManager().postForm('delShopcartGood/', data: {
      'WXuserid': 1,
      "proid": this.cartList[index]['proid_id'],
    });
    // this.cartList.removeAt(index);R
    setState(() {
      this._getCarInfo();
    });

    // Provider.of<Changecartlist>(context, listen: false).changecartlist(this.cartList);

    print(data);
  }
}
