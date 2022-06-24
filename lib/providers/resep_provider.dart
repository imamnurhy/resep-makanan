import 'package:flutter/material.dart';
import 'package:resep/models/reseps_model.dart';
import 'package:resep/service/resep_service.dart';

class ResepProvider extends ChangeNotifier {
  ResepProvider() {
    getListResep();
  }

  final ResepService _resepService = ResepService();
  late ResepsModel resepModel;

  getListResep() async {
    resepModel = await _resepService.getListResep();
    notifyListeners();
  }
}
