import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        title:

        const Text(
          '个人资料',
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
              height: 360,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24.0),
              margin: const EdgeInsets.all(10.0),
              child:  Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '头像',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Spacer(),
                          Icon(Icons.chevron_right,color: Colors.grey),

                        ],
                      )
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 1.0,
                    color: Colors.grey[100],
                    //margin: const EdgeInsets.symmetric(horizontal: 1.0), // 左右边距
                  ),
                 SizedBox(height: 16),

                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '昵称',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Spacer(),
                          Icon(Icons.chevron_right, color: Colors.grey),

                        ],
                      )
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 1.0,
                    color: Colors.grey[100],
                    //margin: const EdgeInsets.symmetric(horizontal: 1.0), // 左右边距
                  ),
                  SizedBox(height: 16),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '性别',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Spacer(),
                          Icon(Icons.chevron_right,color: Colors.grey),

                        ],
                      )
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 1.0,
                    color: Colors.grey[100],
                    //margin: const EdgeInsets.symmetric(horizontal: 1.0), // 左右边距
                  ),
                  SizedBox(height: 16),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '年龄',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Spacer(),
                          Icon(Icons.chevron_right,color: Colors.grey),

                        ],
                      )
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 1.0,
                    color: Colors.grey[100],
                    //margin: const EdgeInsets.symmetric(horizontal: 1.0), // 左右边距
                  ),
                  SizedBox(height: 16),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '地区',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Spacer(),
                          Icon(Icons.chevron_right,color: Colors.grey),

                        ],
                      )
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 1.0,
                    color: Colors.grey[100],
                    //margin: const EdgeInsets.symmetric(horizontal: 1.0), // 左右边距
                  ),
                  SizedBox(height: 16),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '简介',
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