import 'package:flutter/material.dart';

//** 필요정보
// 1. task 명
// 2. 반복 선택
// 3. 기본 시간

// db에 데이터를 저장해두고 완료한 것만 db에 완료 상태로 저장

enum Repeat {
  daily, // 0
  weekly, // 1
  weekends, // 2
  weekdays, // 3
  monthly, // 4
}

enum Day {
  mon, // 0
  tue, // 1
  wed, // 2
  thu, // 3
  fri, // 4
  sat, // 5
  sun, // 6
}

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('hi'),
    );
  }
}
