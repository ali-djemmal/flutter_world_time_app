import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_word_time/services/word_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time ="loading .....";


  void setWorldTime() async{
    WorldTime worldTime = WorldTime(url: 'Africa/Algiers',location: 'Algiers',flag: 'algeria.png');
    await worldTime.getTime();
    /*setState(() {
      time= worldTime.time;
    });*/
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location': worldTime.location,
     'time':worldTime.time,
     'flag':worldTime.flag,
     'isDayTime': worldTime.isDayTime
   });


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Padding(
          padding: const EdgeInsets.fromLTRB(0.0,150.0,0.0,0.0),
          child: Column(
          children: <Widget>[
            SpinKitRotatingCircle(
              color: Colors.black87,
              size: 50.0,
            ),
            SizedBox(height: 20.0),
            Text('Loading ...',
            style: TextStyle(fontSize: 50.0),)
          ],

      ),
        ))
    );
  }
}
