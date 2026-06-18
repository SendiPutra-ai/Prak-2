import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  String nama;

  @HiveField(1)
  String nbi;

  @HiveField(2)
  String email;

  @HiveField(3)
  String alamat;

  @HiveField(4)
  String instagram;

  UserData({
    required this.nama,
    required this.nbi,
    required this.email,
    required this.alamat,
    required this.instagram,
  });
}
