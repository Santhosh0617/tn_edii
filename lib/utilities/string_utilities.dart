import 'package:tn_edii/constants/app_strings.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class StringUtils {


  static String toPdfUrl(String value, String subFolder) {
    if (value.isEmptyOrNull) return '';
    return '${AppStrings.imgUrl}$subFolder$value';
  }

  static bool isEmptyOrNull(String val) {
    return val == 'null' || val.trim().isEmpty;
  }
 

 

 


}