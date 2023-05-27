import 'package:flutter/material.dart';
import 'package:give_n_go/ui/charity_detail/components/map_view.dart';
import 'package:give_n_go/ui/charity_detail/components/map_view_state.dart';
import 'package:provider/provider.dart';

import 'charity_detail_state.dart';

class CharityDetail extends StatelessWidget {
  const CharityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharityDetailState>();

    return Scaffold(
        appBar: AppBar(title: const Text('Charity Details')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: 60,
                    width: 60,
                    image: NetworkImage(state.charity.image),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: Container(
                      padding: new EdgeInsets.only(right: 13.0),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        state.charity.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ChangeNotifierProvider(
                  create: (context) => MapViewState(), child: const MapView()),
              const SizedBox(height: 8.0),
              Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.charity.description,
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
