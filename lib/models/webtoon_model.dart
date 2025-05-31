class WebtoonModel {
  final String title;
  final String thumb;
  final String id;

  // named constructor: fromJson
  WebtoonModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      thumb = json['thumb'],
      id = json['id'];

  // :는 initializer list (초기화 리스트) 라고 부르며, 객체가 생성될 때 필드 초기화를 먼저 처리하는 특별한 문법
}

class WebtoonDetailModel {
  final String title;
  final String about;
  final String genre;
  final String age;
  final String thumb;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      about = json['about'],
      genre = json['genre'],
      age = json['age'],
      thumb = json['thumb'];
}

class EpisodeModel {
  final String title;
  final String rating;
  final String id;
  final String date;

  EpisodeModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      rating = json['rating'],
      id = json['id'],
      date = json['date'];
}
