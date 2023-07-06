import 'package:flutter/material.dart';

import '../models/content.dart';

class Preview extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Preview({Key? key, required this.title, required this.contentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          height: 165,
          child: ListView.builder(
              itemCount: contentList.length,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Content conetnt = contentList[index];
                return GestureDetector(
                  onTap: () => print(conetnt.name),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 13),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(conetnt.imageUrl),
                              fit: BoxFit.fill),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
