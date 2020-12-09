import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;// api for  end point
  bool isDayTime= false ;

  WorldTime({this.url,this.location,this.flag});

  Future<void> getTime() async{
    try{
      Response response= await  get('http://worldtimeapi.org/api/timezone/$url');
      Map data= jsonDecode(response.body);

      // get proprties from data

      String datatime = data['datetime'];
      String offset =data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datatime);
      now= now.add(Duration(hours:int.parse(offset)));

      this.isDayTime= now.hour>6 && now.hour<20 ? true : false;

     // this.time= now.toString();
      time = DateFormat.jm().format(now).toString();

    } catch(e){
      print('error : $e');
      this.time='time error';

    }
    // make the request

  }

}