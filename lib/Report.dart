import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        title: Row(

          children: [
            const Text(
              '举报中心',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
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
        backgroundColor: Colors.grey[100], // 将AppBar的背景设置为透明
      ),
      //SingleChildScrollView


      body: SingleChildScrollView(
            child:  Container(
                padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '举报类型:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0)
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            child: const Center(
                              child:  Text('违法违规',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                        ),
                        const Spacer(),
                        Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0)
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            child: const Center(
                              child:  Text('色情低俗',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),

                    const Text(
                      '问题描述:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      height: 148,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),

                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      child: const TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: '输入具体问题~',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            )
                        ),

                      ),
                    )


                  ],
                ),
              ),
      )
    );
  }
}