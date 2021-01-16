import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final int index;
  final VoidCallback onClicked;

  const CardWidget({
    @required this.index,
    @required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    print('Index: $index');
    final url = 'https://source.unsplash.com/random?sig=$index';

    return InkWell(
      onTap: onClicked,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Random Image',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 4),
                Text(
                  'Unsplash',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
