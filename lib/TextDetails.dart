import 'package:flutter/material.dart';
import 'package:kanetest/HomePageDetails.dart';
import 'package:kanetest/timePay.dart';

import 'MyHomePage.dart';


class TextDetails extends StatelessWidget{

  final ImageItem item;

   TextDetails({Key? key, required this.item}) : super(key: key);

  //创建一个包含ImageItem对象的列表，用于存储每张图片的信息
  final List<ImageItem> _imageItems = [
    ImageItem(
      imagePath: 'images/image1.webp',
      description: '同城地接导游带你打卡城市各个角落景点帮忙领东西',
      nickname: '小鑫不信',
      price: '￥250',
    ),
    ImageItem(
      imagePath: 'images/image2.webp',
      description: '室内设计装修根据你的要求或者全包设计预算2-10万',
      nickname: '小朱不朱',
      price: '￥130',
    ),
    ImageItem(
      imagePath: 'images/image3.webp',
      description: '大学生兼职可以帮忙取快递帮忙表白帮介绍对象根',
      nickname: '小艾不爱',
      price: '￥50.0',
    ),
    ImageItem(
      imagePath: 'images/image4.webp',
      description:  '摄影跟拍户外亲自婚纱都可以不同风格都能驾',
      nickname: '小肖不笑',
      price: '￥88',
    ),
    ImageItem(
      imagePath: 'images/image5.webp',
      description:  '三亚游艇出海游艇出行跟进拍摄2000左右',
      nickname: '小夏不下',
      price: '￥500',
    ),
    ImageItem(
      imagePath: 'images/image6.webp',
      description: '兼职伴娘300一天可以帮忙配合表演',
      nickname: '小顾布谷',
      price: '￥450',
    ),

  ];


  @override
  Widget build(BuildContext context){

      return Scaffold(

          appBar: AppBar(
          backgroundColor: Colors.grey[100],// 设置AppBar的背景设置白色
          iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
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
                      backgroundImage: AssetImage(item.imagePath),
                      radius: 24,
                    ),

                    const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //引用昵称
                      Text(
                        item.nickname,
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
                  )

                  ],
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(

                  //引用价格
                  item.price,
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
                  item.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  item.imagePath,
                  width: MediaQuery.of(context).size.width * 1,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),


               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 8,),

                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.end,//文本水平对齐

                 children:[
                   Text(
                   '浏览量',
                   style: TextStyle(fontSize: 14,color: Colors.grey),
                   ),
                   SizedBox(width: 10,),
                   Text(
                     '200',
                     style: TextStyle(fontSize: 14,color: Colors.grey),
                   ),

                 ],
               ),
              ),


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
                          Text(
                            item.description,
                            style: const TextStyle(
                                fontSize: 13.0,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                            maxLines: 2, // 控制最大行数
                            overflow: TextOverflow.ellipsis, // 超过时显示省略号
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
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


              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TimePayPage(
                        imagePath: item.imagePath,
                        nickname: item.nickname,
                        price: item.price,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 14.0),
                  child: const Text(
                    '下单',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )




            ],
          ),
        ),





      );
  }

}





