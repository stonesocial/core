(List<R>, bool) prepareBcLazyDataQuery<T, R>({
  required int page,
  required int limit,
  required List<T> data,
  required R Function(T) mapper
}) {
  final start = (page - 1) * limit;
  final calculatedEnd = page * limit;
  final end = data.length >= calculatedEnd ? calculatedEnd : data.length;
  final dataQuery = data.map(mapper).toList().getRange(start, end).toList();

  return (dataQuery, data.length >= calculatedEnd);
}