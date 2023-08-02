// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:kanetest/TextDetails.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();

}

//定义一个数据类ImageItem来表示每张图片的信息
class ImageItem {
  final String imagePath;
  final String description;
  final String nickname;
  final String price;


  ImageItem({
    required this.imagePath,
    required this.description,
    required this.nickname,
    required this.price,
    }
  );
}

final List<ImageItem> _dispatchTexts = [

  ImageItem(
    imagePath: 'images/image1.webp',
    description: '每周六需要一个上门遛狗大学生，30一小时，8小时工作时间',
    nickname: '小胡不糊',
    price: '￥100',
  ),

  ImageItem(
    imagePath: 'images/image2.webp',
    description: '下周日需要伴娘3名，要求165以上，形象一般即可',
    nickname: '小明不明',
    price: '￥200',
  ),
  ImageItem(
    imagePath: 'images/image3.webp',
    description: '找一个小三劝退师，提供小三地址名字5天时间',
    nickname: '小蔡不菜',
    price: '￥300',
  ),
  ImageItem(
    imagePath: 'images/image4.webp',
    description: '找一个连麦哄睡包月，要求声音好听，会讲故事，一个月2000',
    nickname: '小多不多',
    price: '￥210',
  ),

];

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

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController; // 声明 PageController 变量
  int _currentIndex = 0;



  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // 初始化 PageController
  }

  @override
  void dispose() {
    _pageController.dispose(); // 在组件销毁时释放 PageController
    super.dispose();
  }

  void _onBottomNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index); // 使用 jumpToPage 方法切换页面
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: _pageController,
        onPageChanged: _onBottomNavBarTapped,
        children: const [
          // 首页
          HomePage(),
          // 派单页面（暂未实现，可以根据需求添加对应的派单页面内容）
          DispatchPage(),
          // 消息页面（暂未实现，可以根据需求添加对应的消息页面内容）
          MessagePage(),
          // 我的页面（暂未实现，可以根据需求添加对应的我的页面内容）
          ProfilePage(),
        ],
      ),

      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        onTap: _onBottomNavBarTapped, // 将导航栏的点击事件与底部导航栏回调方法关联
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: '派单',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }
}

      /**
     *    首页
     *
     *
     * **/

// 声明一个全局变量，用于存储配置中的图片路径
//String imagePath = 'images/sign.png';// 替换为您的配置图片路径

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    // 使状态栏透明
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,// 设置AppBar的背景设置绿色

        elevation: 0,// 去掉AppBar的底部阴影
        //centerTitle: _currentIndex == 0 ? false : false, // 将标题居中显示

        title: Container(
          width: MediaQuery.of(context).size.width * 0.7, // 设置搜索框的宽度为屏幕宽度的70%
          height: 38,//搜索框高度
          alignment: Alignment.bottomRight,// 将搜索框靠左对齐
          decoration: BoxDecoration(
            color: Colors.grey[200],// 搜索框背景颜色为灰色
            borderRadius: BorderRadius.circular(256.0),// 圆角边框
          ),


          padding: const EdgeInsets.symmetric(horizontal: 10.0),// 搜索框内部水平边距
          child: const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),// 搜索框前面的搜索图标
              hintText: '输入ID、房间号',// 搜索框提示文本
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14
              ),
              border: InputBorder.none,// 去掉搜索框的边框
            ),
          ),
        ),



      ),


      body: DecoratedBox(
       decoration: BoxDecoration(
         color: Colors.grey[100], // 设置灰色背景
        ),

     child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
            ),
            const SizedBox(height: 4.0),//主图与顶部之间间距

            //主图页
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,  //两个网格
                crossAxisSpacing: 6.0,//横轴间距
                mainAxisSpacing: 7.0,//纵轴间距
                childAspectRatio: 0.6,//宽高比例
              ),
              itemCount: _imageItems.length,// 图片项的数量
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),// 禁用GridView的滚动
              itemBuilder: (context, index) {
                final ImageItem item = _imageItems[index]; // 获取当前索引处的ImageItem对象

                //点击跳转新页面
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  TextDetails(item: item),
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
                          fontWeight: FontWeight.w500
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
                            color: Colors.black45
                          ),
                        ),
                        const SizedBox(width: 40.0),
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
        )
      ),



    );

  }
}


    /**
   *   派单页面
   *
   * **/
class DispatchPage extends StatelessWidget {
  const DispatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Text(
          '派单',
          style: TextStyle(color: Colors.black, fontSize: 25.0),
          // 设置标题字体颜色为黑色，字体大小为30
        ),
        centerTitle: false, // 将标题居左显示
        elevation: 0, // 去掉AppBar的底部阴影
        backgroundColor: Colors.grey[200], // 将AppBar的背景设置为透明
      ),


      body: Container(
        color: Colors.grey[200], // 设置页面背景色为灰色
        child: ListView.builder(
          // 设置ListView的水平和垂直内边距
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),

          itemCount: _dispatchTexts.length,// 列表项的数量
          itemBuilder: (context, index) {
            // 获取对应索引位置的ImageItem对象
            final ImageItem item = _dispatchTexts[index];
            return Padding(
              // 设置列表项的垂直内边距
              padding: const EdgeInsets.symmetric(vertical: 4.0),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,// 设置容器的背景色为白色
                  borderRadius: BorderRadius.circular(8.0),// 设置容器的圆角边框
                ),
                padding: const EdgeInsets.all(24.0),// 设置容器内部的全局内边距
                child: Column(
                  // 将子组件在水平方向上左对齐
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 0.5),

                    Text(
                      item.description,// 使用ImageItem对象中的description作为标题文本
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(height: 32.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        //圆形头像
                        CircleAvatar(
                          backgroundImage: AssetImage(item.imagePath),
                          radius: 15, // 设置圆形头像的半径
                        ),
                        const SizedBox(width: 8.0),
                        //昵称
                        Text(
                          item.nickname,
                          style: const TextStyle(
                              fontSize: 13.0,
                            color: Colors.black54
                          ),
                        ),
                        const SizedBox(width: 140.0),
                        //价格
                        Text(
                          item.price,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.red
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
      ),

    );
  }
}



  /**
    消息页面

 */

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // 设置AppBar的背景设置白色
        elevation: 0, // 去掉AppBar的底部阴影
        // centerTitle: _currentIndex == 0 ? false : false, // 将标题居中显示
        title: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          // 设置搜索框的宽度为屏幕宽度的70%
          height: 40,
          //搜索框高度
          alignment: Alignment.bottomRight,
          // 将搜索框居中
          decoration: BoxDecoration(
            color: Colors.grey[200], // 搜索框背景颜色为灰色
            borderRadius: BorderRadius.circular(256.0), // 圆角边框
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          // 搜索框内部水平边距
          child: const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search), // 搜索框前面的搜索图标
              hintText: '搜索用户|消息',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.black38
              ),// 搜索框提示文本
              border: InputBorder.none, // 去掉搜索框的边框
            ),
          ),
        ),
      ),
      //滚动部件SingleChildScrollView
      body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),

              // 头像和文本
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(

                  children: [
                    // 圆形头像图片
                    Image(
                      image: AssetImage('images/message2.png'),
                      width: 50,
                      height: 50,

                    ),
                    SizedBox(width: 20),

                    // 垂直的文本
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '系统消息',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '收到来自小小的投诉啦来看看~',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

          //订单消息
           Padding(
               padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
             child: Row(
               children: [
                 Image(
                   image: AssetImage('images/message1.png'),
                   width: 50,
                   height: 50,

                 ),
                 SizedBox(width: 20),

                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       '订单消息',
                       style: TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     SizedBox(height: 5),
                     Text('您有新的订单请查看~',
                       style: TextStyle(
                         fontSize: 12,
                         color: Colors.grey,

                       ),
                     )
                   ],
                 )

               ],
             ),
           ),

           //其他消息
           Padding(
               padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
             child: Row(
               children:  [
                 Image(
                   image: AssetImage('images/message3.png'),
                   width: 50,
                   height: 50,
                 ),
                 SizedBox(width: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('小助手',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '有什么问题都可以问我哦~',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                      ),
                    )
                  ],
                )

               ],
             ),
           ),
           
         ],
       ),
     ),



      );


  }
}

/**
        我的页面

     */



class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30), // 添加顶部与body之间的间距
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/me10.png'), // 替换为您的背景图片路径
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(16.0),

            child: const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/image4.webp'), // 替换为您的头像图片路径
                  radius: 28,
                ),
                SizedBox(width: 16),
                Text(
                  '笑小小', // 替换为您的昵称
                  style: TextStyle(fontSize: 16),
                ),
              ],
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

          const SizedBox(height: 30),

          // 第二个Container，加背景图片

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /**
                 *    我的订单
                 *
                 * **/
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),// 添加圆角边框
                  ),
                  // 设置文本icon水平和垂直方向的间距
                  padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 40.0),
                  margin: const EdgeInsets.all(10.0),//矩形框和墙边距
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTextWithIcon('待处理', 'images/order1.png'),
                      _buildTextWithIcon('进行中', 'images/order2.png'),
                      _buildTextWithIcon('已完成', 'images/order3.png'),
                      _buildTextWithIcon('已取消', 'images/order4.png'),
                      _buildTextWithIcon('全部', 'images/order5.png'),
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
                  padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 40.0),
                  margin: const EdgeInsets.all(10.0),//矩形框和墙边距
                  child: Column(
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconWithIcon('我发布的', 'images/me1.png',32),
                          _buildIconWithIcon('认证中心', 'images/me2.png',32),
                          _buildIconWithIcon('意见反馈', 'images/me3.png',32),
                          _buildIconWithIcon('个人设置', 'images/me4.png',32),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconWithIcon('举报中心', 'images/me5.png',32),
                          _buildIconWithIcon('我的排名', 'images/me6.png',32),
                          _buildIconWithIcon('优惠券', 'images/me7.png',32),
                          _buildIconWithIcon('支付密码', 'images/me4.png',32),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),

        ],
      ),
    ),
    );
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

}




void main() {

  runApp(const MaterialApp(
    title: 'Home App',
    home: MyHomePage(),
  ));
}