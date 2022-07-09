class DataModel {
  int? id;
  int? airTemp;
  int? airHum;
  int? soilTemp;
  int? soilHum;
  String? timestamp;

  DataModel(
      {this.id,
      this.airTemp,
      this.airHum,
      this.soilTemp,
      this.soilHum,
      this.timestamp});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    airTemp = json['air_temp'];
    airHum = json['air_hum'];
    soilTemp = json['soil_temp'];
    soilHum = json['soil_hum'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['air_temp'] = this.airTemp;
    data['air_hum'] = this.airHum;
    data['soil_temp'] = this.soilTemp;
    data['soil_hum'] = this.soilHum;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
