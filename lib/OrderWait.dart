import 'package:flutter/material.dart';
import 'package:kanetest/OrderDetail.dart';

class OrderWait extends StatefulWidget {
  const OrderWait({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<OrderWait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],// 设置AppBar的背景设置白色
        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        elevation: 0,// 去掉AppBar的底部阴影

        title: const Row(

          children: [
            Text(
              '待处理',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black

              ),
            ),
            Spacer(),

          ],
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Text(
                  '下单',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              '2023-09-02',
              style: TextStyle(fontSize: 14, color: Colors.black38),
            ),
            const SizedBox(height: 4),

            InkWell(
              onTap:(){
                Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const OrderDetail(

                    )
                    )
                );
              } ,

         child:   Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Column(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Text(
                            '室内设计装修根据你的要求或者全包设计预算2-10万室内设计装修根据你的要求或者全包设计预算2-10万',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                            maxLines: 2,
                          )),
                      Spacer(),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/image2.webp'),
                                radius: 16,
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Text(
                                '嘟嘟02',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              )),
                          Spacer(),
                          Text(
                            '已支付',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Text(
                                '100',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                )
            )
            ),

          ],
        ),
      ),
    );
  }
}


