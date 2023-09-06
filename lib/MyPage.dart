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

//创建一个包含ImageItem对象的列表，用于存储每张图片的信息
final List<ImageItem> _imageItems = [
  ImageItem(
      imagePath: 'images/image1.webp',
      description: '同城地接导游带你打卡城市各个角落景点帮忙领东西',
      nickname: '小鑫不信',
      price: '250.0',
      area: '深圳',
      Ram: '￥'
  ),
  ImageItem(
      imagePath: 'images/image2.webp',
      description: '室内设计装修根据你的要求或者全包设计预算2-10万,提供设计图纸，专业上门制作',
      nickname: '小朱不朱',
      price: '130.0',
      area: '上海',
      Ram: '￥'
  ),
  ImageItem(
      imagePath: 'images/image3.webp',
      description: '大学生兼职可以帮忙取快递帮忙表白帮介绍对象根大学生兼职可以帮忙取快递帮忙表白帮介绍对象根',
      nickname: '小艾不爱',
      price: '50.0',
      area: '重庆',
      Ram: '￥'
  ),
  ImageItem(
      imagePath: 'images/image4.webp',
      description:  '摄影跟拍户外亲自婚纱都可以不同风格都能驾，随时跟拍内容，保证服务质量',
      nickname: '小肖不笑',
      price: '88.0',
      area: '成都',
      Ram: '￥'
  ),
  ImageItem(
      imagePath: 'images/image5.webp',
      description:  '三亚游艇出海游艇出行跟进拍摄2000左右，根据你的喜好进行拍照片和服务',
      nickname: '小夏不下',
      price: '500.0',
      area: '长沙',
      Ram: '￥'
  ),
  ImageItem(
      imagePath: 'images/image6.webp',
      description: '兼职伴娘300一天可以帮忙配合表演，不抢新娘风头，绝对配合表演，会唱歌舞蹈等',
      nickname: '小顾布谷',
      price: '450.0',
      area: '北京',
      Ram: '￥'
  ),

];

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
                                  ))
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

            //主图页
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //两个网格
                crossAxisSpacing: 6.0, //横轴间距
                mainAxisSpacing: 7.0, //纵轴间距
                childAspectRatio: 0.6, //宽高比例
              ),
              itemCount: _imageItems.length,
              // 图片项的数量
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // 禁用GridView的滚动
              itemBuilder: (context, index) {
                final ImageItem item =
                _imageItems[index]; // 获取当前索引处的ImageItem对象

                //点击跳转新页面
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TextDetails(item: item),
                      ),
                    );
                  },

                  //body图片文本
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white, // 设置整块的背景颜色为白色

                      //borderRadius: BorderRadius.circular(8.0), // 设置圆角半径

                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0), // 设置左下角为圆角
                        bottomRight: Radius.circular(8.0), // 设置右下角为圆角
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //主图片

                        Expanded(
                          child: ClipRRect(
                            //borderRadius: BorderRadius.circular(8.0), // 设置圆角半径
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(0), // 设置左上角为直角
                              topRight: Radius.circular(0), // 设置右上角为直角
                            ),

                            child: FractionallySizedBox(
                              widthFactor: 1.0,
                              heightFactor: 1,
                              child: Image.asset(
                                item.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        //主文本内容
                        Padding(padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 4),
                          child: Text(
                            item.description,
                            style: const TextStyle(
                                fontSize: 14.0,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                            maxLines: 2, // 控制最大行数
                            overflow: TextOverflow.ellipsis, // 超过时显示省略号
                          ),
                        ),
                        const SizedBox(height: 12.0),

                        //头像和昵称
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //头像
                            CircleAvatar(
                              backgroundImage: AssetImage(item.imagePath),
                              radius: 13, // 设置圆形头像的半径
                            ),
                            const SizedBox(width: 8.0),
                            //昵称
                            Text(
                              item.nickname,
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  height: 1.2,
                                  color: Colors.black45),
                            ),

                            const Spacer(),
                            Text(
                              item.price,
                              style: const TextStyle(
                                fontSize: 15.0,
                                height: 1.4,
                                color: Colors.red,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );


              },
            ),

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



