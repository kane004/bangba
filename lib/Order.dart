import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingToDoState createState() => _WaitingToDoState();
}

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

final List<ImageItem> _dispatchTexts = [

  ImageItem(
    imagePath: 'images/image1.webp',
    description: '每周六需要一个上门遛狗大学生，30一小时，8小时工作时间提供假日、工作日、出差旅游，上门喂养猫咪、遛狗及其他小宠物服务。上门会自带手套，口罩，鞋套，垃圾袋。',
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

class _WaitingToDoState extends State<Order> {
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


      body:
      Container(
        color: Colors.grey[200],
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),//矩形边距
          itemCount: _dispatchTexts.length,
          itemBuilder: (context, index) {
            final ImageItem item = _dispatchTexts[index];
            return GestureDetector(
              onTap: () {
                _showDialog(context, item);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),//矩形与矩形间距
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),//矩形边角
                  ),
                  padding: const EdgeInsets.all(20.0),//矩形高度
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 0.5),
                      Text(
                        item.description,
                        maxLines: 2,// 设置最大显示行数为2
                        overflow: TextOverflow.ellipsis,// 超过2行时使用省略号
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 40.0), // 调整上下间距
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(item.imagePath),
                            radius: 15,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.nickname,
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 4.0), // 调整上下间距

                              ],
                            ),
                          ),
                          Text(
                            item.price,
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold
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

      ),


    );
  }
}


void _showDialog(BuildContext context, ImageItem item) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
                    child: Text(
                      item.price,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 1),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // 关闭弹窗
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20),
              Text(item.description),

              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 关闭弹窗
                    _showSuccessDialog(context); // 显示申请成功的弹窗
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 16.0),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Text('申请', style: TextStyle(color: Colors.white,fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
        actions: const [],
      );
    },
  );
}



void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50.0,
            ),
            SizedBox(height: 16.0),
            Text('申请成功！', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('关闭'),
          ),
        ],
      );
    },
  );
}
