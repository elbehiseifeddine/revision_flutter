import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ElementInfo extends StatelessWidget {
  final String _image;
  final int _price;

  ElementInfo(this._image, this._price);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: const Icon(Icons.restore_from_trash_rounded, size: 50),
              onTap: () async {
                Database database = await openDatabase(
                  join(await getDatabasesPath(), "gstore_esprit_database.db"),
                );
                await database
                    .delete("basket", where: "image = ?", whereArgs: [_image]);
              },
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Image.network(_image, width: 155, height: 58),
            ),
            Text(
              _price.toString() + " TND",
              textScaleFactor: 2,
            ),
          ],
        ),
      ),
    );
  }
}
