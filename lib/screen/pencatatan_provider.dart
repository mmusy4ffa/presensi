import 'package:flutter/material.dart';

class PencatatanProvider with ChangeNotifier {
  List<Map<String, dynamic>> _siswa = [
    {'name': 'Ali', 'isPresent': false},
    {'name': 'Budi', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
  ];
  List<Map<String, dynamic>> _riwayat = [];

  List<Map<String, dynamic>> get siswa => _siswa;
  List<Map<String, dynamic>> get riwayat => _riwayat;

  void updateKehadiran(int index, bool isPresent) {
    _siswa[index]['isPresent'] = isPresent;
    notifyListeners();
  }

  void simpanKehadiran() {
    int hadirCount = _siswa.where((siswa) => siswa['isPresent']).length;
    int tidakHadirCount = _siswa.length - hadirCount;

    _riwayat.insert(
      0,
      {
        'tanggal': DateTime.now().toString(),
        'hadirCount': hadirCount,
        'tidakHadirCount': tidakHadirCount,
      },
    );

    notifyListeners();
  }

  void resetKehadiran() {
    for (var siswa in _siswa) {
      siswa['isPresent'] = false;
    }
    notifyListeners();
  }
}
