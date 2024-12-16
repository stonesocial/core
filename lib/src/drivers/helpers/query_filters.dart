import 'package:dependencies/dependencies.dart';

class QueryFilters {
  final int? page;
  final int? limit;
  final String? key;

  const QueryFilters({
    this.page,
    this.limit,
    this.key = Strings.empty,
  });

  String lazyGet() {
    if (page != null && limit != null) {
      return "?page=$page&limit=$limit";
    }

    return Strings.empty;
  }
}