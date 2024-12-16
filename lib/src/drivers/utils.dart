import 'dart:convert';
import 'dart:typed_data';

Uint8List utf8ToBytes(String value) {
  return Uint8List.fromList(utf8.encode(value));
}

Uint8List i32ToBytes(int value) {
  final byteData = ByteData(4);
  byteData.setInt32(0, value, Endian.little);
  return byteData.buffer.asUint8List();
}

Uint8List i64ToBytes(int value) {
  final byteData = ByteData(8);
  byteData.setInt64(0, value, Endian.little);
  return byteData.buffer.asUint8List();
}

Uint8List i16ToBytes(int value) {
  final byteData = ByteData(2);
  byteData.setInt16(0, value, Endian.little);
  return byteData.buffer.asUint8List();
}