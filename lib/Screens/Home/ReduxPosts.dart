import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ReduxPosts extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ReduxPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
              ),

              StoreConnector<int, String>(
                converter: (store) => store.state.toString(),
                builder: (context, count) {
                  return Text(
                    count,
                    // style: Theme.of(context).textTheme.display1,
                  );
                },
              )
            ],
          ),
        ),
    );
  }
}
