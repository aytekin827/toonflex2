import 'package:flutter/material.dart';
import '../models/webtoon_model.dart';
import '../services/service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id, about, genre, age;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
    required this.about,
    required this.genre,
    required this.age,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<EpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    print(widget.id);

    webtoon = ApiService.getWebtoonById(widget.id);
    episodes = ApiService.getEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
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
                    widget.thumb,
                    headers: const {
                      'Referer': 'https://comic.naver.com',
                      'User-Agent':
                          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          FutureBuilder(
            future: webtoon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data?.about ?? '',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${snapshot.data?.genre ?? ''} / ${snapshot.data?.age ?? ''}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }
              return Text('...');
            },
          ),
        ],
      ),
    );
  }
}
