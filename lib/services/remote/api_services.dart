import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/api_data.dart';

class ApiServices {
  static Future<List<DataModel>> fetchProgramsData() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['items'];
      return responseData.map((json) => DataModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<DataModel>> fetchLessonsData() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['items'];
      // print('API Response Body: ${response.body}');
      return responseData.map((json) => DataModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
