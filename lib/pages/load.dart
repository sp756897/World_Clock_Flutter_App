import 'package:flutter/material.dart';
import 'package:worldapp/serve/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {


  void setTime() async{
    WorldTime instance=WorldTime(location: 'Kolkata',flag: 'India',url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'day':instance.day
    });
  }

  @override
  void initState() {
    super.initState();
    setTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Center(
            child: SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            ),
        ),
      ),
    );
  }
}
