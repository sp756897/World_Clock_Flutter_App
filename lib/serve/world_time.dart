import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool day;

  WorldTime({this.location,this.flag,this.url});


  Future<void> getTime() async{
    try{
      await Future.delayed(Duration(seconds: 3));
      Response response= await get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);
      String datetime=data["datetime"];
      String offset=data["utc_offset"].substring(1,3);
      String offset2=data["utc_offset"].substring(4,6);
      DateTime now= DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));
      now=now.add(Duration(minutes: int.parse(offset2)));
      time=DateFormat.jm().format(now);
      day=now.hour>6 && now.hour<18?true:false;
    }
    catch(e){
      time="Error in Loading. Restart. Please";
    }

  }

}