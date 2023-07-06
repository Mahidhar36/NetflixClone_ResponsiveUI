


import 'package:flutter/material.dart';
import 'package:web_app/widgets/customlist.dart';
import 'package:web_app/data.dart';
import 'package:web_app/widgets/preview.dart';

import '../widgets/contentHeader.dart';
import '../widgets/customappbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double scrolloffset=0.0;
     ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController=ScrollController()..addListener(() {
      setState(() {
        scrolloffset=_scrollController!.offset;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screensize=MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.cast),
        onPressed: ()=> print("cast"),

      ),
      appBar: PreferredSize(
        preferredSize: Size(screensize.width, 50), child: CustomAppBar(scrollOffset: scrolloffset,),
      ),
        body: CustomScrollView(controller: _scrollController,
        slivers:  const [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent:sintelContent)
          ),
          SliverPadding(padding: const EdgeInsets.only(top:20.0),
              key: PageStorageKey("mylist"),
              sliver:SliverToBoxAdapter(
                child:Preview(
                  title:"My List",
                  contentList :myList
                )


              )
          ),
          SliverToBoxAdapter(
            key: PageStorageKey("originals"),
              child:ContentList(
                  title:"Netflix Originals",
                  isoriginals:true,
                 content: originals,
              )


          ),
          SliverToBoxAdapter(
            key: PageStorageKey("trending"),
              child:Preview(
                  title:"Trending",
                  contentList :trending
              )


          ),
          SliverPadding(
            key: PageStorageKey("previews"),
            padding: EdgeInsets.only(bottom:20.0),
            sliver: SliverToBoxAdapter(
                child:Preview(
                    title:"Previews",
                    contentList :previews
                )


            ),
          )

        ],),
    );
  }

}
