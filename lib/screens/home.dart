import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wajhny/screens/scan.dart';
import 'package:wajhny/screens/terms.dart';

import 'camera.dart';

class Home extends StatefulWidget {
  // MyHomePage({Key? key, required this.title}) : super(key: key);

  //final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 1;
  final tabs = [
    Terms(),
    // Camera(),
    Camera(),
  ];

  openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Camera(),
      ),
    );
  }

  @override
  void initState() {
    checkallpermission_opencamera();
    super.initState();
    //ask permission.
  }

  checkallpermission_opencamera() async {
    PermissionStatus statuses = await Permission.camera.request();

    if (statuses.isGranted) {
      _currentIndex = 1;
    } else {
      //ShowToast("Provide Camera permission to use camera.", position: ToastPosition.bottom);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      extendBody: true,
      key: _scaffoldKey,
      body: tabs[_currentIndex],
      bottomNavigationBar:
          // height: MediaQuery.of(context).size.height/8,
          //color: Colors.accents,
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              //iconSize: 0.8,
              selectedIconTheme: IconThemeData(size: 10),
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/transB.png"),
                ),
                // BottomNavigationBarItem(
                //     icon: Image.asset("assets/images/logoM.png"),
                //     title: Text("")),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/scanM.png"),
                ),
              ],
              onTap: _onItemTapped),
    );
  }
}
