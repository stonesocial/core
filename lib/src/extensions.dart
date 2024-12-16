import 'dart:typed_data';

extension Base58ToId on String {
  String toId() =>
      '${substring(0, 3)}'
      '${substring(6, 9)}'
      '${substring(12, 15)}'
      '${substring(24, 27)}';
}

extension QNSplitter on String {
  String get avatarCid => split('/').last;
}

extension AddrFormatter on String {
  String get shortAddress {
    return '${substring(0, 8)}******${substring(length - 4, length)}';
  }
  String get veryShortAddress {
    return '${substring(0, 5)}*****${substring(length - 3, length)}';
  }
  String get shortTxID {
    return '${substring(0, 3)}***${substring(length - 2, length)}';
  }
  String get blockHash => substring(0, 8);
}

extension I64 on int {
  int toi64() {
    final bytes = Uint8List(8);
    final dataView = ByteData.view(bytes.buffer);
    dataView.setInt64(0, toUnsigned(64).toInt(), Endian.little);

    return ByteData.view(bytes.buffer).getInt64(0, Endian.little);
  }
}

extension AbbreviateNumber on int {
  String get abbreviateNumber {
    if (this >= 1e6) {
      return "${(this / 1e6).toStringAsFixed(1)}M";
    } else if (this >= 1e3) {
      return "${(this / 1e3).toStringAsFixed(1)}k";
    } else {
      return toString();
    }
  }
}