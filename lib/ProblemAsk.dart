import 'package:flutter/material.dart';

class ProblemAsk extends StatefulWidget {
  const ProblemAsk({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<ProblemAsk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        title: Row(

          children: [
            const Text(
              '意见反馈',
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
                '提交',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        elevation: 0, // 去掉AppBar的底部阴影
        backgroundColor: Colors.white, // 将AppBar的背景设置为透明



      ),


      body: Container(
        color: Colors.white, // 设置整个页面的背景颜色为白色
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200], // 设置灰色背景
                borderRadius: BorderRadius.circular(8.0), // 圆角
              ),
              child: const TextField(
                decoration: InputDecoration.collapsed(
                  hintText: '详细描述问题，平台将尽快处理~',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}