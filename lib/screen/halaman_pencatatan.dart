import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/pencatatan_provider.dart';

class HalamanPencatatan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pencatatanProvider = Provider.of<PencatatanProvider>(context);
    var siswa = pencatatanProvider.siswa;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pencatatan Kehadiran'),
      ),
      body: ListView.builder(
        itemCount: siswa.length,
        itemBuilder: (context, index) {
          var siswaItem = siswa[index];
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(siswaItem['name']),
                Checkbox(
                  value: siswaItem['isPresent'],
                  onChanged: (bool? value) {
                    pencatatanProvider.updateKehadiran(index, value!);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: siswa.isEmpty
              ? null
              : () {
                  pencatatanProvider.simpanKehadiran();
                  pencatatanProvider.resetKehadiran();
                },
          child: Text('Simpan')),
    );
  }
}
