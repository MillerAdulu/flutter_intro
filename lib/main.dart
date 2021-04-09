import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup/colors.dart';
import 'package:startup/model.dart';

// Entry point of the app
void main() {
  runApp(StartUpQA());
}

class StartUpQA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StartUp Q&A",
      home: StartUpHome(),
    );
  }
}
class StartUpHome extends StatefulWidget {
  @override
  _StartUpHomeState createState() => _StartUpHomeState();
}

class _StartUpHomeState extends State<StartUpHome> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  final List<QuestionAndAnswer> _queriesAndAnswers = [];

  void _addQA() {
    _queriesAndAnswers.add(
      QuestionAndAnswer(
        question: _questionController.text,
        answer: _answerController.text,
      ),
    );

    setState(() {});

    _questionController.clear();
    _answerController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: _size.height,
          color: kBackgroundColor,
          child: Column(
            children: [
              _queryCard(_size),
              _qaList(_size),
            ],
          ),
        ),
      ),
    );
  }

  ListView _qaList(Size _size) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _queriesAndAnswers.length,
      itemBuilder: (context, index) => Container(
        color: Colors.transparent,
        height: _size.width * .2,
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 30,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _queriesAndAnswers[index].question,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _queriesAndAnswers[index].answer,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network('https://picsum.photos/50'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _queryCard(Size _size) {
    return Container(
      height: _size.height * .3,
      decoration: BoxDecoration(
        color: kCtaColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Flexible(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: ClipOval(
                  child: Image.network('https://picsum.photos/100'),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.bell,
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.search,
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kBackgroundColor,
                              ),
                            ),
                            SizedBox(
                              width: _size.width * .8,
                              child: TextField(
                                controller: _questionController,
                                decoration: InputDecoration(
                                  hintText: 'Ask something...',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: kBackgroundColor,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Answer',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kBackgroundColor,
                              ),
                            ),
                            SizedBox(
                              width: _size.width * .8,
                              child: TextField(
                                controller: _answerController,
                                decoration: InputDecoration(
                                  hintText: 'Answer...',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: kBackgroundColor,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(CupertinoIcons.play_arrow, size: 32),
                      onPressed: _addQA,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
