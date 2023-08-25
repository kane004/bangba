import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';



class AddContentPage extends StatefulWidget {
  const AddContentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddContentPageState createState() => _AddContentPageState();
}

class _AddContentPageState extends State<AddContentPage> {
  TextEditingController priceController = TextEditingController();
  String price = '0.00';
  final ImagePicker _imagePicker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.black), // 设置返回按键的颜色为黑色
        title: Row(

              children: [
                const Text(
                  '添加技能',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black

                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // 在这里添加发布按钮的点击事件
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green, // 设置背景颜色为绿色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0), // 设置圆角
                    ),
                  ),
                  child: const Text(
                    '发布',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),


        elevation: 0, // 去掉AppBar的底部阴影
        backgroundColor: Colors.grey[200], // 将AppBar的背景设置为透明

      ),


       /**
       *   添加技能  发布
       *
       * */


      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 设置左对齐
          children: [
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Stack(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: '描述您的技能详细内容...',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    maxLines: null,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () async {
                        final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

                        if (pickedFile != null) {
                          try {
                            FormData formData = FormData.fromMap({
                              'file': await MultipartFile.fromFile(pickedFile.path),
                            });

                            final Dio dio = Dio();
                            final response = await dio.post('http://114.132.44.108:8083', data: formData);

                            if (response.statusCode == 200) {
                              // 上传成功，处理逻辑
                              // 您可以在这里更新UI，显示已上传的图片等等
                            } else {
                              // 上传失败，处理逻辑
                              // 您可以在这里显示上传失败的提示
                            }
                          } catch (e) {
                            // 上传出错，处理逻辑
                            // 您可以在这里显示上传出错的提示
                          }
                        }
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Center(
                          child: Text(
                            '+添加优质图片~',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
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
                            title: const Text('输入价格'),
                            content: TextField(
                              controller: priceController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, priceController.text);
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
                            fontSize: 14,
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
            ),
          ],
        ),
      ),



    );
  }
  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }
}
