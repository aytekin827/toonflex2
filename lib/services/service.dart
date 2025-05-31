import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/webtoon_model.dart';

class ApiService {
  static const String _baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev/';
  static const String _today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$_baseUrl$_today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Exception('Failed to load data');
  }

  static Future<WebtoonDetailModel> getWebtoonById(String id) async {
    final url = Uri.parse('$_baseUrl$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> webtoons = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoons);
    }
    throw Exception('Failed to load data');
  }

  static Future<List<EpisodeModel>> getEpisodesById(String id) async {
    List<EpisodeModel> episodeInstances = [];
    final url = Uri.parse('$_baseUrl$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        final toon = EpisodeModel.fromJson(episode);
        episodeInstances.add(toon);
      }
      return episodeInstances;
    }
    throw Exception('Failed to load data');
  }
}
