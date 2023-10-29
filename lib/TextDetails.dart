import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kanetest/OrderPay.dart';

import 'HomePage.dart';


class TextDetails extends StatelessWidget {
  final List<Map<String, dynamic>> _dataList = [];
  final String description;
  final String price;
  final String imagePath;


    TextDetails({
    required this.description,
    required this.price,
    required this.imagePath,

    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent, // 设置AppBar的背景设置透明
        iconTheme: const IconThemeData(color: Colors.white), // 设置返回按键的颜色为黑色
        elevation: 0, // 去掉AppBar的底部阴影

        // centerTitle: _currentIndex == 0 ? false : false, // 将标题居中显示
      ),
      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(imagePath)), // 使用FileImage来加载本地文件图片
                  fit: BoxFit.cover, // 适应图片大小以覆盖整个容器
                ),
              ),
            ),



            const SizedBox(height: 16),

             Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(

                      //引用文本描述
                     '$description',
                      style: TextStyle(fontSize: 16,height: 1.8),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          //引用价格
                          '￥',
                          style:
                              TextStyle(fontSize: 12, color: Colors.red),
                        ),
                        Text(
                          //引用价格
                          '$price',
                          style:
                              TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end, //文本水平对齐

                      children: [
                        Text(
                          '浏览量',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '200',
                          style: TextStyle(fontSize: 14, color: Colors.grey,height: 1.0),
                        ),
                      ],
                    ),
                  ],
                )
             ),

            const SizedBox(height: 48),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          //引用头像圆图
                          backgroundImage: AssetImage( imagePath),
                          radius: 20,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //引用昵称
                            Text(
                              '',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            //添加地址文本
                             Text(
                               '',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  //color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                            const Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Center(
                                child: Text(
                                  '+关注',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /***
             *    引用首页内容
             *
             * */

            const SizedBox(height: 20),
            //水平居中
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '其他推荐',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30,),



          ],
        ),
      ),

      // 添加底部矩形白色背景及“下单”按钮
      bottomNavigationBar: Container(
        width: 100,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          //圆角
          borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
        ),
        //内边距
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end, // 将两个按钮靠右显示
          children: [
            ElevatedButton(
              onPressed: () {
                // 在此处添加处理聊天按钮点击事件的逻辑
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                onPrimary: Colors.white,
                elevation: 0, // 去掉阴影效果
                //设置圆角按钮
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
              ),
              child: const Padding(
                //矩形长短
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                child: Text(
                  '问问TA',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 8), // 调整按钮之间的间距

            ElevatedButton(
              onPressed: () {
                // 显示弹窗页面
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return OrderPay(
                      imagePath:  '',
                      nickname:  '',
                      price:  '',
                      description:  '',
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                elevation: 0, // 去掉阴影效果
                //设置圆角按钮
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
                child: Text(
                  '下单',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}


