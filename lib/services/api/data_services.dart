import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/src/models/data_model.dart';

class DataServices {
  String baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/character';
    try {
      final res = await http.get(Uri.parse('$baseUrl$apiUrl'));

      if (res.statusCode == 200) {
        final list = json.decode(res.body);
        final List<dynamic> results = list['results'];
        // return results.map((e) => DataModel.fromJson(e)).toList();
        List<DataModel> data =
            results.map((e) => DataModel.fromJson(e)).toList();
        return data;
      } else {
        return <DataModel>[];
      }
    } catch (e, stackTrace) {
      print('Exception: $e');
      print('Stacktrace: $stackTrace');
      return <DataModel>[];
    }
  }
}
