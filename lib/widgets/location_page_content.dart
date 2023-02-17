import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screens/city_screen.dart';

import '../service/weather.dart';

class LocationPageContent extends StatefulWidget {
  final location;

  const LocationPageContent({Key? key, this.location}) : super(key: key);

  @override
  State<LocationPageContent> createState() => _LocationPageContentState();
}

class _LocationPageContentState extends State<LocationPageContent> {
  late int temp;
  late String weatherImg;
  late String cityName;
  late String countryName;
  late int windDegree;
  late int windSpeed;
  late int humidity;
  late Weather weather;

  @override
  void initState() {
    super.initState();
    weather = Weather();
    updateUi(widget.location);
  }

  updateUi(dynamic weather) {
    setState(() {
      temp = weather['current']['temperature'];
      weatherImg = weather['current']['weather_icons'][0];
      cityName = weather['location']['name'];
      countryName = weather['location']['country'];
      windDegree = weather['current']['wind_degree'];
      windSpeed = weather['current']['wind_speed'];
      humidity = weather['current']['humidity'];
    });
  }

  _getNewUserLocation() async {
    final newWeather = await weather.getUserLocation();
    updateUi(newWeather);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(weatherImg),
              radius: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              " ${temp.toString()}°",
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              cityName,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w300)),
            ),
            Text(
              countryName,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w300)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.speed_outlined),
                        Text(
                          "${windDegree.toString()} km/h",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.wind_power),
                        Text(
                          '$windSpeed%',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.water_drop),
                        Text(
                          '$humidity%',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Today',
                          style: GoogleFonts.inter(fontSize: 20),
                        ),
                        Text(
                          DateFormatter.formatDateTime(
                              dateTime: DateTime.now(),
                              outputFormat: 'dd/MM'),
                          style: GoogleFonts.inter(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Image.asset('assets/dayline.png')),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white12)),
                    onPressed: () async {
                      String city = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CityScreen()));
                      setState(() async {
                        var data = await weather.searchCityWithName(city);
                        updateUi(data);
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        Text(
                          'Search City',
                          style: GoogleFonts.inter(fontSize: 24),
                        )
                      ],
                    )),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _getNewUserLocation();
                    });
                  },
                  child: const Icon(
                    Icons.navigation,
                    size: 50,
                    shadows: [Shadow(color: Colors.white, blurRadius: 50)],
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
