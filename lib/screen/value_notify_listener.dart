import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueNotifyListenerWidget extends StatelessWidget {
  const ValueNotifyListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> count = ValueNotifier<int>(10);
    ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Notify Listner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(toggle.value
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                    ),
                  ),
                  obscureText: toggle.value,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: count,
              builder: (context, value, child) {
                return Text(
                  count.value.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
          print(count.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
