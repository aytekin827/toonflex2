import 'package:flutter/material.dart';
import 'package:toonflex2/screen/detail_screen.dart';

import '../models/webtoon_model.dart';
import '../services/service.dart';

class WebtoonWidget extends StatelessWidget {
  final WebtoonModel webtoon;
  const WebtoonWidget({super.key, required this.webtoon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ApiService.getWebtoonById(webtoon.id).then((value) {
          Navigator.push( 
            context, 
            MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: webtoon.title, 
              thumb: webtoon.thumb, 
              id: webtoon.id,
              about: value.about,
              genre: value.genre,
              age: value.age,
            ),
          ),
          );
        });
      },
      child: Column(
        children: [
          Hero(
            tag: webtoon.id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(5, 5),
                    ),
                    ],
                    ),
                    child: Image.network(
                      webtoon.thumb,
                      headers: const {
                        'Referer': 'https://comic.naver.com',
                        'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'
                        },
                      ),
                    ),
          ),
          const SizedBox(height: 10),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
    );
  }
}
