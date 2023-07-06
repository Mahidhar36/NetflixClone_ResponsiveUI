import 'package:flutter/material.dart';
import 'package:web_app/responsive_ui.dart';

import '../assets.dart';


class CustomAppBar extends StatefulWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset=0.0}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black.withOpacity((widget.scrollOffset/350).clamp(0,1).toDouble()),
      child: Responsive(
        mobile: CustomAppBarMobile(),
        desktop: CustomAppBarDesktop(),
      )
    );
  }
}
class Appbarbutton extends StatelessWidget {
  final String title;
  final Function ontap;
  const Appbarbutton({Key? key, required this.title, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>ontap,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.w600),
      ),
    );
  }

}
class CustomAppBarMobile extends StatelessWidget {
  const CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom:10.0),
        child: Row(

            children: [
              Image.asset("lib/assets/netflix_logo0.png"),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Appbarbutton(title: "TV Shows", ontap: ()=> print("TV shows")),

                      Appbarbutton(title: "Movies", ontap:()=> print("Movies")),


                      Appbarbutton(title: "My List", ontap:()=> print("My List")),
                    ]),
              )
            ]),
      ),
    );
  }
}
class CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Appbarbutton(
                  title: 'Home',
                  ontap: () => print('Home'),
                ),
            Appbarbutton(
                  title: 'TV Shows',
                  ontap: () => print('TV Shows'),
                ),
                Appbarbutton(
                  title: 'Movies',
                  ontap: () => print('Movies'),
                ),
                Appbarbutton(
                  title: 'Latest',
                  ontap: () => print('Latest'),
                ),
                Appbarbutton(
                  title: 'My List',
                  ontap: () => print('My List'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search),
                  iconSize: 25.0,
                  color: Colors.white,
                  onPressed: () => print('Search'),
                ),
                Appbarbutton(
                  title: 'KIDS',
                  ontap: () => print('KIDS'),
                ),
                Appbarbutton(
                  title: 'DVD',
                  ontap: () => print('DVD'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 25.0,
                  color: Colors.white,
                  onPressed: () => print('Gift'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications),
                  iconSize: 25.0,
                  color: Colors.white,
                  onPressed: () => print('Notifications'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
