import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final accBal;
  const BankCard({super.key, required this.accBal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/card-image-1.png'), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Color(0x230E151B),
            offset: Offset(5, 5),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Savings Account-i',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '1234 5678 9999',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              Text(
                accBal,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ]),
      ),
    );
  }
}
