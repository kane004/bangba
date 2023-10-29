import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanetest/HomePage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'my_database.db');
    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  //新建数据库
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Skill (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT,
        price REAL,
        imagePath TEXT
      )
    ''');
  }

//更新数据库字段
  Future<void> _upgradeDatabase(
      Database db, int oldVersion, int newVersion) async {}

  //插入数据
  Future<int> insertData(Map<String, dynamic> row) async {
    final db = await database;
    final result = await db.insert('Skill', row);
    print('插入数据成功'); // 添加打印语句
    return result;
  }

  //获取数据
  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await database;
    final result = await db.query('Skill');
    print('查询结果: $result'); // 添加打印语句
    return result;
  }

  //清空数据
  Future<void> clearData() async {
    final db = await database;
    await db.delete('Skill');
  }
}

class AddContent extends StatefulWidget {
  const AddContent({super.key});

  @override
  _AddContentState createState() => _AddContentState();
}

class _AddContentState extends State<AddContent> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String imagePath = ''; // 存储图像路径
  String price = ''; // 添加 price 变量

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    } else {
      // 用户取消了选择图片的操作
    }
  }

  void _saveDataToDatabase(BuildContext context) async {
    final description = _textController.text;
    final price = _priceController.text;
    print('Description: $description');
    print('Price: $price');
    print('Inserting data to database...');

    final dbHelper = DatabaseHelper.instance;
    await dbHelper.insertData({
      'description': description,
      'price': price,
      'imagePath': imagePath,
    });

    // 清空文本框和图像路径
    _textController.clear();
    _priceController.clear();
    setState(() {
      imagePath = '';
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HomePageContent(
              description: description,
              price: price,
              imagePath: imagePath,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            const Text(
              '添加技能',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () => _saveDataToDatabase(context),

              style: TextButton.styleFrom(
                backgroundColor: Colors.green[400],
                elevation: 0, // 去掉阴影效果
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: const Text(
                '发布',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.grey[100],
      ),
      body: Container(
        color: Colors.grey[100],
        // 设置整个页面的背景颜色为白色
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white, // 设置灰色背景
                  borderRadius: BorderRadius.circular(8.0), // 圆角
                ),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: '输入内容...',
                    hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    border: InputBorder.none, // 移除下划线
                    contentPadding: EdgeInsets.all(0), // 移除默认的内边距
                  ),
                  maxLines: null, // 允许文本自动换行
                ),
              ),



              const SizedBox(height: 10.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft, // 左对齐
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[300],
                        onPrimary: Colors.white,
                        elevation: 0, // 去掉阴影效果
                        // 设置圆角按钮
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: _getImageFromGallery,
                      child: Text('+添加图片'),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerLeft, // 左对齐
                    child: imagePath.isNotEmpty
                        ? Image.file(
                      File(imagePath),
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    )
                        : Container(),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),

              const SizedBox(height: 40.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '价格',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () async {
                final newPrice = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        '输入价格',
                        style: TextStyle(fontSize: 16),
                      ),
                      content: TextField(
                        controller: _priceController,
                        keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, _priceController.text);
                          },
                          child: const Text('保存'),
                        ),
                      ],
                    );
                  },
                );

                if (newPrice != null) {
                  setState(() {
                    price = newPrice;
                  });
                }
              },
              child: Row(
                children: [
                  Text(
                    '$price',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$price',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        ]
      ),
      ),
    );
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }
}
