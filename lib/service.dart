import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quote/quote_model.dart';
class OnlineService{
  Future<List<Quote>> getQuotes() async {
    final response = await http.get(Uri.parse("https://jsonguide.technologychannel.org/quotes.json"));
    final json=jsonDecode(response.body).cast<Map<String,dynamic>>();
    return json.map<Quote>((json)=>Quote.fromJson(json)).toList();
  }
}