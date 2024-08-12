import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadmap/data/my_colors.dart';
import 'package:roadmap/widget/my_text.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen();

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  bool finishLoading = true;
  bool showClear = false;
  final TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: Colors.white,
        title: TextField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIconColor: Color(0XFFB8B8D2),
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search),
          ),
          maxLines: 1,
          controller: inputController,
          style: TextStyle(color: Colors.grey[800], fontSize: 18),
          keyboardType: TextInputType.text,
          onSubmitted: (term) {
            setState(() {
              finishLoading = false;
            });
            delayShowingContent();
          },
          onChanged: (term) {
            setState(() {
              showClear = (term.length > 2);
            });
          },
        ),
        actions: <Widget>[
          showClear
              ? IconButton(
                  icon: const Icon(Icons.close, color: MyColors.grey_90),
                  onPressed: () {
                    inputController.clear();
                    showClear = false;
                    setState(() {});
                  },
                )
              : Container(),
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: finishLoading ? 1.0 : 0.0,
          duration: Duration(milliseconds: 100),
          child: buildContent(context),
        ),
        AnimatedOpacity(
          opacity: finishLoading ? 0.0 : 1.0,
          duration: Duration(milliseconds: 100),
          child: buildLoading(context),
        ),
      ],
    );
  }

  Widget buildLoading(BuildContext context) {
    return Align(
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      alignment: Alignment.center,
    );
  }

  Widget buildContent(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 180,
        height: 100,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("No result",
                style: MyText.headline(context)!.copyWith(
                    color: Colors.grey[500], fontWeight: FontWeight.bold)),
            Container(height: 5),
            Text("Try input more general keyword",
                textAlign: TextAlign.center,
                style:
                    MyText.medium(context).copyWith(color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }

  void delayShowingContent() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        finishLoading = true;
      });
    });
  }
}
