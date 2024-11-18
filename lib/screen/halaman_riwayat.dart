import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/pencatatan_provider.dart';

class HalamanRiwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pencatatanProvider = Provider.of<PencatatanProvider>(context);
    var riwayat = pencatatanProvider.riwayat;

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
      ),
      body: ListView.builder(
        itemCount: riwayat.length,
        itemBuilder: (context, index) {
          var record = riwayat[index];
          return ListTile(
            title: Text('Tanggal: ${record['tanggal']}'),
            subtitle: Text(
                'Hadir: ${record['hadirCount']} | Tidak Hadir: ${record['tidakHadirCount']}'),
          );
        },
      ),
    );
  }
}
