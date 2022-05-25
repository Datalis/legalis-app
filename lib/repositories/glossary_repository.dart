import 'package:get_it/get_it.dart';
import 'package:legalis/model/glossary_term.dart';
import 'package:legalis/model/paged.dart';
import 'package:legalis/services/api_service.dart';

class GlossaryRepository {
  final apiService = GetIt.I<APIService>();

  Future<Paged<GlossaryTerm>> fetchTerms(String letter) async {
    final _terms = await apiService.get("/glosario", params: {
      'startswith': letter
    });
    return Paged.fromMap(_terms, GlossaryTerm.fromMap);
  }
}
