import 'package:flutter/material.dart';

import 'MyHomePage.dart';


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

  String _errorMessage = '';
  bool _isAgreedToTerms = false;

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
        _errorMessage = '请填写完整信息';
      });
    } else if (verificationCode != '1234') {
      setState(() {
        _errorMessage = '验证码错误';
      });
    } else {
      // 登录成功，跳转到首页
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    }
  }

  void _getVerificationCode() {
    setState(() {
      _verificationCodeController.text = '1234';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null, // 设置标题为null，这样就不会显示标题
        backgroundColor: Colors.transparent, // 设置背景颜色为透明色
        elevation: 0, // 去掉阴影效果
      ),
      body: Padding(

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

            const SizedBox(height: 32.0),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _usernameController,
                      style: const TextStyle(color: Colors.black12),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入手机号',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        )
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _getVerificationCode,
                    child: const Text(
                      '获取验证码',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
          ],
        ),
      ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.black26),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '请输入验证码',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16
                  )
                ),
              ),
            ),

            const SizedBox(height: 32.0),
            ElevatedButton(
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


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.1), // 调整水平间距
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
                const Text('我已阅读并同意', style: TextStyle(fontSize: 12,color: Colors.black45)),
                const Text('《服务协议》', style:TextStyle(fontSize: 12,color: Colors.blue)),
                const Text('和', style: TextStyle(fontSize: 12,color: Colors.black45)),
                const Text('《隐私政策》', style:TextStyle(fontSize: 12,color: Colors.blue)),
              ],
            ),


            const SizedBox(height: 16.0),

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
    );
  }
}








