import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Userinfo extends StatefulWidget {
  Userinfo({Key key}) : super(key: key);

  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 100.h),
            height: 450.h,
            color: Color.fromRGBO(249, 123, 81, 1),
            child: Column(
              children: [
                Text(
                  '我的',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 70.w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 180.w,
                        height: 150.h,
                        child: Image.network(
                            'https://tfs.alipayobjects.com/images/partner/TB1LX8pXlaEMeJjme5tXXcEKFXa',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 100.w),
                    Text(
                      '存钱罐',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 1000.w,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Text('超级会员下单享受专属折扣',
                        style: TextStyle(color: Colors.red, fontSize: 12)),
                    padding: EdgeInsets.only(left: 10, top: 3, bottom: 3),
                    width: double.infinity,
                    color: Color.fromRGBO(251, 237, 191, 1),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.1)))),
                              child: Column(
                                children: [
                                  Text(
                                    '326',
                                    style: TextStyle(
                                        color: Color.fromRGBO(249, 123, 81, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    '余额',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            flex: 1),
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.1)))),
                              child: Column(
                                children: [
                                  Text(
                                    '8',
                                    style: TextStyle(
                                        color: Color.fromRGBO(249, 123, 81, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    '优惠券',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            flex: 1),
                        Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    '210',
                                    style: TextStyle(
                                        color: Color.fromRGBO(249, 123, 81, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    '积分',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            flex: 1)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 1000.w,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(Icons.payment),
                                    SizedBox(width: 10.w),
                                    Text(
                                      '支付',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              flex: 1),
                          Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                ],
                                mainAxisAlignment: MainAxisAlignment.end,
                              ),
                              flex: 1)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(width: 10.w),
                                    Text(
                                      '绑定手机号',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              flex: 1),
                          Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                ],
                                mainAxisAlignment: MainAxisAlignment.end,
                              ),
                              flex: 1)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(Icons.assessment),
                                    SizedBox(width: 10.w),
                                    Text(
                                      '我的订单',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              flex: 1),
                          Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                ],
                                mainAxisAlignment: MainAxisAlignment.end,
                              ),
                              flex: 1)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(Icons.shopping_bag),
                                    SizedBox(width: 10.w),
                                    Text(
                                      '积分商城',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              flex: 1),
                          Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                ],
                                mainAxisAlignment: MainAxisAlignment.end,
                              ),
                              flex: 1)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(Icons.person_pin),
                                    SizedBox(width: 10.w),
                                    Text(
                                      '收货地址',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              flex: 1),
                          Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                ],
                                mainAxisAlignment: MainAxisAlignment.end,
                              ),
                              flex: 1)
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
