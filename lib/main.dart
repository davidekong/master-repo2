import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestWidget(),
      
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ridiculous"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Ridicul-ous",
              textScaleFactor: 3,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.play_arrow_rounded))
          ],
        ),
      ),
    );
  }
}

class LevelPage extends StatelessWidget {
  final String title;
  final Color color;
  LevelPage(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: ListView(children: [
        LevelButton(1, "Sci", const Color.fromARGB(132, 83, 82, 82)),
        LevelButton(2, "Sci", const Color.fromARGB(132, 83, 82, 82)),
        LevelButton(3, "Sci", const Color.fromARGB(132, 83, 82, 82)),
        LevelButton(4, "Sci", const Color.fromARGB(132, 83, 82, 82)),
        LevelButton(5, "Sci", const Color.fromARGB(132, 83, 82, 82)),
      ]),
    );
  }
}

class LevelButton extends StatefulWidget {
  final int level;
  final String section;
  final Color color;
  LevelButton(this.level, this.section, this.color);

  @override
  State<LevelButton> createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(primary: widget.color),
        child: Center(
            child: Text(
          widget.level.toString(),
          style: const TextStyle(fontStyle: FontStyle.italic),
        )));
  }
}

class QuestionPage extends StatefulWidget {
  final String question;
  final int level;
  final String section;
  final List<String> answers;
  final bool isQuestionAnswered;
  final bool failedQuestion;
  QuestionPage(this.question, this.level, this.section, this.answers,
      this.isQuestionAnswered, this.failedQuestion);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 147, 147, 147),
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("# ${widget.level}", style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 50),
          Text(
            widget.question,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 50),
          ),
          SizedBox(
              width: 150,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(border: OutlineInputBorder()),
                style: TextStyle(fontStyle: FontStyle.normal, fontSize: 40),
              )),
        ]),
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  bool selected = true;
  void Animate() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
              duration: Duration(seconds: 2),
              width: selected ? 200 : 100,
              height: selected ? 200 : 100,
              color: selected ? Colors.black : Colors.blue),
          Center(
              child: Container(
                  child: IconButton(
                      onPressed: Animate, icon: const Icon(Icons.add))))
        ],
      ),
    );
  }
}
