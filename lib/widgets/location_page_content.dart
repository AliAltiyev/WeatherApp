import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void initState() {
    super.initState();
    updateUi(widget.location);
  }

  updateUi(dynamic weather) {
    temp = weather['current']['temperature'];
    weatherImg = weather['current']['weather_icons'][0];
    cityName = weather['location']['name'];
    countryName = weather['location']['country'];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(weatherImg),
                radius: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " ${temp.toString()}°",
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
              ),
              SizedBox(height: 20,),
              Text(
                cityName,
                style: GoogleFonts.inter(
                    textStyle:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w300)),
              ),
              Text(
               countryName,
                style: GoogleFonts.inter(
                    textStyle:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w300)),
              )

            ],
          ),
        )
      ],
    );
  }
}
