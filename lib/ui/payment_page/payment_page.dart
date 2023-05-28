import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:give_n_go/ui/charity_detail/charity_detail_state.dart';
import 'package:give_n_go/ui/charity_page/charity_page_state.dart';
import 'package:give_n_go/ui/home_page/home_page_state.dart';
import 'package:give_n_go/ui/payment_page/payment_page_state.dart';
import 'package:provider/provider.dart';

import '../charity_page/charity_page.dart';
import '../home_page/home_page.dart';

class PaymentPage extends StatelessWidget {
  final String amount;
  const PaymentPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
        padding: const EdgeInsetsDirectional.fromSTEB(70, 24, 70, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              child: Image.asset(
                'assets/payment-success-check.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                    child: Text(
                      "Successful",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.green[900]),
                    ),
                  ),
                  Text(
                    "RM ${double.parse(amount).toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),
                  ),
                  Text("28 MAY 2023", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),),
                  Text("5:54 am", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
                  Text("Ref ID: REF-ABC123", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Back to Charity Page'))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
