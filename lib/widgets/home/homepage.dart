import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:pbl_kasir/widgets/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'body.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getUser() async {
    Uri url = Uri.parse(BaseUrl.url + '/user');
    try {
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      var json = jsonDecode(response.body);
      print(Auth.token);
      setState(() {
        Auth.name = json['name'];
        Auth.email = json['email'];
      });
      print(Auth.isAdmin);
    } catch (e) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('token');
    await prefs.remove('name');
    await prefs.remove('email');
    await prefs.remove('isAdmin');
  }

  @override
  void initState() {
    super.initState();
    getUser();
    print("State");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
        elevation: 0,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _drawerHeader(Auth.name, Auth.email),
            _drawerItem(
              icon: Icons.folder,
              text: 'My Files',
              onTap: () => print('Tap My Files'),
            ),
            _drawerItem(
              icon: Icons.folder,
              text: 'My Files',
              onTap: () => print('Tap My Files'),
            ),
            _drawerItem(
              icon: Icons.logout,
              text: 'Log Out',
              onTap: () {
                logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: BodyPage(),
    );
  }
}

Widget _drawerHeader(nama, email) {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child:
          Image(image: AssetImage('assets/logo/sirdi.png'), fit: BoxFit.cover),
    ),
    accountName: Text(nama),
    accountEmail: Text(email),
  );
}

Widget _drawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Icon(icon),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
