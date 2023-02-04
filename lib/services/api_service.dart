import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  /*
  `/today` : Returns today's comics
  `/:id` : Returns a comic's information by `:id`
  `/:id/episodes: Returns the latest episodes for a comic by `:id`
  */
  static const String today = "today";

  // 웹툰 리스트
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    // URL 생성
    final response = await http.get(url);
    // 해당 URL을 request

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      // String Type인 response.body를 json으로 바꿔줌.
      // jsonDecode : Json으로 바꿔주는 함수
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        // json을 constructor로 전달 하여 객체화
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  /// 선택한 웹툰
  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  /// 선택한 웹툰의 에피소드 리스트
  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
