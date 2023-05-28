import 'package:flutter/material.dart';
import 'package:give_n_go/ui/charity_detail/components/map_view.dart';
import 'package:give_n_go/ui/charity_detail/components/map_view_state.dart';
import 'package:give_n_go/ui/payment_page/payment_page.dart';
import 'package:give_n_go/ui/payment_page/payment_page_state.dart';
import 'package:provider/provider.dart';

import 'charity_detail_state.dart';

class CharityDetail extends StatelessWidget {
  const CharityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharityDetailState>();

    return Scaffold(
        appBar: AppBar(title: const Text('Charity Details')),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.white10,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/bg-2.png',
              ).image,
            ),
          ),
          child: Padding(
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
                Material(
                  elevation: 12.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: ChangeNotifierProvider(
                      create: (context) => MapViewState(),
                      child: const MapView()),
                ),
                const SizedBox(height: 20.0),
                Card(
                  color: Colors.green,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(state.charity.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 20, color: Colors.white))),
                ),
                const SizedBox(height: 5.0),
                const Spacer(),
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
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
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChangeNotifierProvider(
                                                      create: (context) =>
                                                          PaymentPageState(),
                                                      child: PaymentPage(
                                                          amount: state
                                                              .donationAmountController
                                                              .text),
                                                    ),
                                                  ),
                                                  (route) =>
                                                      route.isFirst == true);
                                        }
                                      },
                                      child: const Text('Okay')),
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      child: const Text(
                        'Donate Now',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
