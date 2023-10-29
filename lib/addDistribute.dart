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
      version: 3, // 增加版本号以触发迁移。
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
        price REAL
     
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

  String price = ''; // 添加 price 变量

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);


  }

  void _saveDataToDatabase(BuildContext context) async {
    final text = _textController.text;
    final price = _priceController.text;

    final dbHelper = DatabaseHelper.instance;
    await dbHelper.insertData({
      'text': text,
      'price': price,
      });

    // 清空文本框和图像路径
    _textController.clear();
    _priceController.clear();


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Distribute(text: text, price: price ),
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





              const SizedBox(height: 20.0),

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

                        Icon(Icons.chevron_right, color: Colors.grey),
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
