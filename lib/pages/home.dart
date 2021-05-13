import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data);
    String bgi=data['day']?'day.png':'night.png';
    Color bg=data['day']?Colors.blue:Colors.indigo[600];
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgi'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(onPressed: () async {
                  dynamic result= await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'location':result['location'],
                      'time':result['time'],
                      'flag':result['flag'],
                      'day':result['day']
                    };
                  });

                }, icon: Icon(Icons.location_on), label: Text("Change Location",style: TextStyle(color:Colors.white),)),
                SizedBox(height: 9,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(backgroundImage: AssetImage('images/${data['flag']}'),radius: 12,),
                    SizedBox(width: 9,),
                    Text(data['location'],style: TextStyle(fontSize: 21,color: Colors.white)),
                  ],
                ),
                SizedBox(height: 9,),
                Text(data['time'],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
