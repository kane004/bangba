import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Upload Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageUploadPage(),
    );
  }
}

class ImageUploadPage extends StatefulWidget {
  const ImageUploadPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  final ImagePicker _imagePicker = ImagePicker();
  String _uploadStatus = '';

  Future<void> _uploadImage() async {
    final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        const String uploadUrl = 'http://114.132.44.108:8083'; // 替换为实际的上传URL
        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(pickedFile.path),
        });

        final Dio dio = Dio();
        final response = await dio.post(uploadUrl, data: formData);

        if (response.statusCode == 200) {
          setState(() {
            _uploadStatus = '上传成功';
          });
        } else {
          setState(() {
            _uploadStatus = '上传失败';
          });
        }
      } catch (e) {
        setState(() {
          _uploadStatus = '上传出错';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('选择并上传图片'),
            ),
            const SizedBox(height: 20),
            Text(
              _uploadStatus,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
