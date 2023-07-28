import 'package:flutter/material.dart';

import 'MyHomePage.dart';


class TextDetails extends StatelessWidget{

  final ImageItem item;

  const TextDetails({Key? key, required this.item}) : super(key: key);


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
                      backgroundImage: AssetImage(item.imagePath),
                      radius: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.nickname,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  item.price,
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
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
              const SizedBox(height: 20),
            ],
          ),
        ),

        // 添加底部矩形白色背景及“下单”按钮
        bottomNavigationBar: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end, // 将两个按钮靠右显示
            children: [
              ElevatedButton(
                onPressed: () {
                  // 在此处添加处理下单按钮点击事件的逻辑
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  onPrimary: Colors.white,
                  elevation: 0, // 去掉阴影效果
                  //设置圆角按钮
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Text(
                    '聊天',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(width: 8), // 调整按钮之间的间距
              ElevatedButton(
                onPressed: () {
                  // 在此处添加处理聊天按钮点击事件的逻辑
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  elevation: 0, // 去掉阴影效果
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Text(
                    '下单',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),





      );
  }

}





