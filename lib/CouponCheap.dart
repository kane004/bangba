import 'package:flutter/material.dart';

class CouponCheap extends StatefulWidget {
  const CouponCheap({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<CouponCheap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        title: const Text(
              '优惠券',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black

              ),
            ),

        elevation: 0, // 去掉AppBar的底部阴影
        backgroundColor: Colors.white, // 将AppBar的背景设置为透明

      ),
      body: const Center(



      ),
    );
  }
}