import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanetest/Distribute.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    final path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 2, // 增加版本号以触发迁移。
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase, // 添加此行以处理数据库迁移。
    );
  }

  //新建数据库
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT,
        price REAL,
        imagePath TEXT
      )
    ''');
  }


  //更新数据库字段
  Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        ALTER TABLE my_table
        
      ''');
    }
  }

  //插入数据
  Future<int> insertData(Map<String, dynamic> row) async {
    final db = await database;
    final result = await db.insert('my_table', row);
    print('插入数据成功'); // 添加打印语句
    return result;
  }
  //获取数据
  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await database;
    final result = await db.query('my_table');
    print('查询结果: $result'); // 添加打印语句
    return result;
  }
 //清空数据
  Future<void> clearData() async {
    final db = await database;
    await db.delete('my_table');
  }

}



class AddDistribute extends StatefulWidget {
  const AddDistribute({super.key});

  @override
  _AddDistributeState createState() => _AddDistributeState();
}

class _AddDistributeState extends State<AddDistribute> {
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
    final text = _textController.text;
    final price = _priceController.text;

    final dbHelper = DatabaseHelper.instance;
    await dbHelper.insertData({
      'text': text,
      'price': price,
      'imagePath': imagePath});

    // 清空文本框和图像路径
    _textController.clear();
    _priceController.clear();
    setState(() {
      imagePath = '';
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Distribute(text: text, price: price, imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布派单'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: '输入内容...',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                )
              ),
            ),
            SizedBox(height: 20,),
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
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                        '￥$price',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        '>',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getImageFromGallery,
              child:  Text('选择相册图片'),
            ),
            const SizedBox(height: 16.0),
            imagePath.isNotEmpty
                ? Image.file(
              File(imagePath),
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            )
                : Container(),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _saveDataToDatabase(context),
              child: Text('保存'),
            ),
          ],
        ),
        ),
      );

  }
}
