import 'package:flutter/material.dart';
import 'package:kuis_praktpm/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetail extends StatefulWidget {
  final DataBuku buku;
  const BookDetail({Key? key, required this.buku}) : super(key: key);

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  String status = "";
  String text = "";
  bool isAvailable = true;

  void _status() {
    setState(() {
      widget.buku.isAvailable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.buku.isAvailable) {
      status = "Tersedia";
    } else {
      status = "Tidak Tersedia";
      isAvailable = false;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.buku.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: _launchURL,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(child: Center(child: Image.network(widget.buku.imageLink))),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Judul",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Penulis",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Bahasa",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Negara",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Jumlah Halaman",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Tahun Terbit",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Status",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(": " + widget.buku.title,
                        style: TextStyle(fontSize: 16)),
                    Text(": " + widget.buku.author,
                        style: TextStyle(fontSize: 16)),
                    Text(": " + widget.buku.language,
                        style: TextStyle(fontSize: 16)),
                    Text(": " + widget.buku.country,
                        style: TextStyle(fontSize: 16)),
                    Text(": " + (widget.buku.pages).toString(),
                        style: TextStyle(fontSize: 16)),
                    Text(": " + (widget.buku.year).toString(),
                        style: TextStyle(fontSize: 16)),
                    Text(": " + status,
                        style: TextStyle(
                            color: (isAvailable) ? Colors.green : Colors.red,
                            fontSize: 16))
                  ])),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (isAvailable)
                ? () {
                    text = "Berhasil Meminjam Buku";
                    _status();
                    SnackBar snackBar = SnackBar(
                        content: Text(text), backgroundColor: Colors.green);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                : null,
            child: Text("Pinjam Buku"),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    Uri uri = Uri.parse(widget.buku.link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
