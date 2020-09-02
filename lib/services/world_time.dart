import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{


  String location;//location name for the ul
  String time;//the time of the location
  String flag;//url to an asset flag icon
  String url;//location url for api endpoint
  bool isDaytime;//true or false if daytime or not

  WorldTime({ this.location , this.flag , this.url });


  Future<void> getTime() async {

    try{

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      //String datetime1 = data['datatime'];

      String offset =data['utc_offset'].substring(1,3);

      DateTime now =DateTime.parse(data['datetime']);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now.hour);
      isDaytime = now.hour>5 && now.hour<20 ? true : false;
      print(isDaytime);
      time = DateFormat.jm().format(now);

    }

    catch (e){

      print('caught error : $e');
      time='could not find datetime';

    }
  }  //make request


}


