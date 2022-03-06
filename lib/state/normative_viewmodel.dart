import 'package:get_it/get_it.dart';
import 'package:legalis/model/gazette.dart';
import 'package:legalis/model/normative.dart';
import 'package:legalis/model/resource.dart';
import 'package:legalis/repositories/gazette_repository.dart';
import 'package:legalis/repositories/normative_repository.dart';
import 'package:legalis/utils/base_model.dart';

class NormativeViewModel extends BaseModel {
  final normativeRepository = GetIt.I<NormativeRepository>();
  final gazetteRepository = GetIt.I<GazetteRepository>();

  Gazette? _gazette;
  Resource<Normative> _norm = Resource.loading();

  Gazette? get gazette => _gazette;
  set gazette(Gazette? gazette) {
    _gazette = gazette;
  }

  Resource<Normative> get normative {
    return _norm;
  }

  set normative(Resource<Normative> norm) {
    _norm = norm;
    notifyListeners();
  }

  loadNormative(String id) async {
    normative = Resource.loading();
    try {
      final _norm = await normativeRepository.fetchById(id);
      final _gazette = await gazetteRepository.fetchById(_norm.gazette);
      gazette = _gazette;
      normative = Resource.complete(_norm);
    } catch (e) {
      normative = Resource.error(e.toString());
    }
  }
}
