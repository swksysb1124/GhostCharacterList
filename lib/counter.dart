import 'dart:async';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;
  StreamController<int> _streamController = StreamController<int>.broadcast();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('Counter Page')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _streamController.stream.where((count) => count % 2 == 0),
          // 如果要加一些 stream 操作 可以放這邊ㄅ
          builder: (context, snapshot) {
            print('StreamBuilder build');
            return (snapshot.data != null)
                ? Text('${snapshot.data}',
                    style: Theme.of(context).textTheme.headline1)
                : Text('$_count', style: Theme.of(context).textTheme.headline1);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _streamController.add(++_count);
        },
      ),
    );
  }
}
