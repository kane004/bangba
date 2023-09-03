import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 导入SystemChrome

class PersonPage extends StatefulWidget {
    final String avatarImagePath;
    final String nickname;
    final String id;
  const PersonPage({Key? key,
    required this.avatarImagePath,
    required this.nickname,
    required this.id,

  }) : super(key: key);



  @override
  // ignore: library_private_types_in_public_api
  _HomePageDetailsState createState() => _HomePageDetailsState();
}

class _HomePageDetailsState extends State<PersonPage> {

  @override
  void initState() {
    super.initState();
    // 设置状态栏为透明样式，去掉阴影
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white38),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/HomeDetails.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 80, 14, 16), // 顶部和头像的间距,左间距，顶间距
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(widget.avatarImagePath), //头像
                              radius: 30,
                            ),
                            const SizedBox(width: 10), //头像和昵称id的宽度
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children:[
                                    Text(
                                      widget.nickname,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const CircleAvatar(
                                      backgroundImage: AssetImage('images/woman.png'),
                                      radius: 8,
                                      backgroundColor: Colors.white12,
                                    ),


                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      'id:',
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      widget.id,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        //个性签名
                        const SizedBox(height: 16),
                        const Text(
                          '爱好摄影，旅行，喜欢看全世界',
                          // 替换为您的新文本
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          maxLines: 3, // 控制最大行数
                          overflow: TextOverflow.ellipsis, // 超过时显示省略号
                        ),

                        const SizedBox(height: 80),
                        const Row(

                          children:[
                            Text(
                              '关注',
                              // 替换为您的新文本
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '16',
                              // 替换为您的新文本
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 26),


                            Text(
                              '粉丝',
                              // 替换为您的新文本
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '2350',
                              // 替换为您的新文本
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 120),


                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                // 添加其他需要的部件
              ],
            ),

           SizedBox(height: 16,),



          ],
        ),
      )






    );
  }


}
