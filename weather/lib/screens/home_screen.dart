import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http show get;
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Position? position;

  double? longitude;
  double? latitude;

  @override
  void initState() {
    //called when object is inserted into the widget tree
    // called first

    super.initState();

    // _getLocation().then((positionData) {
    //   position = positionData;
    //   setState(() {});
    // }).catchError(
    //   (err) => print(err),
    // );
    _getServiceLocationData();
  }

  @override
  void dispose() {
    // this is when the object is removed from the tree permanently
    super.dispose();
  }

  @override
  void deactivate() {
    //this is called when this object is removed from widget tree
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    // called 2nd
    // this could potentially be called in every frame
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100,
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     TextButton(
        //       onPressed: () {
        //         // test();
        //         // _getServiceLocation();
        //         _getData();
        //       },
        //       child: Text("Get Location"),
        //     ),
        //     // if (position != null)
        //     if (latitude != null && longitude != null)
        //       Text(
        //         "Latitude: ${latitude}, Longitude: ${longitude}",
        //         textAlign: TextAlign.center,
        //       )
        //   ],
        // ),
      ),
    );
  }

  Future<void> _getData() async {
    final apiKey = "b192b4353d08916ac52e790c7f51c077";
    final authority = "api.openweathermap.org";
    final unencodedPath = "/data/2.5/weather";
    final Map<String, String> queryParams = {
      "lat": latitude.toString(),
      "lon": longitude.toString(),
      "appid": apiKey,
    };

    final url = Uri.https(authority, unencodedPath, queryParams);

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw HttpException("Bad request");
      }
      print("response: $response");
      print(response.body);
      print(response.statusCode);

      final double longitudeResponse =
          jsonDecode(response.body)["coord"]["lon"];

      // print("this is longitudeResponse $longitudeResponse");

      final wholeBodyResponse = jsonDecode(response.body);

      // print(wholeBodyResponse["coord"]);
      //
      // print("this is whole body repsonse: $wholeBodyResponse");

      final double temp = wholeBodyResponse["main"]["temp"];
      final int conditionId = wholeBodyResponse["weather"][0]["id"];
      final String city = wholeBodyResponse["name"];

      print("this is temp: $temp");
      print("this is condition id: $conditionId");
      print("this is city: $city");
    } on HttpException {
      print("http error stuff");
    } catch (e) {
      print("general error");
    }
  }

  Future<void> _getServiceLocationData() async {
    final locationObject = Location();
    await locationObject.getCurrentPosition();

    setState(() {
      longitude = locationObject.longitude;
      latitude = locationObject.latitude;
    });

    // _getData();
    final apiKey = "b192b4353d08916ac52e790c7f51c077";
    final authority = "api.openweathermap.org";
    final unencodedPath = "/data/2.5/weather";
    final Map<String, String> queryParams = {
      "lat": latitude.toString(),
      "lon": longitude.toString(),
      "appid": apiKey,
    };

    final url = Uri.https(authority, unencodedPath, queryParams);

    final NetworkHelper networkHelper = NetworkHelper(url);

    final data = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen();
        },
      ),
    );
  }

  // Future<Position> _getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   try {
  //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //
  //     if (!serviceEnabled) {
  //       //TODO do this if caller handles the error
  //       // return Future.error("Location services are disabled");
  //       throw LocationServiceDisabledException();
  //     }
  //
  //     permission = await Geolocator.checkPermission();
  //     print("we are here");
  //
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //     }
  //
  //     if (permission == LocationPermission.deniedForever ||
  //         permission == LocationPermission.denied) {
  //       throw PermissionDeniedException("Permission denied");
  //     }
  //
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );
  //
  //     print("this is position: $position");
  //
  //     return position;
  //   } on LocationServiceDisabledException catch (e) {
  //     print("this is some error: ${e.toString()}");
  //     rethrow;
  //   } on PermissionDeniedException catch (e) {
  //     print("this is some error: ${e.toString()}");
  //     rethrow;
  //   }
  // }
}
