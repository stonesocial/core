import 'package:dependencies/dependencies.dart';
import 'package:timeago/timeago.dart' as timeago;

extension ToDateTime on String {
  DateTime toDateTime() {
    return DateTime.parse(this);
  }
}

extension ToTimeago on DateTime {
  String toTimeago() {
    return timeago.format(this, locale: 'en_short');
  }
}

extension TimeIntl on DateTime {
  String toIntl([String? param]) {
    return DateFormat('yyyy-MM-dd${param ?? 'hh:mm:s'}').format(this);
  }
}