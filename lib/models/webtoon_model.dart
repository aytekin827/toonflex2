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