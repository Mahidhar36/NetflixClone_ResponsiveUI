import "package:flutter/material.dart";

import '../models/content.dart';

class ContentList extends StatefulWidget {
  final String title;
  final List<Content> content;
  final bool isoriginals;

  const ContentList(
      {Key? key,
      required this.title,
      required this.content,
       this.isoriginals=false })
      : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:6.0 ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          height: widget.isoriginals? 430.0:220,
          child: ListView.builder(
              itemCount: widget.content.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Content conetnt = widget.content[index];
                return GestureDetector(
                  onTap: () => print(conetnt.name),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 13),
                        height: widget.isoriginals? 400:220,
                        width: widget.isoriginals? 200:140,
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
        ),
      ]),
    );
  }
}
