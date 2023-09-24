import 'package:flutter/material.dart';

import 'CouponCheap.dart';
import 'PersonPage.dart';
import 'IdAuthentication.dart';
import 'HomePage.dart';
import 'OrderCanccel.dart';
import 'OrderDone.dart';
import 'OrderIng.dart';
import 'OrderWait.dart';
import 'ProblemAsk.dart';
import 'Report.dart';
import 'SetPerson.dart';
import 'TextDetails.dart';

class MyPage extends StatefulWidget {

  const MyPage(String s, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}


class _WaitingToDoState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // 添加顶部与body之间的间距
            InkWell(
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PersonPage(
                      avatarImagePath: 'images/image4.webp',
                      nickname: '也许这就是哎',
                      id: '41331',
                    )
                    )
                );
              },
              child:  Container(

                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/image4.webp'), // 替换为您的头像图片路径
                      radius: 28,
                    ),
                    SizedBox(width: 16), // 增加头像和文本之间的间距
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '也许这就是哎', // 替换为您的昵称
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'id:', // 添加您的其他文本
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey
                              ),
                            ),
                            SizedBox(width: 6,),
                            Text(
                              '41331',
                              style: TextStyle(fontSize: 14, color: Colors.grey
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildColumnWithText('0', '收藏',
                      alignment: MainAxisAlignment.start),
                  _buildColumnWithText('0', '浏览历史',
                      alignment: MainAxisAlignment.center),
                  _buildColumnWithText('0', '谁看过我',
                      alignment: MainAxisAlignment.end),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 第二个Container，加背景图片

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),// 添加圆角边框
                  ),
                  // 设置文本icon水平和垂直方向的间距
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  margin: const EdgeInsets.all(10.0),//矩形框和墙边距

                  child: Column(
                    children:[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child:   Text('我的订单',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54

                        )
                        ),

                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const OrderWait(imagePath: '', nickname: '', price: '', description: '',
                                  ),
                                  )
                              );
                            },
                           child:  _buildTextWithIcon('待处理', 'images/order1.png'),
                          ),

                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const OrderIng(
                                  ))
                              );
                            },
                            child: _buildTextWithIcon('进行中', 'images/order2.png'),
                          ),

                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const OrderDone(
                                  ))
                              );
                            },
                            child: _buildTextWithIcon('已完成', 'images/order3.png'),
                          ),

                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const OrderCancel(
                                  ))
                              );
                            },
                            child:  _buildTextWithIcon('已取消', 'images/order4.png'),
                          ),

                          _buildTextWithIcon('全部', 'images/order5.png'),
                        ],
                      ),
                    ],
                  ),
                ),


                /**
                 *    其他服务
                 *
                 * **/
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)// 添加圆角边框
                  ),
                  // 设置文本icon水平和垂直方向的间距
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  margin: const EdgeInsets.all(10.0),//矩形框和墙边距
                  child: Column(
                    children:[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child:   Text('其他服务',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54

                        )
                        ),

                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          _buildIconWithIcon('我发布的', 'images/me1.png',32),
                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const IdAuthentication(
                                  ))
                              );
                            },
                            child: _buildIconWithIcon('认证中心', 'images/me2.png',32),
                          ),
                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProblemAsk(
                                  ))
                              );
                            },
                            child:  _buildIconWithIcon('意见反馈', 'images/me3.png',32),
                          ),
                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SetPerson(
                                  ))
                              );
                            },
                            child:  _buildIconWithIcon('个人设置', 'images/me4.png',32),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Report(
                                  ))
                              );
                            },
                            child: _buildIconWithIcon('举报中心', 'images/me5.png',32),
                          ),
                          _buildIconWithIcon('我的排名', 'images/me6.png',32),
                          InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CouponCheap(
                                  ))
                              );
                            },
                            child:  _buildIconWithIcon('优惠券', 'images/me7.png',32),
                          ),

                          _buildIconWithIcon('支付密码', 'images/me4.png',32),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),

            /***
             *    引用首页内容
             *
             * */

            const SizedBox(height: 20,),
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


            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
            ),
            const SizedBox(height: 4.0), //主图与顶部之间间距



          ],
        ),
      ),
    );
  }
}


/**
 *    收藏浏览历史谁看过我
 *
 * **/
Widget _buildColumnWithText(String text1, String text2, {MainAxisAlignment alignment = MainAxisAlignment.center}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: alignment,
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 16 ),
        ),
        const SizedBox(height: 8),
        Text(
          text2,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}
/**
 *    订单中心
 *
 * **/
Widget _buildTextWithIcon(String text, String imagePath) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        width: 48, // 设置图片宽度
        height: 24, // 设置图片高度
      ),
      const SizedBox(height: 4),
      Text(text, style: const TextStyle(
          fontSize: 12,
          color: Colors.black87
      )
      ),
    ],
  );
}

/**
 *    其他服务
 *
 * **/

Widget _buildIconWithIcon(String text, String imagePath,double imageSize) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
      ),
      const SizedBox(height: 4),
      Text(text, style: const TextStyle(fontSize: 12,color: Colors.black54)),
    ],
  );
}



