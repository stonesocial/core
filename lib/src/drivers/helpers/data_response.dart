class DataResponse<T> {
  final int statusCode;
  final String? message;
  final String? hash;
  final T data;
  final int? count;
  final int? offset;
  final int? limit;

  const DataResponse({
    required this.statusCode,
    this.message,
    this.hash,
    required this.data,
    this.count,
    this.offset,
    this.limit,
  });

  Map<String, dynamic> toMap(List data) {
    return {
      'statusCode': statusCode,
      'message': message,
      'hash': hash,
      'data': data,
      'count': count,
      'offset': offset,
      'limit': limit,
    };
  }

  factory DataResponse.fromMap(Map<String, dynamic> json, T data) {
    return DataResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      hash: json['hash'],
      data: data,
      count: json['count'],
      offset: json['offset'],
      limit: json['limit'],
    );
  }
}