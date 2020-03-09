import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final int value;
  final String description;
  final String username;
  final bool isLoading;
  final VoidCallback onIncrement;

  MyHomePage({
    Key key,
    this.value,
    this.description,
    this.username,
    this.isLoading,
    this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text('Before and After Example')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You have pushed the button this many times:'),
                Text('$value', style: TextStyle(fontSize: 30)),
                Text(username),
                isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: onIncrement,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
