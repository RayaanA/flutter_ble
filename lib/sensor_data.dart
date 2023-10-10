// sensor_data.dart

import 'dart:typed_data';
import 'dart:ffi'; // For Endian
import 'dart:convert';
class SensorData {
  DateTime timestamp;
  double accX;
  double accY;
  double accZ;
  double gyrX;
  double gyrY;
  double gyrZ;

  SensorData({
    required this.timestamp,
    required this.accX,
    required this.accY,
    required this.accZ,
    required this.gyrX,
    required this.gyrY,
    required this.gyrZ,
  });
/*
  // Factory method to create an instance from a list of integers
  factory SensorData.fromByteArray(Uint8List data) {
    // Parse the data according to your data format
    // For example, if the data format is [accX, accY, accZ, gyroX, gyroY, gyroZ],
    // where each value is a 32-bit float (4 bytes), you can do:
    final ByteData byteData = ByteData.sublistView(data);
    return SensorData(
      accX: byteData.getFloat32(0, Endian.little),
      accY: byteData.getFloat32(4, Endian.little),
      accZ: byteData.getFloat32(8, Endian.little),
      gyroX: byteData.getFloat32(12, Endian.little),
      gyroY: byteData.getFloat32(16, Endian.little),
      gyroZ: byteData.getFloat32(20, Endian.little),
    );

  }*/
  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      timestamp: DateTime.parse(json['timestamp']),
      accX: double.parse(json['acc_x']),
      accY: double.parse(json['acc_y']),
      accZ: double.parse(json['acc_z']),
      gyrX: double.parse(json['gyr_x']),
      gyrY: double.parse(json['gyr_y']),
      gyrZ: double.parse(json['gyr_z']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'acc_x': accX.toString(),
      'acc_y': accY.toString(),
      'acc_z': accZ.toString(),
      'gyr_x': gyrX.toString(),
      'gyr_y': gyrY.toString(),
      'gyr_z': gyrZ.toString(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

