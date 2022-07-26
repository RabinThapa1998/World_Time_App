import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var urlParsed = Uri.parse('https://worldtimeapi.org/api/timezone/$url');

      //make the request
      Response response = await get(urlParsed);
      Map data = jsonDecode(response.body);
      // print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create datatime obj
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time  = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught an error : $e');
      time = 'could not get time data';
    }
  }
}
