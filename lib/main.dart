import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'redux/app_state.dart';

Store<AppState> store = Store<AppState>(
  initialState: AppState.initialState(),
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePageConnector(),
      ),
    );
  }
}

class MyHomePageConnector extends StatelessWidget {
  MyHomePageConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (BuildContext context, ViewModel vm) => MyHomePage(
        counter: vm.counter,
        onIncrement: vm.onIncrement,
        waiting: vm.waiting,
      ),
    );
  }
}

class IncrementAction extends ReduxAction<AppState> {
  final int amount;

  IncrementAction({@required this.amount}) : assert(amount != null);

  // Synchronous reducer.
  @override
  AppState reduce() => state.copy(counter: state.counter + amount);
}

class WaitAction extends ReduxAction<AppState> {
  final bool waiting;

  WaitAction(this.waiting);

  @override
  AppState reduce() {
    return state.copy(waiting: waiting);
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  int counter;
  bool waiting;
  VoidCallback onIncrement;

  ViewModel.build({
    @required this.counter,
    @required this.waiting,
    @required this.onIncrement,
  }) : super(equals: [counter, waiting]);

  @override
  ViewModel fromStore() => ViewModel.build(
        counter: state.counter,
        waiting: state.waiting,
        onIncrement: () => dispatch(IncrementAction(amount: 1)),
      );
}

class MyHomePage extends StatelessWidget {
  final int counter;
  final String description;
  final bool waiting;
  final VoidCallback onIncrement;

  MyHomePage({
    Key key,
    this.counter,
    this.description,
    this.waiting,
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
                Text('$counter', style: TextStyle(fontSize: 30)),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: onIncrement,
            child: Icon(Icons.add),
          ),
        ),
        if (waiting) ModalBarrier(color: Colors.red.withOpacity(0.4)),
      ],
    );
  }
}
