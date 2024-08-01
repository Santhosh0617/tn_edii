import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/utilities/message.dart';

extension ResponseExtension on ResponseData {
  bool get hasError {
    int statusCode = this.statusCode;
    if (statusCode == 200 || statusCode == 201) {
      return false;
    }
    if (statusCode == 401) return true;
    String errMsg = data['message'] ?? data['error'] ?? '';
    if (errMsg.isNotEmpty) showMessage(errMsg);
    return true;
  }
}
