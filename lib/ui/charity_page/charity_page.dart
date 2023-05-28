import 'package:flutter/material.dart';
import 'package:give_n_go/util/constants.dart';
import 'package:provider/provider.dart';

import '../../data/charity.dart';
import '../../service/background_service.dart';
import '../../service/charity_service.dart';
import '../charity_detail/charity_detail.dart';
import '../charity_detail/charity_detail_state.dart';

class CharityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: charityList.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blue,
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: Container(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (context) =>
                              CharityDetailState(charityList[index]),
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
                      child: Image(
                        image: NetworkImage(charityList[index].image),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(charityList[index].description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text('${charityList[index].distance} km',
                                style: TextStyle(
                              color: Colors.white,
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
