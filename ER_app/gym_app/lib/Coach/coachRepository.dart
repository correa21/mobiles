import 'package:gym_app/models/coach.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:gym_app/secrets.dart';
import 'dart:convert';

class CoachRepository {
  List<Coach> listaEntrenadores;
  static final CoachRepository _coachRepository = CoachRepository._internal();
  factory CoachRepository() {
    return _coachRepository;
  }
  CoachRepository._internal();

  Future<List<Coach>> getCoachList(String query) async {
    final _uri = Uri.parse(API_KEY + query);
    try {
      var headers;
      final response = await http.get(_uri, headers: headers);
      List<dynamic> data = jsonDecode(response.body);
      listaEntrenadores =
          ((data).map((element) => Coach.fromJson(element))).toList();
      return listaEntrenadores;
    } catch (e) {
      throw "Ha ocurrrido un error $e";
    }
  }
}
