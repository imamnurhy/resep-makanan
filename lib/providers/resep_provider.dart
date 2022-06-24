import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:resep/models/resep_detail_model.dart';
import 'package:resep/models/reseps_model.dart';
import 'package:resep/service/resep_service.dart';

class ResepProvider extends ChangeNotifier {
  ResepProvider() {
    getListResep();
  }

  final ResepService _resepService = ResepService();
  ResepsModel? resepModel;
  ResepDetailModel? resepDetailModel;

  getListResep() async {
    resepModel = await _resepService.getListResep();
    notifyListeners();
  }

  getDetailResep(String key) async {
    resepDetailModel = await _resepService.getDetailResep(key);
    notifyListeners();
  }
}
