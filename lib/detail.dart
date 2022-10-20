import 'package:crudbuku/main.dart';
import 'package:flutter/material.dart';
import 'editdata.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.index, required this.list});

  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = Uri.parse('http://10.0.2.2/bukuperpus/deletedata.php');
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah anda yakin ingin menghapus file '${widget.list[widget.index]['judul_buku']}'"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text(
              "Hapus",
              style: new TextStyle(color: Colors.black),
            ),
            color: Color.fromARGB(255, 255, 0, 0),
            onPressed: () {
              deleteData();
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Home(),
              ));
            }),
        new RaisedButton(
            child:
                new Text("Kembali", style: new TextStyle(color: Colors.black)),
            color: Colors.green,
            onPressed: () => Navigator.pop(context))
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('${widget.list[widget.index]['judul_buku']}')),
      body: new Container(
        height: 270,
        padding: EdgeInsets.all(15),
        child: new Card(
          child: Center(
              child: new Column(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.only(top: 25)),
              new Text(
                widget.list[widget.index]['judul_buku'],
                style: new TextStyle(fontSize: 14),
              ),
              new Text(
                widget.list[widget.index]['tahun_terbit'],
                style: new TextStyle(fontSize: 14),
              ),
              new Text(
                widget.list[widget.index]['tempat_terbit'],
                style: new TextStyle(fontSize: 14),
              ),
              new Text(
                "Barcode : ${widget.list[widget.index]['id']}",
                style: new TextStyle(fontSize: 14),
              ),
              new Text(
                "Pengarang : ${widget.list[widget.index]['pengarang']}",
                style: new TextStyle(fontSize: 14),
              ),
              new Text(
                "Penerbit : ${widget.list[widget.index]['penerbit']}",
                style: new TextStyle(fontSize: 14),
              ),
              new Text(
                "Rak : ${widget.list[widget.index]['rak']}",
                style: new TextStyle(fontSize: 14),
              ),
              new Padding(padding: const EdgeInsets.only(top: 25)),
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("EDIT"),
                    color: Colors.lightBlueAccent,
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new EditData(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                  ),
                  new RaisedButton(
                    child: new Text("DELETE"),
                    color: Colors.red,
                    onPressed: () => confirm(),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
