import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:roadmap/data/my_colors.dart';
import 'package:roadmap/data/my_strings.dart';
import 'package:roadmap/providers/course_provider.dart';
import 'package:roadmap/widget/my_text.dart';
import 'package:roadmap/providers/models/lesson.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonDetailScreen extends StatefulWidget {
  final Lesson lesson;
  final int id;
  final String topic;

  LessonDetailScreen(
      {required this.lesson, required this.id, required this.topic});

  @override
  LessonDetailScreenState createState() => new LessonDetailScreenState();
}

class LessonDetailScreenState extends State<LessonDetailScreen> {
  Lesson? lessonDetail;
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    // Fetch courses when the widget is first created

    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              "https://www.youtube.com/watch?v=i_LwzRVP7bg") ??
          '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CourseProvider()
        ..getLessonDetail(
          widget.id,
          widget.lesson.lessonNumber,
          widget.topic,
          widget.lesson.title,
        ),
      child: Scaffold(body:
          Consumer<CourseProvider>(builder: (context, courseProvider, child) {
        if (courseProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final lesson = courseProvider.lesson;
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                ),
                backgroundColor: MyColors.primary,
                floating: true,
                pinned: true,
                snap: false,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.bookmark_border,
                          color: Colors.white),
                      onPressed: () {}),
                ]),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.lesson.title,
                          style: MyText.headline(context)!.copyWith(
                              color: MyColors.grey_90,
                              fontWeight: FontWeight.bold)),
                      Container(height: 10),
                      Text(widget.lesson.content,
                          style: MyText.subhead(context)!.copyWith(
                              color: MyColors.grey_40,
                              fontWeight: FontWeight.w300)),
                      const Divider(height: 30),
                      Text(MyStrings.machine_learning_one,
                          textAlign: TextAlign.justify,
                          style: MyText.subhead(context)!
                              .copyWith(color: MyColors.grey_80)),
                      Container(height: 20),
                      LayoutBuilder(builder: (context, constraints) {
                        return SizedBox(
                          width: constraints.maxWidth,
                          height: 200,
                          child: YoutubePlayer(
                            controller: _youtubeController,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            onReady: () {
                              _youtubeController.addListener(() {});
                            },
                          ),
                        );
                      }),
                      Container(height: 5),
                      Text("Image source : pexels.com",
                          textAlign: TextAlign.center,
                          style: MyText.caption(context)!
                              .copyWith(color: MyColors.grey_40)),
                      Container(height: 20),
                      Text(MyStrings.machine_learning_two,
                          textAlign: TextAlign.justify,
                          style: MyText.subhead(context)!
                              .copyWith(color: MyColors.grey_80)),
                      Container(height: 20),
                      Text(MyStrings.machine_learning_three,
                          textAlign: TextAlign.start,
                          style: MyText.medium(context).copyWith(
                              color: MyColors.grey_80,
                              fontWeight: FontWeight.bold)),
                      Container(height: 20),
                      Text(MyStrings.machine_learning_four,
                          textAlign: TextAlign.justify,
                          style: MyText.subhead(context)!
                              .copyWith(color: MyColors.grey_80)),
                    ],
                  ),
                );
              }, childCount: 1),
            )
          ],
        );
      })),
    );
  }
}
