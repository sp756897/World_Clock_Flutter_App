import 'package:flutter/material.dart';
import 'package:worldapp/serve/world_time.dart';

class Loc extends StatefulWidget {
  @override
  _LocState createState() => _LocState();
}

class _LocState extends State<Loc> {

  List<WorldTime> locations = [

    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),

    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),

    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),

    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),

    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),

    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),

    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),

    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),

  ];

  void update(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'day':instance.day
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("World Clock"),
        centerTitle: true,
        elevation: 3,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                update(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
