import 'package:flutter/material.dart';
import 'package:smart_garden_sartika/service/api_service.dart';
import 'package:smart_garden_sartika/view/air_humidity_page.dart';
import 'package:smart_garden_sartika/view/air_temperature_page.dart';
import 'package:smart_garden_sartika/view/soil_moisture_page.dart';
import 'package:smart_garden_sartika/view/soil_temperature_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String message = "Hello";
  void sendMessage(msg) {
    ApiServices.getData("log").then((value) {
      setState(() {
        message = value[1]["air_temp"].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.fromLTRB(20, 32, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Halo, Sartika!",
                    style: TextStyle(
                        color: Color(0xff7c3feb),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold)),
                // InkWell(
                //   onTap: () => sendMessage("Hello"),
                //   child: Text("Sartika!",
                //       style: TextStyle(
                //           color: Color(0xff7c3feb),
                //           fontSize: 20,
                //           fontFamily: 'Poppins',
                //           fontWeight: FontWeight.bold)),
                // ),
                Container(
                    child: Image.asset("assets/images/img_smartgarden.jpg")),
                const Center(
                    child: Text("Smart Garden",
                        style: TextStyle(
                            color: Color(0xff7c3feb),
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900))),
                SizedBox(height: 16),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SoilMoisturePage()));
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xffededed),
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/img_soil_moisture.png",
                                  width: 70, color: Color(0xff8e71c7)),
                              SizedBox(height: 8),
                              Text("Soil Moisture",
                                  style: TextStyle(
                                      color: Color(0xffff8e71c7),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 32),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AirHumidityPage()));
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xffededed),
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/img_air_humidity.png",
                                  width: 70, color: Color(0xff8e71c7)),
                              SizedBox(height: 8),
                              Text("Air Humidity",
                                  style: TextStyle(
                                      color: Color(0xffff8e71c7),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SoilTemperaturePage()));
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xffededed),
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/images/img_soil_temperature.png",
                                  width: 70,
                                  color: Color(0xff8e71c7)),
                              SizedBox(height: 8),
                              Text("Soil Temperature",
                                  style: TextStyle(
                                      color: Color(0xffff8e71c7),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 32),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AirTemperaturePage()));
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xffededed),
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/images/img_air_temperature.png",
                                  width: 70,
                                  color: Color(0xff8e71c7)),
                              SizedBox(height: 8),
                              Text("Air Temperature",
                                  style: TextStyle(
                                      color: Color(0xffff8e71c7),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
