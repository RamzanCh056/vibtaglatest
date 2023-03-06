import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class MoreStories extends StatefulWidget {
  MoreStories(this.storydata,{Key? key}) : super(key: key);

  var storydata;
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: [
          // StoryItem.text(
          //   title: "I guess you'd love to see more of our food. That's great.",
          //   backgroundColor: Colors.blue,
          // ),
          // StoryItem.text(
          //   title: "Nice!\n\nTap to continue.",
          //   backgroundColor: Colors.red,
          //   textStyle: TextStyle(
          //     fontFamily: 'Dancing',
          //     fontSize: 40,
          //   ),
          // ),

          StoryItem.pageImage(

            url: widget.storydata['thumbnail'],
            caption: "${widget.storydata['view_count']} view",
            controller: storyController,
          ),
          // StoryItem.pageImage(
          //     url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
          //     caption: "Working with gifs",
          //     controller: storyController),
          // StoryItem.pageImage(
          //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
          //   caption: "Hello, from the other side",
          //   controller: storyController,
          // ),
          // StoryItem.pageImage(
          //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
          //   caption: "Hello, from the other side2",
          //   controller: storyController,
          // ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          Navigator.pop(context);
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}