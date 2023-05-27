import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_n_go/ui/common/nav_bar.dart';
import 'package:give_n_go/ui/home_page/components/card_container.dart';
import 'package:give_n_go/ui/home_page/home_page_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomePageState>();
    final accBal = state.formattedAccountBalance;

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
              child: Column(
                children: [
                  Text(
                    accBal,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Account Balance',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 32),
                      child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  title: const Text(
                                    'CARD DETAILS',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BankCard(
                                        accBal: accBal,
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 32, 0, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Card Holder: "),
                                                Text(
                                                  "John Doe",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Date Registered: "),
                                                Text(
                                                  "MAY 2023",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Valid Till: "),
                                                Text(
                                                  "SEPTEMBER 2026",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: BankCard(
                            accBal: accBal,
                          )))
                ],
              )),
          // FloatingActionButton(onPressed: () {
          //   state.addToBalance(1);
          // })
        ],
      ),
    );
  }
}
