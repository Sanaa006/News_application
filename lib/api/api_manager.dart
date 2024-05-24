import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/api/api_constant.dart';
import 'package:news_application/model/NewsResponse.dart';

import '../model/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse?> getSources(String categoryId) async {
    ///https://newsapi.org/v2/top-headlines/sources?apiKey=f61c64c98c894852afb43e35b5e9bf4d
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi,
        {'apiKey': 'f61c64c98c894852afb43e35b5e9bf4d', 'category': categoryId});
    try {
      var response = await http.get(url);
      var responseBady = response.body; //string
      var json = jsonDecode(responseBady); //json
      return SourcesResponse.fromJson(json); // json => object
    } catch (e) {
      throw e;
    }
  }

  /*
  * https://newsapi.org/v2/everything?q=bitcoin&apiKey=f61c64c98c894852afb43e35b5e9bf4d */
  static Future<NewsResponse>? getNewsBySources(String sourceId,int page) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {"apiKey": "f61c64c98c894852afb43e35b5e9bf4d", 'sources': sourceId,"page":page.toString()});
    try {
      var responses = await http.get(url);
      var badyResponse = responses.body;
      var json = jsonDecode(badyResponse);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw (e);
    }
  }

  static Future<NewsResponse?>? getNewsForSearch(String keywordSearch) async {
    if (keywordSearch.isEmpty) {
      return null;
    }
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {"apiKey": "f61c64c98c894852afb43e35b5e9bf4d", 'q': keywordSearch});
    try {
      var responses = await http.get(url);
      var badyResponse = responses.body;
      var json = jsonDecode(badyResponse);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw (e);
    }
  }
}
