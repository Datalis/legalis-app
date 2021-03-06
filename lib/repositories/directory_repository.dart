import 'package:get_it/get_it.dart';
import 'package:legalis/model/directory.dart';
import 'package:legalis/services/api_service.dart';

class DirectoryRepository {
  final apiService = GetIt.I<APIService>();

  Future<List<Directory>> fetchAll() async {
    var res = await apiService.get("/directorios");
    return List<Directory>.from((res ?? []).map((e) => Directory.fromMap(e)));
  }
}
