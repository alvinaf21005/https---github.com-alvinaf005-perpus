import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerID = new TextEditingController();
  TextEditingController controllerJudul = new TextEditingController();
  TextEditingController controllerPengarang = new TextEditingController();
  TextEditingController controllerPenerbit = new TextEditingController();
  TextEditingController controllerTahun = new TextEditingController();
  TextEditingController controllerTempat = new TextEditingController();
  TextEditingController controllerRak = new TextEditingController();

  void addData() {
    var url = Uri.parse('http://10.0.2.2/bukuperpus/adddata.php');
    http.post(url, body: {
      "id": controllerID.text,
      "judul_buku": controllerJudul.text,
      "pengarang": controllerPengarang.text,
      "penerbit": controllerPenerbit.text,
      "tahun_terbit": controllerTahun.text,
      "tempat_terbit": controllerTempat.text,
      "rak": controllerRak.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Tambah Buku")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: new ListView(
          children: <Widget>[
            new TextField(
              controller: controllerID,
              decoration:
                  new InputDecoration(hintText: "Barcode", labelText: "ID"),
            ),
            new TextField(
              controller: controllerJudul,
              decoration: new InputDecoration(
                  hintText: "Judul Buku", labelText: "Judul Buku"),
            ),
            new TextField(
              controller: controllerPengarang,
              decoration: new InputDecoration(
                  hintText: "Pengarang", labelText: "Pengarang"),
            ),
            new TextField(
              controller: controllerPenerbit,
              decoration: new InputDecoration(
                  hintText: "Penerbit", labelText: "Penerbit"),
            ),
            new TextField(
              controller: controllerTahun,
              decoration: new InputDecoration(
                  hintText: "Tahun Terbit", labelText: "Tahun Terbit"),
            ),
            new TextField(
              controller: controllerTempat,
              decoration: new InputDecoration(
                  hintText: "Tempat Terbit", labelText: "Tempat Terbit"),
            ),
            new TextField(
              controller: controllerRak,
              decoration:
                  new InputDecoration(hintText: "Rak", labelText: "Rak"),
            ),
            new Padding(padding: const EdgeInsets.all(15)),
            new RaisedButton(
              child: new Text("ADD"),
              color: Colors.green,
              onPressed: () {
                addData();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
