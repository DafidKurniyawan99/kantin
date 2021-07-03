/*import 'dart:async';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:unsiq/constans.dart';
// ignore: unused_import
import 'package:unsiq/pembeli/landing.dart' as pembeli;

class LouncherPage extends StatefulWidget {
  @override
  _LouncherPageState createState() => _LouncherPageState();
}

class _LouncherPageState extends State<LouncherPage> {
  var _;



  
  @override
  void initState() {
    super.initState();
     startLaunching();
  }

  @override
  void dispose() {
    super.dispose();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 5);
    return new Timer(duration, () {
      Navigator.of(context)
      .pushReplacement(new MaterialPageRoute(builder: (_)
       return new pembeli.landing();
            }
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Palette.bg1, Palette.bg2],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: new Image.asset(
                "assets/logo_kantin.png",
                height: 90.0,
                width: 270.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
