import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:klimatic/util/utils.dart' as util;
import 'dart:async';
import 'dart:convert';

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  
  void showStuff() async{
    Map data=await getWeather(util.appId, util.defaultCity);
    print(data.toString());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Klimatic'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new  Icon(Icons.menu),
              onPressed: showStuff )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/umbrella.jpg', width: 490, fit: BoxFit.fill, height: 1200),

          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: Text('tulsa',
            style: cityStyle(),),
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/rain.png', width: 150, height: 150,
        )
          ),
          //new Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          new Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 57),
              alignment: Alignment.center,
              child: new Text('67.8F',
              style: tempStyle()
              )),

        ],
      ),
    );
  }
  Future<Map> getWeather(String appId, String city) async{
    String apiUrl= 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}&units=imperial';
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }
  Widget updateTempWidget(String city){
    return new FutureBuilder(
      builder:(BuildContext context, AsyncSnapshot<Map> snapshot) {

      });
  }
}

TextStyle cityStyle(){
  return new TextStyle(
      color: Colors.black,
      fontSize: 23,
      fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle(){
  return new TextStyle(
      color: Colors.black,
      fontSize: 23,
      fontStyle: FontStyle.normal
  );
}