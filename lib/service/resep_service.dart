import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resep/models/reseps_model.dart';

class ResepService {
  Future<ResepsModel> getListResep() async {
    try {
      final response = await http.get(Uri.parse('https://masak-apa-tomorisakura.vercel.app/api/recipes'));
      return ResepsModel.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
