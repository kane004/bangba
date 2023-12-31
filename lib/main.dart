

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(const MaterialApp(
    title: 'Login App',
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();


  String errorText = '';

  bool _isAgreedToTerms = false;
  String termsAndConditions = '';



  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String verificationCode = _verificationCodeController.text.trim();

    if (!_isAgreedToTerms) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('提示'),
          content: const Text('请先同意服务协议'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('确定'),
            ),
          ],
        ),
      );
    } else if (username.isEmpty || password.isEmpty || verificationCode.isEmpty) {
      setState(() {
        _showErrorDialog('请填写有效信息') ;
      });
    } else if(username.length < 11){
      setState(() {
        _showErrorDialog('手机号输入有误');
      });
    } else {
      // 登录成功，跳转到首页
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
    }
  }

  void _getVerificationCode() {
    setState(() {
      _verificationCodeController.text = '1234';
    });
  }
  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('提示'),
        content: Text(errorMessage),
      ),
    );

    // 自动关闭弹窗
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null, // 设置标题为null，这样就不会显示标题
        backgroundColor: Colors.grey[100], // 设置背景颜色为透明色
        elevation: 0, // 去掉阴影效果
      ),
      body: Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Image.asset(
                  'images/login.png', // 替换为你的 logo 图片路径
                  width: 80, // 根据需要设置图片的宽度
                  height: 80, // 根据需要设置图片的高度
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  '帮呗',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    // 创建一个新的主题样式，并将 cursorColor 设置为黑色
                    textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Colors.green,
                    ),
                  ),
                  child: Container(
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _usernameController,
                            style: const TextStyle(color: Colors.black, fontSize: 18),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '请输入手机号',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _getVerificationCode,
                          child: const Text(
                            '验证码',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    // 创建一个新的主题样式，并将 cursorColor 设置为黑色
                    textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Colors.green,
                    ),
                  ),
                child: Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black,fontSize: 18),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入验证码',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                        )
                    ),
                  ),
                ),
              ),
              ),
              const SizedBox(height: 20),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    primary: Colors.green,
                    elevation: 0,
                  ),
                  child: const Text('登录',
                      style: TextStyle(
                        fontSize: 18.0,

                      )
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:1), // 调整水平间距
                    child: Checkbox(
                      value: _isAgreedToTerms,
                      activeColor: Colors.green,
                      shape: const CircleBorder(),
                      onChanged: (value) {
                        setState(() {
                          _isAgreedToTerms = value ?? false;
                        });
                      },
                    ),
                  ),
                  const Text(
                      '我已阅读并同意帮呗', style: TextStyle(
                      fontSize: 13,color: Colors.black45
                  )
                  ),

                  const Text(
                      '《服务协议》', style:TextStyle(
                      fontSize: 13,color: Colors.blue
                  )
                  ),


                  const SizedBox(height: 20),
                  Text(
                    termsAndConditions, // 显示服务协议内容
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Text(
                      '和', style: TextStyle(
                      fontSize: 13,color: Colors.black45
                  )
                  ),

                  const Text(
                      '《隐私政策》', style:TextStyle(
                      fontSize: 13,color: Colors.blue
                  )
                  ),


                ],
              ),


              const Spacer(),
              const Center(
                child:Text(
                  '其他登录',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // 微信登录的逻辑
                    },
                    icon: const Image(
                      image: AssetImage('images/wechat.png'),
                      height: 32.0,
                      width: 32.0,
                    ),
                  ),
                  const SizedBox(width: 72.0),
                  IconButton(
                    onPressed: () {
                      // 苹果登录的逻辑
                    },
                    icon: const Image(
                      image: AssetImage('images/apple.png'),
                      height: 32.0,
                      width: 32.0,
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      )
    );
  }
}








