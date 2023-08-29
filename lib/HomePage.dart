import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addContent.dart';
import 'package:kanetest/TextDetails.dart';
import 'Order.dart';
import 'Message.dart';
import 'MyPage.dart';

//定义一个数据类ImageItem来表示每张图片的信息
class ImageItem {
    final String imagePath;
    final String description;
    final String nickname;
    final String price;

  ImageItem(
      {
        required this.imagePath,
        required this.description,
        required this.nickname,
        required this.price,
      }
      );
}


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




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;




  final List<Widget> _pages = [
    HomePageContent(),
    const Order(),
    const Message(),
    const MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar:
      BottomNavigationBar(

        selectedLabelStyle: const TextStyle(color: Colors.green,fontSize: 14),
        unselectedLabelStyle: const TextStyle(color: Colors.black,fontSize: 14),
        showSelectedLabels: true, // 被选中时是否显示Label
        showUnselectedLabels: true, // 未被选中时是否显示Label
        enableFeedback: true, //点击会产生咔嗒声，长按会产生短暂的振动
        //backgroundColor: Colors.red, // 设置与页面背景相同的颜色
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey1.png'),color: Colors.black54), // 自定义未选中状态的图片
            activeIcon: ImageIcon(AssetImage('images/bottom1.png'),color: Colors.green), // 自定义选中状态的图片
            label: '首页',
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey2.png'),color: Colors.black54), // 自定义未选中状态的图片
            activeIcon: ImageIcon(AssetImage('images/bottom2.png'),color: Colors.green), // 自定义选中状态的图片
            label: '派发',
              backgroundColor: Colors.white

          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey3.png'),color: Colors.black54), // 自定义未选中状态的图片
            activeIcon: ImageIcon(AssetImage('images/bottom3.png'),color: Colors.green), // 自定义选中状态的图片
            label: '消息',
              backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey4.png'),color: Colors.black54), // 自定义未选中状态的图片
            activeIcon: ImageIcon(AssetImage('images/bottom4.png'),color: Colors.green), // 自定义选中状态的图片
            label: '我的',
              backgroundColor: Colors.white
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




class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 使状态栏透明
    return DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[100], // 设置AppBar的背景设置灰色
            elevation: 0, // 去掉AppBar的底部阴影
            //centerTitle: _currentIndex == 0 ? false : false, // 将标题居中显示
            title: Center(
              child: TabBar(
                  tabs: myTabs,
                  isScrollable: true,
                  //是否滚动
                  indicatorColor: Colors.green,
                  //指示器颜色
                  indicatorWeight: 4.0,
                  //指示器厚度
                  indicatorPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

                  //indicator 指示器边框样式

                  labelColor: Colors.black,
                  //选中字体颜色
                  labelStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  //选中文字风格
                  unselectedLabelColor: Colors.grey,
                  //未选中字体颜色
                  unselectedLabelStyle: const TextStyle(fontSize: 16) //未选中字体风格

                  ),
            ),
          ),
          body: TabBarView(
              children: myTabs
                  .map((Tab tab) => Center(
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.grey[100], // 设置灰色背景
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                  ),
                                  const SizedBox(height: 4.0), //主图与顶部之间间距

                                  //主图页
                                  GridView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, //两个网格
                                      crossAxisSpacing: 6.0, //横轴间距
                                      mainAxisSpacing: 7.0, //纵轴间距
                                      childAspectRatio: 0.6, //宽高比例
                                    ),
                                    itemCount: _imageItems.length,
                                    // 图片项的数量
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    // 禁用GridView的滚动
                                    itemBuilder: (context, index) {
                                      final ImageItem item = _imageItems[
                                          index]; // 获取当前索引处的ImageItem对象

                                      //点击跳转新页面
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TextDetails(item: item),
                                            ),
                                          );
                                        },

                                        //body图片文本
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            // 设置整块的背景颜色为白色

                                            //borderRadius: BorderRadius.circular(8.0), // 设置圆角半径

                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              // 设置左下角为圆角
                                              bottomRight: Radius.circular(
                                                  8.0), // 设置右下角为圆角
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              //主图片

                                              Expanded(
                                                child: ClipRRect(
                                                  //borderRadius: BorderRadius.circular(8.0), // 设置圆角半径
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft: Radius.circular(0),
                                                    // 设置左上角为直角
                                                    topRight: Radius.circular(
                                                        0), // 设置右上角为直角
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
                                              const SizedBox(height: 4.0),
                                              //主文本内容
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 4),
                                                child: Text(
                                                  item.description,
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  maxLines: 2, // 控制最大行数
                                                  overflow: TextOverflow
                                                      .ellipsis, // 超过时显示省略号
                                                ),
                                              ),
                                              const SizedBox(height: 12.0),

                                              //头像和昵称
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  //头像
                                                  CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        item.imagePath),
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
                            )),
                      ))
                  .toList()),

          /***
       *   + 按钮
       *
       * */

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 点击按钮跳转到新页面
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddContentPage(), // 新页面的构建方法
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),

      )
    );

  }
}


void main() {

  runApp(const MaterialApp(
    title: 'Home App',
    home: HomePage(),
  ));
}