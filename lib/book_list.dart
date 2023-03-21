import 'package:flutter/material.dart';
import 'package:kuis_praktpm/book_detail.dart';
import 'package:kuis_praktpm/data_buku.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Data Buku"),
        ),
        body: ListView.builder(
          itemCount: listBuku.length,
          itemBuilder: (context, index) {
            final DataBuku buku = listBuku[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetail(buku: buku),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: Container(
                    child: Image.network(
                      buku.imageLink,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  title: Text(
                    buku.title,
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(buku.author),
                ),
              ),
            );
          },
        ));
  }
}
