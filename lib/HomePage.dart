import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addContent.dart';
import 'package:kanetest/TextDetails.dart';
import 'Distribute.dart';
import 'Message.dart';
import 'MyPage.dart';
import 'addDistribute.dart' as Content;

import 'package:flutter/physics.dart';

void main() {
  runApp(MaterialApp(
    title: 'Home App',
    home: HomePage(),
  ));
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(
      description: '2',
      imagePath: 'images/image2.webp',
      price: '2',
    ),
    Distribute(text: "111111", price: "12", imagePath: 'images/woman.png'),
    Message('消息'),
    MyPage('我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(
          color: Colors.green,
          opacity: 1.0,
          size: 20,
        ),
        unselectedIconTheme:
        const IconThemeData(color: Colors.black, opacity: 1.0, size: 20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey1.png')),
            activeIcon: ImageIcon(AssetImage('images/bottom1.png')),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey2.png')),
            activeIcon: ImageIcon(AssetImage('images/bottom2.png')),
            label: '派发',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey3.png')),
            activeIcon: ImageIcon(AssetImage('images/bottom3.png')),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey4.png')),
            activeIcon: ImageIcon(AssetImage('images/bottom4.png')),
            label: '我的',
          ),
        ],
      ),
    );
  }
}


final List<Tab> myTabs = <Tab>[
  const Tab(text: '关注'),
  const Tab(text: '推荐'),
  const Tab(text: '同城'),
];

class HomePageContent extends StatefulWidget {
  final String description;
  final String price;
  final String imagePath;

  const HomePageContent({
    required this.description,
    required this.price,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final List<Map<String, dynamic>> _dataList = [];

  Future<void> _handleRefresh() async {
    final dbHelper = DatabaseHelper.instance;
    final data = await dbHelper.fetchData();
    await Future.delayed(Duration(seconds: 2)); // 模拟2秒的刷新操作

    setState(() {
      _dataList.clear();
      _dataList.addAll(data);
    });

    print('数据获取成功: $data');
    print('获取到的数据: $_dataList');
  }

  @override
  void initState() {
    super.initState();
    print('调用 initState');
    _fetchDataFromDatabase(); // 在初始化时查询数据库
    _handleRefresh(); // 页面首次加载时触发一次刷新
  }

  Future<void> _fetchDataFromDatabase() async {
    final dbHelper = DatabaseHelper.instance;
    final data = await dbHelper.fetchData();

    setState(() {
      _dataList.clear();
      _dataList.addAll(data);
    });

    print('数据获取成功: $data');
    print('获取到的数据: $_dataList');
    // 在数据获取成功后触发下拉刷新
    _handleRefresh();
  }

  void _showAddContentBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddContent()));
              },
              child: Text(
                '发布技能',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Content.AddDistribute()));
              },
              child: Text(
                '发布派单',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Text(
              '发布动态',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }

  final GlobalKey<RefreshIndicatorState> _refreshKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    // 使状态栏透明
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100], // 设置AppBar的背景设置灰色
          elevation: 0, // 去掉AppBar的底部阴影
          title: Center(
            child: TabBar(
              tabs: myTabs,
              isScrollable: true,
              indicatorColor: Colors.green[300],
              indicatorWeight: 4.0,
              indicatorPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: RefreshIndicator(
          key: _refreshKey,
          onRefresh: _handleRefresh,
          child: _dataList.isNotEmpty
              ? TabBarView(
            children: myTabs
                .map(
                  (Tab tab) => Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        GridView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            mainAxisSpacing: 7.0,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: _dataList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = _dataList[index];
                            final description = item['description'];
                            final price = item['price'].toString();
                            final imagePath = item['imagePath'];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TextDetails(
                                          imagePath: imagePath,
                                          description: description,
                                          price: price,
                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius:
                                        const BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                        child: FractionallySizedBox(
                                          widthFactor: 1,
                                          child: Image.file(
                                            File(imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(4.0),
                                      child: Text(
                                        description,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 4.0,
                                        right: 4.0,
                                      ),
                                      child: Text(
                                        '$price',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          )
              : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/noDate.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '暂无数据',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddContentBottomSheet,
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),

      ),
    );
  }
}

