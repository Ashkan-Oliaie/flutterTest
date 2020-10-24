import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';

class AnimationTest extends HookWidget {



  @override
  Widget build(BuildContext context) {
    // useAnimationController(duration: const Duration(seconds: 2));
    final controller =useAnimationController(
        duration: Duration(seconds: 1)
    );
    final Size size = MediaQuery.of(context).size;
    final animate = useState(CrossFadeState.showSecond);
    final toggle = useState(false);

    // ignore: missing_return
    useEffect(() {}, [animate]);


    return SafeArea(
      child: Container(
        child: AnimatedContainer(
          height: toggle.value ? 300 : 50,
          width: 200,
          duration: Duration(milliseconds: 300),
          child: Column(
            children: [
              FlatButton(
                onPressed: () {
                  animate.value = animate.value == CrossFadeState.showSecond
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond;
                  toggle.value = !toggle.value;
                },
                child: Text('Animate'),
              ),
              ListTile(
                title: const Text('Thomas Jefferson'),
                leading: Radio(
                  value: 'key1',
                  onChanged: (v) {},
                  groupValue: null,
                ),
              ),
              ListTile(
                title: const Text('Thomas Jefferson'),
                leading: Radio(
                  value: 'key1',
                  onChanged: (v) {},
                  groupValue: null,
                ),
              ),
              ListTile(
                title: const Text('Thomas Jefferson'),
                leading: Radio(
                  value: 'key1',
                  onChanged: (v) {},
                  groupValue: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
