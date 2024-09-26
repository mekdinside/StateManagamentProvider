import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final CounterProvider counterProvider;
  @override
  Widget build(BuildContext context) {
    counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(
              builder: (_, provider, __) {
                return Text(
                  '${provider.count}',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterProvider.update,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
///THIS CLASS IS WHERE STATE ARE BEING MANAGE
class CounterProvider extends ChangeNotifier {
  int count = 0;
  update() {
    count++;
    notifyListeners();
  }
}