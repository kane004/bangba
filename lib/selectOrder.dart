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

        ),


        elevation: 0, // 去掉AppBar的底部阴影
        backgroundColor: Colors.grey[200], // 将AppBar的背景设置为透明

      ),
      body: const Center(



      ),
    );
  }
}