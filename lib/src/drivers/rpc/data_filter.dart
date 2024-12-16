class DataFilter {
  final int? sliceOffset;
  final int? limit;
  final int? offset;
  final int? dataSize;
  final String? key;

  DataFilter({
    this.sliceOffset,
    this.limit, 
    this.offset, 
    this.dataSize, 
    this.key,
  });
}