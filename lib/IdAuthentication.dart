import 'package:flutter/material.dart';

class IdAuthentication extends StatefulWidget {
  const IdAuthentication({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<IdAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        title:
            const Text(
              '认证中心',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black

              ),
            ),

        elevation: 0, // 去掉AppBar的底部阴影
        backgroundColor: Colors.grey[100], // 将AppBar的背景设置为透明

      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Container(
              height: 128,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24.0),
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '手机号',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Spacer(),
                          Icon(Icons.chevron_right,color: Colors.grey),

                        ],
                      )
                  ),
                  const Spacer(),
                  Container(
                    height: 1.0,
                    color: Colors.grey[100],
                    //margin: const EdgeInsets.symmetric(horizontal: 1.0), // 左右边距
                  ),
                  const Spacer(),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '身份证',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Spacer(),
                          Icon(Icons.chevron_right, color: Colors.grey),

                        ],
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}