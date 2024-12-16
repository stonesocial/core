import 'data_response.dart';

extension HasNext on DataResponse {
  bool get hasNext {
    return ((count ?? 1) / (limit ?? 20)) > (offset ?? 1);
  }
}