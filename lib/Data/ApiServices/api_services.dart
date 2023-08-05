import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class Api {
  static Map<String, String> _authMiddleWare() {
 //   UserData? us = SharedPrefs.getUserLoginData();
    // print(us?.token);
    return {
      "Authorization": "Bearer #token",
      'Content-Type': 'application/json',
      //'Content-Type': 'application/json'
    };
  }

  static Future<Map<String, dynamic>> get(String url,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {
        "success": false,
        "error": res.body,
        "body": null
      };
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body,
      {Map<String, String>? header}) async {
    try {
      // final headers = {'Content-Type': 'application/json'};

      http.Response res = await http.post(
        Uri.parse(url),
        headers: header ?? _authMiddleWare(),
        body: jsonEncode(body),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": res.body
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> postMultipart(
      String url, Map<String, dynamic> body, List<String?> filesPath,
      {Map<String, String>? header,String? requestMethod,String? imagePathName} ) async {
    try {
        print("here2");
  //    UserData? us = SharedPrefs.getUserLoginData();
     //  print(us?.token);
       // print(us?.user.id);
 //     final headers = {'authorization': 'Bearer ${us!.token}'};
      var request = http.MultipartRequest(requestMethod??'POST', Uri.parse(url));
      //request.fields.addAll(body);

      for (var str in body.entries) {

        if(str.value!=null) {
          if(str.value.runtimeType is bool || str.key.runtimeType is bool)
            {
              print("herewe");
              request.fields[str.key.toString()] = str.value.toString();
            }
          else {
            request.fields[str.key] = str.value;
          }
          print(str.key);
        }
      }
      // request.fields.addEntries(body.entries);

      //request.headers.addAll(headers);
      for (String? e in filesPath) {
        //print(e);
        request.files.add(await http.MultipartFile.fromPath(imagePathName ??'files', e!));
      }

      http.StreamedResponse res = await request.send();
      // print(res.statusCode.toString() +"status code");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode =
            jsonDecode(await res.stream.bytesToString());
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }


  static Future<Map<String, dynamic>> postMultipart2(
      String url, Map<String, dynamic> body, List<String?> filesPath,
      {Map<String, String>? header,String? requestMethod,String? imagePathName} ) async {
    try {
 //     print("here2");
     // UserData? us = SharedPrefs.getUserLoginData();

      //final headers = {'authorization': 'Bearer ${us!.token}'};
      var request = http.MultipartRequest(requestMethod??'POST', Uri.parse(url));
      //request.fields.addAll(body);
print(body);
      for (var str in body.entries) {

        if(str.value!=null) {
          if(str.value.runtimeType is bool || str.key.runtimeType is bool)
          {
           // print("herewe");
            request.fields[str.key.toString()] = str.value.toString();
          }
          else {
            request.fields[str.key] = str.value;
          }
          print(str.key);
        }
      }
      // request.fields.addEntries(body.entries);

     // request.headers.addAll(headers);
      for (String? e in filesPath) {
        //print(e);
        request.files.add(await http.MultipartFile.fromPath(imagePathName ??'files', e!));
      }

      http.StreamedResponse res = await request.send();
      // print(res.statusCode.toString() +"status code");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode =
        jsonDecode(await res.stream.bytesToString());
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> post1(
    Map<String, dynamic> body, {
    required String url,
  }) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Failed to sign up user');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    try {
      //print(body);
      http.Response res = await http.put(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
        body: jsonEncode(body),
        //encoding: Encoding.getByName("application/x-www-form-urlencoded")
      );



      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> delete(String url, String id,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("$url/$id"),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }
}
