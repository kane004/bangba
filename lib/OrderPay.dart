import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kanetest/OrderWait.dart';


class OrderPay extends StatefulWidget {
  final String imagePath;
  final String nickname;
  final String price;
  final String description;

  const OrderPay({
    Key? key,
    required this.imagePath,
    required this.nickname,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  _OrderPayState createState() => _OrderPayState();
}

class _OrderPayState extends State<OrderPay> {
  late List<bool> isSelected;
  late List<String> dateButtons;
  int? selectedTimeIndex;
  int? selectedPaymentIndex;
  String password = '';

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

  List<TextEditingController> passwordControllers = List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  // ... 在适当的位置初始化默认密码
  String defaultPassword = '111111';
  String errorText = '';  // 错误提示文本

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dateButtons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: selectedTimeIndex == index ? Colors.green : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: selectedTimeIndex == index ? Colors.green : Colors.black12,
                          ),
                        ),
                      ),
                      child: Text(
                        dateButtons[index],
                        style: TextStyle(
                          color: selectedTimeIndex == index ? Colors.white : Colors.black,
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
                 Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Image.asset('images/wechat.png'),
                ),
                const SizedBox(width: 10),
                const Text(
                  '微信',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPaymentIndex = 0;
                    });
                  },
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedPaymentIndex == 0 ? Colors.green : Colors.transparent, // 设置为透明
                    ),
                    child: selectedPaymentIndex == 0
                        ? Icon(Icons.check, color: Colors.white) // 选中状态显示系统的勾选图标
                        : null,  // 未选中状态不显示图标
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Image.asset('images/alipay.png'), // 自定义图标
                ),
                const SizedBox(width: 10),
                const Text(
                  '支付宝',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPaymentIndex = 1;
                    });
                  },
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedPaymentIndex == 1 ? Colors.green : Colors.transparent, // 设置为透明
                    ),
                    child: selectedPaymentIndex == 1
                        ? Icon(Icons.check, color: Colors.white) // 选中状态显示系统的勾选图标
                        : null,  // 未选中状态不显示图标
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),





            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '价格',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('输入密码'),
                          content: StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0; i < 6; i++)
                                        Container(
                                          width: 30,
                                          height: 30,
                                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          child: Center(
                                            child: TextField(
                                              controller: passwordControllers[i],
                                              focusNode: focusNodes[i],
                                              onChanged: (value) {
                                                if (value.length == 1 && i < 5) {
                                                  focusNodes[i + 1].requestFocus();
                                                }
                                                if (value.isEmpty && i > 0) {
                                                  focusNodes[i - 1].requestFocus();
                                                }

                                                // 清除错误提示
                                                setState(() {
                                                  errorText = '';
                                                });

                                                // 当所有输入框都有值时检查密码是否正确
                                                if (passwordControllers.every((controller) => controller.text.isNotEmpty)) {
                                                  String enteredPassword = passwordControllers.map((controller) => controller.text).join();
                                                  if (enteredPassword == defaultPassword) {
                                                    Navigator.of(context).pop(); // 关闭当前密码输入对话框

                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: const Text('支付成功'),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(context).pop(); // 关闭支付成功对话框
                                                              },
                                                              child: const Text('关闭'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                   // Future.delayed(const Duration(seconds: 1), () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => OrderWait(
                                                            imagePath: widget.imagePath,
                                                            nickname: widget.nickname,
                                                            price: widget.price,
                                                            description: widget.description,
                                                          ),
                                                        ),
                                                      );
                                                   // });
                                                  } else {
                                                    setState(() {
                                                      errorText = '密码错误，请重新输入';
                                                    });
                                                    // 密码错误，可以显示错误提示
                                                  }
                                                }
                                              },
                                              onSubmitted: (value) {
                                                // 如果已经输入了6个字符，则自动关闭键盘
                                                if (i == 5) {
                                                  FocusScope.of(context).unfocus();
                                                }
                                              },
                                              maxLength: 1,
                                              obscureText: true,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontSize: 20),
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration(
                                                counterText: '',
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  // 错误提示
                                  if (errorText.isNotEmpty)
                                    Text(
                                      errorText,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                ],
                              );
                            },
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                // 关闭弹窗时清空密码
                                passwordControllers.forEach((controller) => controller.clear());
                                Navigator.of(context).pop();
                              },
                              child: const Text('取消', style: TextStyle(fontSize: 14, color: Colors.grey)),
                            ),
                          ],
                        );

                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 14.0),
                    child: const Text(
                      '支付',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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