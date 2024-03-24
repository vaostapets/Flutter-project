import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:Mental_Health/Models/keys.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';


}