import 'package:flutter/material.dart';
import 'package:unsiq/constans.dart';
import 'package:unsiq/models/kategori.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Depanpage extends StatefulWidget {
  @override
  _DepanpageState createState() => _DepanpageState();
}

class _DepanpageState extends State<Depanpage> {
  List<Kategori> kategorilist = [];

  get refresh => null;

  @override
  void initState() {
    super.initState();
    fetchKategori();
  }

  @override
  void dispose() {
    super.dispose();
    kategorilist = null;
  }

  Future<List<Kategori>> fetchKategori() async {
    List<Kategori> userList;
    var params = "/warungbymenu";
    try {
      var jsonResponse = await http.get(Uri.parse(Palette.sUrl + params));
      print(Uri.parse(Palette.sUrl + params));
      print(jsonResponse.statusCode);
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

        userList = jsonItems.map<Kategori>((json) {
          return Kategori.fromJson(json);
        }).toList();

        setState(() {
          kategorilist = userList;
        });
      }
    } catch (e) {
      userList = kategorilist;
    }
    return userList;
  }

  Future<Null> _refresh() {
    return fetchKategori().then((_kategori) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  warungbymenu(),
                ]),
          )
        ]),
      ),
    );
  }

  Widget warungbymenu() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 0; i < kategorilist.length; i++)
            WidgetbyKategori(
                kategorilist[i].id, kategorilist[i].nama.toString(), i),
        ],
      ),
    );
  }
}

class WidgetbyKategori extends StatefulWidget {
  final Widget child;
  final int id;
  final String kategori;
  final int warna;

  WidgetbyKategori(this.id, this.kategori, this.warna, {Key key, this.child})
      : super(key: key);

  _WidgetbyKategoriState createState() => _WidgetbyKategoriState();
}

class _WidgetbyKategoriState extends State<WidgetbyKategori> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.only(right: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    widget.kategori,
                    style: TextStyle(color: Colors.blue),
                  ),
                  width: 200.0,
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Palette.colors[widget.warna],
                    boxShadow: [
                      BoxShadow(
                          color: Palette.colors[widget.warna], spreadRadius: 1),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute<Null>(
                    //   builder: (BuildContext context) {
                    //     return new ProdukPage(
                    //       "kat", widget.id, 0, widget.kategori);
                    //   }));
                  },
                  child: Text('Selengkapnya',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
