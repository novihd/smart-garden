import 'dart:async';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_garden_sartika/model/data_model.dart';
import 'package:smart_garden_sartika/service/api_service.dart';

class AirHumidityPage extends StatefulWidget {
  const AirHumidityPage({Key? key}) : super(key: key);

  @override
  State<AirHumidityPage> createState() => _AirHumidityPageState();
}

class _AirHumidityPageState extends State<AirHumidityPage> {
  String message = "";
  Timer? _timer;
  List<charts.Series<Curva, String>> _seriesLineData = [];
  List<DataModel> _listDataModel = [];
  List<Curva> _listDataCurva = [];

  void getDataAirHum() {
    ApiServices.getData("log").then((value) {
      setState(() {
        var data = value as List;
        _listDataModel = data.map((e) => DataModel.fromJson(e)).toList();

        _listDataCurva.add(Curva(
            DateFormat('HH:mm').format(
                DateTime.parse(_listDataModel.last.timestamp.toString())),
            _listDataModel.last.airHum!));
        if (_listDataCurva.length > 15) {
          _listDataCurva.remove(_listDataCurva.first);
          debugPrint("hapus ");
        }
        debugPrint("_listDataCurva length ${_listDataCurva.length}");

        _seriesLineData.add(
          charts.Series(
            colorFn: (__, _) =>
                charts.ColorUtil.fromDartColor(Color(0xff990099)),
            id: 'Soil Moisture',
            data: _listDataCurva,
            domainFn: (Curva curvas, _) => curvas.time,
            measureFn: (Curva curvas, _) => curvas.hum,
          ),
        );
        debugPrint("aaaaaa ${_listDataCurva.last.hum.toString()}");
        debugPrint("bbbb ${_listDataModel.last.timestamp.toString()}");
        // }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataAirHum();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) => getDataAirHum());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7c3feb),
        title: Text(
          "Air Humidity",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  width: 200,
                  height: 200,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            _listDataModel.length == 0
                                ? "0%"
                                : "${_listDataModel.last.airHum.toString()}%",
                            style: TextStyle(
                                color: Color(0xff6a23eb),
                                fontSize: 36,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          width: 200,
                          child: CircularProgressIndicator(
                            strokeWidth: 17,
                            color: Color(0xff6a23eb),
                            backgroundColor: Color(0xffc8b4ed),
                            value: 10 / 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 32, left: 20),
                  child: Text(
                      "Air Humidity: ${_listDataModel.length == 0 ? "0%" : "${_listDataModel.last.airHum.toString()}%"}",
                      style: TextStyle(
                        color: Color(0xff7c3feb),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ))),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            child: charts.OrdinalComboChart(_seriesLineData,
                                animate: true,
                                animationDuration: Duration(seconds: 1),
                                defaultRenderer: charts.LineRendererConfig())),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Curva {
  String time;
  int hum;

  Curva(this.time, this.hum);
}
