import 'package:flutter/material.dart';
import 'package:give_n_go/util/constants.dart';

class CharityDetail extends StatelessWidget {
  const CharityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Charities'),
        ),
        body: Column(children: [
          Row(
            children: [
              // TODO: Logo
              Text('Title'),
            ],
          ),

          const SizedBox(height: 8.0),

          // TODO: Flutter Map

          const SizedBox(height: 8.0),

          Card(
            child: Text(sampleDescription),
          ),

          ElevatedButton(
              onPressed: () {
                // TODO: Show dialog
              },
              child: const Text('Donate')
          ),
        ]));
  }
}
