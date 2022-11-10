import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            //1 Putting a Column inside an Expanded widget stretches
            //the column to use all remaining free space in the row.
            //Setting the crossAxisAlignment property to CrossAxisAlignment.
            //start positions the column at the start of the row.

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //2  Putting the first row of text inside a Container
                //enables you to add padding. The second child in the
                //Column, also text, displays as grey.

                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Lac bleu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Hamis, Fre D. Choinière',
                  style: TextStyle(color: Color.fromARGB(255, 123, 26, 150)),
                ),
              ],
            ),
          ),

          //3 The last two items in the title row are a star icon,
          //painted red, and the text “41”. The entire row is in a
          //Container and padded along each edge by 32 pixels.
          //Add the title section to the app body like this:

          const FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The Spidey (in-game name Hämis) is a small, but aggressive three-legged critter that clip together and can deal a moderate amount of melee damage.',
        softWrap: true,
      ),
    );

// aplication gérer ici
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        // appBar est la ligne bleu en haut (n'est pas nécessaire pour l'estétique)
        //appBar: AppBar(
        //title: const Text('Flutter layout demo'),
        // ),
        body: ListView(children: [
          Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ]),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}
