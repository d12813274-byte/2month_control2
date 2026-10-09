import 'package:flutter/material.dart';

class CatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Каталог",
      home: CatalogPage(),
    );
  }
}

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Каталог")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final title = "Item ${index + 1}";
          final desc = "Описание элемента ${index + 1}";
          return ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text(title),
            subtitle: Text(desc),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(title: title, desc: desc),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String title;
  final String desc;

  DetailPage({required this.title, required this.desc});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(widget.desc),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFavorite ? Colors.green : Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = true;
                  });
                },
                child: Text(
                  isFavorite ? "Добавлено в избранное" : "Добавить в избранное",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}