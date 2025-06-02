import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/webtoon_model.dart';

class EpisodeScreen extends StatelessWidget {

  const EpisodeScreen({
    super.key,
    required this.episode,
    required this.webtoon_id,
  });

  final EpisodeModel episode;
  final String webtoon_id;

  Future<void> onButtonTap() async {

    final url = 'https://comic.naver.com/webtoon/detail?titleId=$webtoon_id&no=${episode.id}';
    await launchUrlString(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap, 
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(3, 3),
              ),
              ],
              ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
            ),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(episode.title, style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w600),),
                        ),
                        Icon(Icons.chevron_right_rounded, color: Colors.green,),
                      ],
          ),
        ),
      ),
    );
  }
}
