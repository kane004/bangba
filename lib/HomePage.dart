import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addContent.dart';
import 'package:kanetest/TextDetails.dart';
import 'Distribute.dart';
import 'Message.dart';
import 'MyPage.dart';

//定义一个数据类ImageItem来表示每张图片的信息
class ImageItem {
    final String imagePath;
    final String description;
    final String nickname;
    final String price;
    final String area;
    final String Ram;


  ImageItem(
      {
        required this.imagePath,
        required this.description,
        required this.nickname,
        required this.price,
        required this.area,
        required this.Ram,
      }
      );
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




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;




  final List<Widget> _pages = [
     HomePageContent(),
     Distribute('派单'),
     Message('消息'),
     MyPage('我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar:
      BottomNavigationBar(

        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(
          color: Colors.green,opacity: 1.0,size: 20,
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.black,opacity: 1.0,size: 20),

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey1.png')), // 自定义未选中状态的图片
            activeIcon: ImageIcon(AssetImage('images/bottom1.png')), // 自定义选中状态的图片
            label: '首页',

          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey2.png')), // 自定义未选中状态的图片
            activeIcon: ImageIcon(AssetImage('images/bottom2.png')), // 自定义选中状态的图片
            label: '派发',


          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey3.png')),// 自定义未选中状态的图片
            activeIcon: ImageIcon(AssetImage('images/bottom3.png')), // 自定义选中状态的图片
            label: '消息',

          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/grey4.png')), // 自定义未选中状态的图片
            activeIcon: ImageIcon(AssetImage('images/bottom4.png')), // 自定义选中状态的图片
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
                                                 padding: EdgeInsets.symmetric(horizontal: 4),
                                               child:  Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Padding(
                                                       padding:
                                                       const EdgeInsets.symmetric(vertical: 2),
                                                       child: Text(
                                                         item.description,
                                                         style: const TextStyle(
                                                             fontSize: 15.0,
                                                             height: 1.5,
                                                             fontWeight:
                                                             FontWeight.w500),
                                                         maxLines: 2, // 控制最大行数
                                                         overflow: TextOverflow
                                                             .ellipsis, // 超过时显示省略号
                                                       ),
                                                     ),
                                                     const SizedBox(height: 2.0),
                                                     Row(
                                                       children: [
                                                         Text(
                                                           item.Ram,
                                                           style: const TextStyle(
                                                               fontSize: 10.0,
                                                               //height: 1.2,
                                                               color: Colors.red),
                                                         ),

                                                         Text(
                                                           item.price,
                                                           style: const TextStyle(
                                                             fontSize: 15.0,
                                                             height: 1.4,
                                                             color: Colors.red,
                                                           ),
                                                         ),

                                                       ],
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
                                                           item.area,
                                                           style: const TextStyle(
                                                             fontSize: 13.0,
                                                             color: Colors.grey,
                                                           ),
                                                         )
                                                       ],
                                                     )
                                                   ],
                                                 )
                                             ),
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