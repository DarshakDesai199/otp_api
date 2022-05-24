import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class OtpServices {
  static Future<bool?> registerOtpPost(Map<String, dynamic> reqData) async {
    var header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    http.Response response = await http.post(
        Uri.parse(
            "http://scprojects.in.net/projects/skoolmonk/api_/otp/validate/0"),
        body: reqData,
        headers: header);

    // print("${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      log(
        jsonDecode(response.body),
      );
      return true;
    } else {
      return null;
    }
  }

  static Future<bool?> getOtp(Map<String, dynamic> reqData) async {
    var header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    http.Response response = await http.post(
        Uri.parse(
            "http://scprojects.in.net/projects/skoolmonk/api_/otp/validate/1"),
        body: reqData,
        headers: header);
    var result = jsonDecode(response.body);
    print("${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      return result;
    } else {
      return null;
    }
  }
}
