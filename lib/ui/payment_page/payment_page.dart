import 'package:flutter/material.dart';
import 'package:give_n_go/ui/charity_detail/charity_detail_state.dart';
import 'package:give_n_go/ui/charity_page/charity_page_state.dart';
import 'package:give_n_go/ui/home_page/home_page_state.dart';
import 'package:give_n_go/ui/payment_page/payment_page_state.dart';
import 'package:provider/provider.dart';

import '../charity_page/charity_page.dart';
import '../home_page/home_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: EdgeInsetsDirectional.fromSTEB(70, 24, 70, 12),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Successful",
                          style: TextStyle(
                              fontSize: 18, color: Colors.green.shade900),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "RM 1.00",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("28 MAY 2023"),
                      SizedBox(
                        width: 25,
                      ),
                      Text("5:54 am")
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text("Ref ID: REF-ABC123")],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                      create: (context) => CharityPageState(),
                                      child: CharityPage(),
                                    )));
                          },
                          child: Text('Back to Charity Page'))
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
