// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'package:http/http.dart' as http;

class Networking {
  Networking({this.Url});

  String? Url;
  Future getweatherdata() async {
    http.Response response = await http.get(Uri.parse(Url!));
    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode;
    }
  }
}
