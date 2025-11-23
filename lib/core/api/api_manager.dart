import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:islami/main_layout/radio/models/radio_model.dart';
import 'package:islami/main_layout/radio/models/reciters_model.dart';

abstract class ApiManager {
  static const String baseUrl = "https://mp3quran.net/api/v3/";
  static const String radioEndPoint = "radios?language=ar";
  static const String recitersEndPoint = "reciters?language=ar";

  static Future<RadioModel> getRadios() async {
    try {
      Uri url = Uri.parse(baseUrl + radioEndPoint);
      Response response = await get(url);
      final json = jsonDecode(response.body);
      RadioModel radioModel = RadioModel.fromJson(json);
      return radioModel;
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  static Future<RecitersModel> getReciters() async {
    try {
      Uri url = Uri.parse(baseUrl + recitersEndPoint);
      Response response = await get(url);
      final json = jsonDecode(response.body);
      RecitersModel recitersModel = RecitersModel.fromJson(json);
      return recitersModel;
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }
}
