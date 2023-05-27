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
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.logo_dev), // TODO: Use logo
                const SizedBox(width: 8.0),
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
          ]),
        ));
  }
}
