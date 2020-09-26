import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';



class Hooks extends HookWidget {

  const Hooks({Key key, @required this.duration})
      : assert(duration != null),
        super(key: key);

  final int duration;

  @override
  Widget build(BuildContext context) {

    final counter = useState(duration);


    useEffect(() {
      print('fafa');
      return () => {};
    }, [counter]);

    return Container(
      child:Container(
        child:Column(
          children: [
            Typo(duration.toString(),true),
            Typo(counter.value.toString(),true),
            RaisedButton(
              onPressed: ()=>{counter.value=counter.value+1},
            )
          ],
        )
      )
    );
  }
}