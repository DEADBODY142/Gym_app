import 'dart:convert';
import 'package:flutter_application_1/Model/profiles.dart';
import 'package:http/http.dart' as http;
import '../Model/quote.dart';

class ApiService {
  final url = 'http://localhost:3000';
  Future<List<Quote>> fetchQuote() async {
    final url = 'https://api.api-ninjas.com/v1/quotes/';
    final apiKey = "F8r6fMEloLPXFzFeNEcIcw==pB6GZdKgrBVxJSYj";
    final response = await http.get(
      Uri.parse(url),
      headers: {'X-Api-Key': apiKey},
    );

    // print("Response status: ${response.statusCode}");
    // print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(
        response.body,
      ); // Decoding JSON into a List
      if (data.isNotEmpty) {
        return data.map((json) => Quote.fromJson(json)).toList();
      } else {
        throw Exception('No quotes available');
      }
    } else {
      throw Exception('Failed to load quote: ${response.statusCode}');
    }
  }

  Future<List<Profiles>> fetchProfiles(int id) async {
    final profileUrl = url + '/profiles/$id';
    final response = await http.get(Uri.parse(profileUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(
        response.body,
      ); // Decoding JSON into a List

      if (data.isNotEmpty) {
        return data.map((json) => Profiles.fromJson(json)).toList();
      } else {
        throw Exception('No profiles available');
      }
    } else {
      throw Exception('Failed to load quote: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> fetchPageNumber() async {
    final pageUrl = '$url/pagesNumbers';
    final pageresponse = await http.get(Uri.parse(pageUrl));

    if (pageresponse.statusCode == 200) {
      Map<String, dynamic> pagedata = json.decode(pageresponse.body);
      if (pagedata.isNotEmpty) {
        return pagedata;
      } else {
        throw Exception('No profiles available');
      }
    }else{
      throw Exception('Failed to load page number: ${pageresponse.statusCode}');
    }
  }
}
