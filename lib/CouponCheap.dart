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
      appBar: AppBar(
        title: null, // 设置标题为null，这样就不会显示标题
        backgroundColor: Colors.transparent, // 设置背景颜色为透明色
        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        elevation: 0, // 去掉阴影效果
      ),
      body: const Center(

      ),
    );
  }
}