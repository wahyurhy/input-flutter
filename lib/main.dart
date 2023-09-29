import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Input Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = '';
  bool lightOn = false;
  String? language;
  bool agree = false;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your name',
              ),
              onChanged: (String value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Switch(value: lightOn, onChanged: (bool value) {
              setState(() {
                lightOn = value;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(lightOn ? 'Light On' : 'Light Off'),
                  duration: const Duration(seconds: 1),
                ),
              );
            }),
            const SizedBox(height: 20),
            ListTile(
              leading: Radio<String>(
                value: 'Dart',
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackBar();
                  });
                },
              ),
              title: const Text('Dart'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'Kotlin',
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackBar();
                  });
                },
              ),
              title: const Text('Kotlin'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'Swift',
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackBar();
                  });
                },
              ),
              title: const Text('Swift'),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Agree / Disagree'),
              leading: Checkbox(
                value: agree,
                onChanged: (bool? value) {
                  setState(() {
                    agree = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(content: Text('Hello $_name'));
                  });
                },
                child: const Text('Submit')
            )
          ],
        ),
      ),
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$language selected'),
          duration: const Duration(seconds: 1),
        )
    );
  }
}
