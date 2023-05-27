import 'package:flutter/material.dart';
import 'package:give_n_go/util/constants.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import '../../data/charity.dart';
import '../charity_detail/charity_detail.dart';
import '../charity_detail/charity_detail_state.dart';

class CharityPage extends StatelessWidget {
  CharityPage({super.key});

  final _box = Hive.box('box');

  @override
  Widget build(BuildContext context) {
    final List<Charity> charityList = _box.get(hiveCharity);

    return ListView.builder(
      itemCount: charityList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                        create: (context) => CharityDetailState(),
                        child: const CharityDetail(),
                      )));
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://picsum.photos/250?image=9',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              charityList[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(charityList[index].description),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text('${charityList[index].distance} km'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
