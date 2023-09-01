import 'package:flutter/material.dart';
import 'package:kanetest/Distribute.dart';

class DistributeDetail extends StatefulWidget {
  final ImageItem item;

  const DistributeDetail({Key? key,
    required this.item



  }) : super(key: key);




  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<DistributeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],// 设置AppBar的背景设置白色
        iconTheme:  IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        elevation: 0,// 去掉AppBar的底部阴影

        // centerTitle: _currentIndex == 0 ? false : false, // 将标题居中显示
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    //引用头像圆图
                    backgroundImage: AssetImage(widget.item.imagePath),
                    radius: 24,
                  ),

                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //引用昵称
                      Text(
                        widget.item.nickname,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 4),
                      //添加地址文本
                      const Text('青岛',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey
                        ),
                      )
                    ],
                  ),

                  Spacer(),

                  Stack(
                    children: [
                      Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          //color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0
                          )
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      ),

                      const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Center(
                          child:  Text('+关注',style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                            ),
                            ),
                          ),
                      ),
                    ],
                  )


                ],
              ),
            ),


            const SizedBox(height: 20),
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
              Text(
                //引用价格
                widget.item.price,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red
                ),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(

                //引用文本描述
                widget.item.description,
                style: const TextStyle(fontSize: 16,height: 1.6),
              ),
            ),


            const SizedBox(height: 16),


            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,//文本水平对齐

                children:[
                  Text(
                    '浏览量',
                    style: TextStyle(fontSize: 14,color: Colors.grey),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    '200',
                    style: TextStyle(fontSize: 16,color: Colors.grey),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '评论',
                style: TextStyle(fontSize: 16,height: 1.6,fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
             child: Container(
                height: 1.0,
                color: Colors.grey[100],
              ),
            ),

            const SizedBox(height: 20,),


            //开始评论


             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // 将行内元素垂直居上对齐
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.item.imagePath),
                    radius: 18,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.item.nickname,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 6),

                          //作者

                          Stack(
                            children: [
                              Container(
                                height: 12,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                              const Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Center(
                                  child: Text(
                                    '作者',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black87,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Align(
                        alignment: Alignment.topLeft, // 将这一行垂直居上对齐
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '要大学生哈，其他人不要，毕业证验证',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              softWrap: true,
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  '3小时前',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '四川',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  '回复',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),


            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // 将行内元素垂直居上对齐
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/image4.webp'),
                    radius: 18,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '大大方方',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Align(
                        alignment: Alignment.topLeft, // 将这一行垂直居上对齐
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '请问对大学生有什么要求，是个人就可以吗？',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              softWrap: true,
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  '3小时前',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '四川',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  '回复',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),



            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // 将行内元素垂直居上对齐
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/image5.webp'),
                    radius: 18,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '糊了糊了',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Align(
                        alignment: Alignment.topLeft, // 将这一行垂直居上对齐
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '我也可以哈哈哈',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              softWrap: true,
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  '3小时前',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '四川',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  '回复',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Image.asset('images/message4.png')
            ),
            const SizedBox(width: 6,),
            const Text('评论',style: TextStyle(
              fontSize: 18,
              color: Colors.grey
            ),
            ),

            Spacer(),
            ElevatedButton(
              onPressed: () {
                // 显示弹窗页面

              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                elevation: 0, // 去掉阴影效果
                //设置圆角按钮
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                child: Text(
                  '申请',
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