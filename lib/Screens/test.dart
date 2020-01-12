import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Test extends StatefulWidget {

  @override
  _TestState createState() => new _TestState();
}

class _TestState extends State<Test> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
  var ios = new IOSInitializationSettings();
  var initSettings = new InitializationSettings(android, ios);
  flutterLocalNotificationsPlugin.initialize(
      initSettings, onSelectNotification: selectNotification );
  }

  Future selectNotification(String payload){
    debugPrint('print payload : $payload');
    showDialog(context: context,builder: (_)=> AlertDialog(
      title: new Text('Notification') ,
      content: new Text('$payload'),
    ),);
  }

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
      appBar: new AppBar(
         title: new Text('Local Notification'),
      ),
      body: new Center(
          child: new Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new RaisedButton(child:Text('Click me') , onPressed: (){
               Timer(Duration(seconds: 5), showNotification);
            })
          ],
        ),
      ),

    );
  }



  showNotification() async{
    var android = new AndroidNotificationDetails(
        "channelId", "channelName", "channelDescription"
    ,priority: Priority.High,importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
   var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Muhammed Essa', 'Ahmed Osama' , platform,payload: 'This is my name');


  }



}
