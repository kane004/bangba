import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

class _WaitingToDoState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // 设置AppBar的背景设置白色
        elevation: 0, // 去掉AppBar的底部阴影
        // centerTitle: _currentIndex == 0 ? false : false, // 将标题居中显示
        title: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          // 设置搜索框的宽度为屏幕宽度的70%
          height: 40,
          //搜索框高度
          alignment: Alignment.bottomRight,
          // 将搜索框居中
          decoration: BoxDecoration(
            color: Colors.grey[200], // 搜索框背景颜色为灰色
            borderRadius: BorderRadius.circular(256.0), // 圆角边框
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
          // 搜索框内部水平边距
          child: const TextField(
            decoration: InputDecoration(

              icon: Icon(Icons.search), // 搜索框前面的搜索图标
              hintText: '搜索用户|消息',
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black38
              ),// 搜索框提示文本
              border: InputBorder.none, // 去掉搜索框的边框
            ),
          ),
        ),
      ),
      //滚动部件SingleChildScrollView
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(

                children: [
                  // 圆形头像图片
                  Image(
                    image: AssetImage('images/message2.png'),
                    width: 50,
                    height: 50,

                  ),
                  SizedBox(width: 20),

                  // 垂直的文本
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '系统消息',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '收到来自小小的投诉啦来看看~',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            //订单消息
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('images/message1.png'),
                    width: 50,
                    height: 50,

                  ),
                  SizedBox(width: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '订单消息',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('您有新的订单请查看~',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,

                        ),
                      )
                    ],
                  )

                ],
              ),
            ),

            //其他消息
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Row(
                children:  [
                  Image(
                    image: AssetImage('images/message3.png'),
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('小助手',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        '有什么问题都可以问我哦~',
                        style: TextStyle(
                          fontSize: 14 ,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),

          ],
        ),
      ),



    );
  }
}