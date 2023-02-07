import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      'resource://drawable/notification_icon',
      [            // notification icon
        NotificationChannel(
          channelGroupKey: 'basic_test',
          channelKey: 'basic',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          channelShowBadge: true,
          importance: NotificationImportance.High,
          enableVibration: true,
        ),

        NotificationChannel(
            channelGroupKey: 'image_test',
            channelKey: 'image',
            channelName: 'image notifications',
            channelDescription: 'Notification channel for image tests',
            defaultColor: Colors.redAccent,
            ledColor: Colors.white,
            channelShowBadge: true,
            importance: NotificationImportance.High
        )

        //add more notification type with different configuration

      ]
  );

  //tap listiner on notification
  AwesomeNotifications().actionStream.listen((ReceivedNotification receivedNotification){
    print(receivedNotification.payload!['name']);
    //output from first notification:  FlutterCampus
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home()
    );
  }
}

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notification in Flutter"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  bool isallowed = await AwesomeNotifications().isNotificationAllowed();
                  if (!isallowed) {
                    //no permission of local notification
                    AwesomeNotifications().requestPermissionToSendNotifications();
                  }else{
                    //show notification
                    AwesomeNotifications().createNotification(
                        content: NotificationContent( //simgple notification
                            id: 123,
                            channelKey: 'basic', //set configuration wuth key "basic"
                            title: 'Welcome to FlutterCampus.com',
                            body: 'This simple notification is from Flutter App',
                            payload: {"name":"FlutterCampus"}
                        )
                    );
                  }
                },
                child: Text("Show Notification")
            ),

            ElevatedButton(
                onPressed: () async {
                  bool isallowed = await AwesomeNotifications().isNotificationAllowed();
                  if (!isallowed) {
                    //no permission of local notification
                    AwesomeNotifications().requestPermissionToSendNotifications();
                  }else{
                    //show notification
                    AwesomeNotifications().createNotification(
                        content: NotificationContent( //with asset image
                            id: 1234,
                            channelKey: 'image',
                            title: 'Simple Notification With Image',
                            body: 'This simple notification is from Flutter App',
                            bigPicture: 'asset://assets/images/elephant.jpg',
                            notificationLayout: NotificationLayout.BigPicture,
                            fullScreenIntent: true, //it will display over app
                            locked: true,
                            payload: {"id":"1234"}

                        )
                    );
                  }
                },
                child: Text("Show Notification With Asset Image")
            ),

            ElevatedButton(
                onPressed: () async {
                  bool isallowed = await AwesomeNotifications().isNotificationAllowed();
                  if (!isallowed) {
                    //no permission of local notification
                    AwesomeNotifications().requestPermissionToSendNotifications();
                  }else{
                    //show notification
                    AwesomeNotifications().createNotification(
                        content: NotificationContent( //with image from URL
                            id: 12345,
                            channelKey: 'image',
                            title: 'Simple Notification with Network Image',
                            body: 'This simple notification is from Flutter App',
                            bigPicture: 'https://www.fluttercampus.com/img/logo_small.webp',
                            notificationLayout: NotificationLayout.BigPicture,
                            payload: {"id":"12345"}
                        )
                    );
                  }
                },
                child: Text("Show Notification With Image From URL")
            ),

            ElevatedButton(
                onPressed: (){
                  AwesomeNotifications().dismiss(123);
                },
                child: Text("Cancel Notification")
            ),

            ElevatedButton(
                onPressed: (){
                  AwesomeNotifications().dismissAllNotifications();
                },
                child: Text("Cancel All Notifications")
            ),
          ],
        ),
      ),
    );
  }
}