import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:like_button/like_button.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slothmute/data/video_short.dart';

class PageStories extends StatefulWidget {
  @override
  State<PageStories> createState() => _PageStoriesState();
}

class _PageStoriesState extends State<PageStories> {
  final ImagePicker _picker = ImagePicker();
  File? videoFile;

  _ouvrirLaCamera(BuildContext context) async {
    var video = await _picker.pickVideo(source: ImageSource.camera);
    this.setState(() {
      videoFile = File(video!.path);
    });
    Navigator.of(context).pop();
  }

  bool selected = false;
  var top = 10.0;
  var left = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  height: height,
                  viewportFraction: 1.0,
                  scrollDirection: Axis.vertical,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    print(reason);
                  },
                ),
                items: videos.map((e) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Stack(
                      children: [
                        Lecture(
                          video: e,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  LikeButton(
                                    size: 50,
                                    bubblesColor: BubblesColor(
                                        dotPrimaryColor:
                                            Colors.lightGreen.shade600,
                                        dotSecondaryColor:
                                            Colors.lightGreen.shade400),
                                    circleColor: CircleColor(
                                        start: Colors.red,
                                        end: Colors.lightGreen),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(Icons.paid,
                                          color: isLiked
                                              ? Colors.lightGreen
                                              : Colors.grey,
                                          size: 50);
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                color: Colors.white,
                                                icon: Icon(Icons.play_arrow),
                                                onPressed: () {},
                                              ),
                                              Text(
                                                '317 k ',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                child: AnimatedAlign(
                                                  alignment: selected
                                                      ? Alignment.bottomCenter
                                                      : Alignment.topCenter,
                                                  duration: const Duration(
                                                      seconds: 2),
                                                  curve: Curves.fastOutSlowIn,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: Image.asset(
                                                      'assets/diamant1.png',
                                                      width: 30.0,
                                                      height: 30.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                                              ),
                                              SizedBox(width: 5.0),
                                              Text(
                                                'identifiants',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white12,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                            ),
                                            child: IconButton(
                                              iconSize: 30,
                                              color: Colors.white,
                                              icon: Icon(
                                                Icons.videocam_outlined,
                                              ),
                                              onPressed: () {
                                                _ouvrirLaCamera(context);
                                              },
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white12,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                            ),
                                            child: IconButton(
                                              iconSize: 30,
                                              color: Colors.white,
                                              icon: Icon(
                                                Icons.more_vert_rounded,
                                              ),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) =>
                                                        ComModalBottom());
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 50,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.notifications_rounded, color: Colors.white),
                        Icon(Icons.search_outlined, color: Colors.white),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ComModalBottom extends StatelessWidget {
  const ComModalBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height / 2,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Commentaires : 5k',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.expand_more_rounded,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ))),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Ajoutez un commentaire...',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ))),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                  ),
                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 220, 8),
                          child: Text('@alpha')),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        width: 300,
                        child: Text(
                            ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea cuchbbuqc c c q vhug   vuqg g f vu  vg  u vgs v vg vs  v gsv '),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class Lecture extends StatefulWidget {
  final Video video;

  const Lecture({required this.video}) : super();

  @override
  _LectureState createState() => _LectureState();
}

class _LectureState extends State<Lecture> {
  late ChewieController _chewieController;
  var _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.network(widget.video.thumbnailUrl);
    _chewieController = ChewieController(
      showControls: false,
      videoPlayerController: _videoPlayerController,
      looping: true,
      autoInitialize: true,
      showControlsOnInitialize: false,
      autoPlay: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}
