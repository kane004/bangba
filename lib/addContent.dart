import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class AddContentPage extends StatefulWidget {
  const AddContentPage({Key? key}) : super(key: key);

  @override
  _AddContentPageState createState() => _AddContentPageState();
}

class _AddContentPageState extends State<AddContentPage> {
  TextEditingController priceController = TextEditingController();
  String price = '0.00';
  final ImagePicker _imagePicker = ImagePicker();
  XFile? pickedFile;

  Future<void> uploadImage() async {
    if (pickedFile != null) {
      try {
        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(pickedFile!.path),
        });

        final Dio dio = Dio();
        final response = await dio.post('http://114.132.44.108:8083', data: formData);

        if (response.statusCode == 200) {
          // Image upload successful, handle logic here
          // You can update the UI to display the uploaded image, etc.
        } else {
          // Image upload failed, handle logic here
          // You can display a failed upload message here
        }
      } catch (e) {
        // Error occurred during upload, handle logic here
        // You can display an error message here
      }
    }
  }

  Future<void> pickImage() async {
    final XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedFile = pickedImage;
    });
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
            TextButton(
              onPressed: () {
                // Add logic for publish button click here
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
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
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: const Center(
                          child: Column(
                            children: [
                              Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '添加更多优质图片~',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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
                borderRadius: BorderRadius.circular(8.0),
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
                            title: const Text(
                              '输入价格',
                              style: TextStyle(fontSize: 16),
                            ),
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