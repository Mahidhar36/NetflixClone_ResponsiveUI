import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:web_app/widgets/playbutton.dart';
import 'package:web_app/responsive_ui.dart';

import '../models/content.dart';

class ContentHeader extends StatefulWidget {
  final Content featuredContent;

  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<ContentHeader> createState() => _ContentHeaderState();
}

class _ContentHeaderState extends State<ContentHeader> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: CustomMobileHeader(
          featuredContent: widget.featuredContent,
        ),
        desktop: CustomDesktopHeader(featuredContent: widget.featuredContent));
  }
}

class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function ontap;

  const VerticalIconButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class CustomMobileHeader extends StatefulWidget {
  final Content featuredContent;

  CustomMobileHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<CustomMobileHeader> createState() => _CustomMobileHeaderState();
}

class _CustomMobileHeaderState extends State<CustomMobileHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.black, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
        ),
        Positioned(
            bottom: 110,
            child: SizedBox(
              width: 250,
              child:
                  Image.asset(widget.featuredContent.titleImageUrl.toString()),
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add,
                  title: "My List",
                  ontap: () => print("MYList")),
              PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "Info",
                  ontap: () => print("Info")),
            ],
          ),
        )
      ],
    );
  }
}

class CustomDesktopHeader extends StatefulWidget {
  final Content featuredContent;

  CustomDesktopHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<CustomDesktopHeader> createState() => _CustomDesktopHeaderState();
}

class _CustomDesktopHeaderState extends State<CustomDesktopHeader> {
  VideoPlayerController? videoPlayerController;
  bool ismuted = false;

  @override
  void initState() {
    // TODO: implement initState
    videoPlayerController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((_) => setState(() {}))
          ..play();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => videoPlayerController!.value.isPlaying
          ? videoPlayerController!.pause()
          : videoPlayerController!.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: videoPlayerController!.value.isInitialized
                ? videoPlayerController!.value.aspectRatio
                : 2.344,
            child: videoPlayerController!.value.isInitialized
                ? VideoPlayer(videoPlayerController!)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Container(
            height: 500.0,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: videoPlayerController!.value.isInitialized
                  ? videoPlayerController!.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.featuredContent.description.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    PlayButton(),
                    const SizedBox(width: 16.0),
                    TextButton.icon(
                      onPressed: () => print('More Info'),
                      icon: const Icon(Icons.info_outline, size: 30.0),
                      label: const Text(
                        'More Info',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    if (videoPlayerController!.value.isInitialized)
                      IconButton(
                        icon: Icon(
                          ismuted ? Icons.volume_off : Icons.volume_up,
                        ),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: () => setState(() {
                          ismuted
                              ? videoPlayerController!.setVolume(100)
                              : videoPlayerController!.setVolume(0);
                          ismuted = videoPlayerController!.value.volume == 0;
                        }),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
