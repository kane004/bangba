import 'dart:io';

import 'package:flutter/material.dart';

import 'addDistribute.dart';
// 导入数据库帮助类

class Distribute extends StatefulWidget {
  final String text;
  final String price;
  final String imagePath;
  const Distribute({required this.text, required this.price, required this.imagePath,Key? key}) : super(key: key);

  @override
  _DistributeState createState() => _DistributeState();
}

class _DistributeState extends State<Distribute> {
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchDataFromDatabase(); // 在初始化时查询数据库
  }

  void _fetchDataFromDatabase() async {
    final dbHelper = DatabaseHelper.instance;
    final data = await dbHelper.fetchData();

    setState(() {
      _dataList.clear(); // 清空数据列表
      // 插入到列表的开头，以便最新的数据在前面
      _dataList.insertAll(0, data);
    });
    print('数据获取成功: $data');
    print('获取到的数据: $_dataList');
  }
  void clearDataInDatabase() async {
    final dbHelper = DatabaseHelper.instance;

    // 清空数据库中的数据
    await dbHelper.clearData();

    // 更新页面
    setState(() {
      // 更新页面的逻辑...
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '派单',
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),

        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.grey[100],
      ),
      body: _dataList.isNotEmpty
          ? Container(
              color: Colors.grey[100],
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                itemCount: _dataList.length, // 使用数据列表的长度作为项目数
                itemBuilder: (context, index) {
                  final item = _dataList[index];
                  final text = item['text'];
                  final price = item['price'].toString();
                  final imagePath = item['imagePath'];
                  return GestureDetector(
                    onTap: () {
                      // 处理项目点击事件
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 0.5),
                            Text(
                              text,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 40.0),
                            Row(
                              children: [
                                const SizedBox(width: 8.0),
                                CircleAvatar(
                                  backgroundImage: imagePath != null &&
                                          imagePath.isNotEmpty
                                      ? Image(image: Image.file(File(imagePath)).image).image
                                  //没有数据显示默认头像
                                      : AssetImage(
                                          'images/image3.webp'),
                                  radius: 13,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  price,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/noDate.png', // 暂无数据的 UI 图片路径
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '暂无数据',
                    style: TextStyle(fontSize: 16.0,color: Colors.grey),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 执行清空操作
          clearDataInDatabase();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
