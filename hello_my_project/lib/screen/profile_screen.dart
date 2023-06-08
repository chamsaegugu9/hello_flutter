import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }

}

class _ProfileScreenState extends State<ProfileScreen>{

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        SizedBox(height: 16.0,),
        Column(
          children: [
            Text('아이디',),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '아이디',
              ),
            )
          ],
        ),
        SizedBox(height: 16.0,),
        Column(
          children: [
            Text('아이디',),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '아이디',
              ),
            )
          ],
        ),
        SizedBox(height: 16.0,),
        TextButton(
          onPressed: (){},
          child: Text('로그인'),
        ),
        SizedBox(height: 16.0,),
        TextButton(
          onPressed: (){},
          child: Text('아이디/비밀번호 찾기'),
        ),
        SizedBox(height: 16.0,),
        TextButton(
          onPressed: (){},
          child: Text('회원가입'),
        ),
        SizedBox(height: 16.0,),
        TextButton(
          onPressed: (){},
          child: Text('넘기기'),
        ),
      ],
    );
  }


}