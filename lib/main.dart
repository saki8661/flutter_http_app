import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // FutureBuilder<List<User>>(
          //   // 퓨처함수를 호출해서 실행된 결과를 스냅샷으로 보냄
          //   // 퓨처빌더뒤에 리턴타입 적어주기(하지않으면 파싱 2번해야함)
          //   future: UserRepository().fetchUserList(),
          //   builder: (context, snapshot) {
          //     print("그림그려짐!!!!!!!!!!!!!!!");
          //     if (snapshot.hasData) {
          //       // 통신이 끝남
          //       List<User> userList = snapshot.data ?? [];
          //       // null이 올 수도 있다(리스트가 없는 경우 or 통신이 끝난 경우)
          //       return ListView.builder(
          //         itemCount: userList.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             leading: Text("${userList[index].id}"),
          //             title: Text("${userList[index].username}"),
          //             subtitle: Text("${userList[index].email}"),
          //           );
          //         },
          //       );
          //     } else {
          //       // 통신중인 상태
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
          FutureBuilder<User>(
            future: UserRepository().fetchUser(1), // id를 어떻게 정의할지 확인이 필요
            builder: (context, snapshot) {
              print("그림그려짐!!!!!!!!!!!!!!!");
              if (snapshot.hasData) {
                User user = snapshot.data!;
                return ListTile(
                  leading: Text("${user.id}"),
                  title: Text("${user.username}"),
                  subtitle: Text("${user.email}"),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
