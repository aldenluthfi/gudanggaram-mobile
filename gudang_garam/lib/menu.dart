import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.view_in_ar, const Color(0xFF78D6C6)),
    ShopItem("Tambah Item", Icons.add_box, const Color(0xFF419197)),
    ShopItem("Logout", Icons.logout_outlined, const Color(0xFF12486B)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gudang Garam'),
          backgroundColor: const Color(0xFFF5FCCD),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'bienvenue, Alden',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC436),
                    ),
                  ),
                ),
                Column(
                  children: items.map((item) {
                    return SizedBox(
                      width: 300,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShopCard(item),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}

class ShopItem {
  final String name;
  final IconData iconFeat;
  final Color cardColor;

  ShopItem(this.name, this.iconFeat, this.cardColor);
}

class ShopCard extends StatelessWidget {
  final ShopItem feat;

  const ShopCard(this.feat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: feat.cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text("Kamu telah menekan tombol ${feat.name}"),
          ),
        ),
        child: Container(
          width: 240,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  feat.iconFeat,
                  color: Colors.white,
                  size: 50.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  feat.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}