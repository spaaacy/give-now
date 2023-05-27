import 'package:flutter/material.dart';

import '../../data/charity.dart';

class CharityPage extends StatelessWidget {
  CharityPage({super.key});

  List<Charity> charityList = [
    Charity(
      title: 'charity box 1',
      description: 'charity description 1',
      image: 'asdf',
      distance: 0.5,
    ),
    Charity(
      title: 'charity box 2',
      description: 'charity description 2',
      image: 'asdfasfsdfsdf',
      distance: 1.0,
    ),
    Charity(
      title: 'charity box 3',
      description: 'charity description 3',
      image: 'asdfasfsdfsdf',
      distance: 1.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Charity page"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: charityList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
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
          );
        },
      ),
    );
  }
}
