
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState()=> _LocationAppState();
}

class _LocationAppState extends State<LocationApp>{
  var locationMessage ="";



  void getCurrentLocation() async{
  var position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  var lastPosition = await Geolocator().getLastKnownPosition();
  print(lastPosition);

  var locationLatitude = - position.latitude;
  var locationLongitude = - position.longitude;

  print(locationLongitude);
  print(locationLatitude);

  setState(() {
    locationMessage = "$position";
   // locationLongitude = "$locationLatitude";
   // locationLatitude = "$locationLongitude";
  });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Wize Location Services"),
        centerTitle: true ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 46.0,
              color: Colors.blue,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Get Box Location", style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0 ,
            ),
            Text(locationMessage),
            FlatButton(
              onPressed: () {
                getCurrentLocation();
              },
                color: Colors.blue[800],
                child: Text("Get Current Location",
                  style: TextStyle(
                    color: Colors.white,),
                )
            )
          ],
        ),
      ),
    );
  }
}