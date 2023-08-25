import 'package:flutter/material.dart';
import 'package:intl/intl.dart';





class TimePayPage extends StatefulWidget {
  final String imagePath;
  final String nickname;
  final String price;

  const TimePayPage({
    Key? key,
    required this.imagePath,
    required this.nickname,
    required this.price,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TimePayPageState createState() => _TimePayPageState();
}

class _TimePayPageState extends State<TimePayPage> {
  late List<bool> isSelected;
  late List<String> dateButtons;

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(8, (index) => false);
    dateButtons = List.generate(8, (index) {
      final now = DateTime.now();
      final currentDate = now.add(Duration(days: index));
      final formattedDate = DateFormat('M-d').format(currentDate);
      return formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          '下单',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.imagePath),
                  radius: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  widget.nickname,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              '选择时间',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 35, // 设置列表的高度
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // 水平滚动
                itemCount: dateButtons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected[index] = !isSelected[index];
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                        isSelected[index] ? Colors.green : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color:
                            isSelected[index] ? Colors.green : Colors.black12,
                          ),
                        ),
                      ),
                      child: Text(
                        dateButtons[index],
                        style: TextStyle(
                          color: isSelected[index]
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              '支付方式',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/wechat2.png'),
                  radius: 14,
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(width: 14),
                const Text(
                  '微信',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Your logic to toggle the selection
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected[0] ? Colors.green : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: isSelected[0]
                        ? Image.asset('images/select.png')
                        : Image.asset('images/select1.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/alipay.png'),
                  radius: 14,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 14),
                Text(
                  '支付宝',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Text(
                  '价格',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const Spacer(), // 自动填充右侧空间
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('确认支付'),
                          content: const Text('确定要支付吗？'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // 关闭弹窗
                              },
                              child: const Text('取消'),
                            ),
                            TextButton(
                              onPressed: () {
                                // 在这里添加支付逻辑
                                Navigator.of(context).pop(); // 关闭弹窗
                              },
                              child: const Text('确定'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 12.0),
                    child: const Text(
                      '支付',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


