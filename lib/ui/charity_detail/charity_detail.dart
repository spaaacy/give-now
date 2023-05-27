import 'package:flutter/material.dart';
import 'package:give_n_go/ui/charity_detail/components/map_view.dart';
import 'package:give_n_go/ui/charity_detail/components/map_view_state.dart';
import 'package:give_n_go/util/constants.dart';
import 'package:provider/provider.dart';

import 'charity_detail_state.dart';

class CharityDetail extends StatelessWidget {
  const CharityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharityDetailState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Charities'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.logo_dev), // TODO: Use logo
                  const SizedBox(width: 16.0),
                  Text(
                    'Title',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              ChangeNotifierProvider(
                  create: (context) => MapViewState(), child: const MapView()),
              const SizedBox(height: 8.0),
              Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(sampleDescription,
                        style: Theme.of(context).textTheme.bodyLarge)),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Enter Amount'),
                            content: Form(
                              key: state.donationFormKey,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Amount cannot be empty';
                                  }
                                  if (int.parse(value) <= 0) {
                                    return 'Amount cannot be zero';
                                  }
                                  return null;
                                },
                                controller: state.donationAmountController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: 'Donation amount'),
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel')),
                              TextButton(
                                  onPressed: () {
                                    if (state.donationFormKey.currentState!
                                        .validate()) {
                                      Navigator.pop(context, 'Okay');
                                    }
                                  },
                                  child: const Text('Okay')),
                            ],
                          );
                        });
                  },
                  child: const Text('Donate')),
            ],
          ),
        ));
  }
}
