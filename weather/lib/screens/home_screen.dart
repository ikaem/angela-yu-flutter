import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weather = WeatherModel();

  @override
  void initState() {
    super.initState();

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
      ),
    );
  }

  Future<void> _getServiceLocationData() async {
    final data = await weather.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: data);
        },
      ),
    );
  }
}
