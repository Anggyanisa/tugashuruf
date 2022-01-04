import 'dart:ui';

import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  TextEditingController inijawab = TextEditingController();
  var list = [
    'Huruf Setelah B adalah Huruf...',
    'Huruf Sebelum Huruf N adalah huruf...',
    'Huruf diantara Huruf U dan W adalah Huruf...',
    'Huruf setelah huruf H adalah huruf...',
    'Huruf Terakhir di alfabet adalah huruf...',
    'Huruf Pertama di alfabet adalah huruf..',
    'Huruf setelah huruf O adalah huruf...',
    'Huruf sebelum huruf L adalah huruf...',
    'Huruf setelah huruf D adalah huruf...',
    'Huruf sebelum huruf Z adalah huruf..',
  ];
  var randomItem;
  List<int> countnilai = [];
  late String jawab;
  int nilai = 0;
  int nilaiakhir = 0;
  @override
  void initState() {
    createRandom();

    super.initState();
  }

  createRandom() {
    randomItem = (list.toList()..shuffle()).first;

    print("OUTPUT:" + randomItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Tebak Huruf(Anggyanisa 19.01.55.0009)"),
      ),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(20),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Pertanyaan",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            Text(
              randomItem,
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Jawab",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: inijawab,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ketik Jawaban',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  jawab = inijawab.value.text.toString().toLowerCase();
                  if (randomItem == 'Huruf Setelah B adalah Huruf...') {
                    countnilai.add(1);
                    if (jawab == 'c') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf Sebelum Huruf N adalah huruf...') {
                    countnilai.add(1);
                    if (jawab == 'm') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf diantara Huruf U dan W adalah Huruf...') {
                    countnilai.add(1);
                    if (jawab == 'v') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf setelah huruf H adalah huruf...') {
                    countnilai.add(1);
                    if (jawab == 'i') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf Terakhir di alfabet adalah huruf...') {
                    countnilai.add(1);
                    if (jawab == 'z') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf Pertama di alfabet adalah huruf..') {
                    countnilai.add(1);
                    if (jawab == 'a') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf setelah huruf O adalah huruf...') {
                    countnilai.add(1);
                    if (jawab == 'p') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf sebelum huruf L adalah huruf...') {
                    countnilai.add(1);
                    if (jawab == 'k') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf setelah huruf D adalah huruf...') {
                    countnilai.add(1);
                    if (jawab == 'e') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  } else if (randomItem ==
                      'Huruf sebelum huruf Z adalah huruf..') {
                    countnilai.add(1);
                    if (jawab == 'y') {
                      nilai = nilai + 10;
                    } else {
                      nilai = nilai - 5;
                    }
                  }
                  inijawab.clear();
                  createRandom();
                  setState(() {
                    print("JAWABAN=" + jawab);
                    print("NILAI=" + nilai.toString());
                    if (countnilai.length == 9) {
                      popupNilai(context);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent, onPrimary: Colors.white),
                child: Text("Jawab"),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/balon.png"),
                      fit: BoxFit.scaleDown)),
            )
          ],
        ),
      ),
    );
  }

  popupNilai(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Permainan Berakhir Nilai anda Adalah",
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              nilai.toString(),
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            actions: [
              FlatButton(
                child: Text(
                  "Main Lagi",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  countnilai.clear();
                  createRandom();
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
