import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations=[
    WorldTime(url: 'Europe/London', location: 'London', flag:'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag:'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag:'egypt.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag:'usa.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag:'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New_York', flag:'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag:'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location:'Jakarta', flag:'indonesia.png'),

  ];
  void update(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[200],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child:ListTile(
                onTap: () {
                  update(index);
                },
                  title:Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assests/${locations[index].flag}'),
                )
              ) ,
            ),
          );
        },
      ),
    );
  }
}
