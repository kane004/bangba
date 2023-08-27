import 'package:flutter/material.dart';

class SystemMessageDetail extends StatefulWidget {
  const SystemMessageDetail({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<SystemMessageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        title: Row(

          children: [
            const Text(
              '添加技能',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black

              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // 在这里添加发布按钮的点击事件
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green, // 设置背景颜色为绿色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0), // 设置圆角
                ),
              ),
              child: const Text(
                '发布',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),


        elevation: 0, // 去掉AppBar的底部阴影
        backgroundColor: Colors.grey[200], // 将AppBar的背景设置为透明

      ),
      body: const Center(



      ),
    );
  }
}