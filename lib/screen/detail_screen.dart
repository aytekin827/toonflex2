import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id, about, genre, age;
  const DetailScreen({super.key, required this.title, required this.thumb, required this.id, required this.about, required this.genre, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: id,
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
                          thumb,
                          headers: const {
                            'Referer': 'https://comic.naver.com',
                            'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'
                            },
                          ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            about,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            genre,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            age,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
