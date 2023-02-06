import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import 'my_playlist.dart';
import 'other_playlist.dart';

class PlayLists extends StatefulWidget {
  const PlayLists({super.key});

  @override
  State<PlayLists> createState() => _PlayListsState();
}

class _PlayListsState extends State<PlayLists> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: HexColor('#F1F4FB'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const NavBar(),
                Header(onTap: () {
                  _key.currentState!.openDrawer();
                })
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currentIndex == 0 ? const Color(0xffFFC107) : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'My Playlist',
                          style: TextStyle(
                              fontSize: 16,
                              color: currentIndex == 0 ? const Color(0xffFFC107) : const Color(0xff7D8CAC)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currentIndex == 1 ? const Color(0xffFFC107) : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Other Playlists',
                          style: TextStyle(
                              fontSize: 16,
                              color: currentIndex == 1 ? const Color(0xffFFC107) : const Color(0xff7D8CAC)),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Container(
                      height: 45,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffC8D1E5),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                        child: Icon(Icons.search, color: Colors.white),
                      ))
                ],
              ),
            ),
            currentIndex == 0?  const Expanded(
                child: MyPlaylist()):Container(),
            currentIndex == 1?  const Expanded(
                child: OtherPlayList()):Container(),
            // const SecondaryFooter(),
            // const AppFooter()

          ],


        ),
      ),
    );
  }
}
