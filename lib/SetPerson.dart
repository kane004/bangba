import 'package:flutter/material.dart';

class SetPerson extends StatefulWidget {
  const SetPerson({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<SetPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        title:

            const Text(
              '设置',
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
                          '基本资料',
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
                          '安全设置',
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

            const SizedBox(height: 8),
            Container(
              height: 200,
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
                          '个人隐私',
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
                  ),

                  const Spacer(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          '清除缓存',
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
                  ),

                  const Spacer(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          '通知信息',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        Spacer(),
                        Icon(Icons.chevron_right,color: Colors.grey),

                      ],
                    )
                  ),
                ],
              ),
            ),


            const SizedBox(height: 8),
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
                          '关于帮呗',
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
                  ),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          '退出登录',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        Spacer(),
                        Icon(Icons.chevron_right,color: Colors.grey),

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