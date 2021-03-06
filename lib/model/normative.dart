class Normative {
  String id;
  String name;
  String? text;
  String? gazette;
  List<String> keywords = [];
  List<String> tags = [];
  String? organism;
  String? state;
  String? summary;
  String? normtype;
  int? year;
  int? number;
  int? startpage;
  int? endpage;

  Normative(
      {required this.id,
      required this.name,
      this.text,
      this.summary,
      this.year,
      this.normtype,
      this.number,
      this.tags = const [],
      this.keywords = const [],
      this.gazette,
      this.organism,
      this.state,
      this.startpage,
      this.endpage})
      : super();

  factory Normative.fromMap(Map<String, dynamic> data) {
    var keywords = (data['keywords'] ?? []) as List<dynamic>;
    var tags = (data['tags'] ?? []) as List<dynamic>;
    return Normative(
        id: data['id'],
        name: data['name'],
        text: data['text'],
        gazette: data['gazette'],
        keywords: List<String>.from(keywords.map((e) => e.toString())),
        tags: List<String>.from(tags.map((e) => e.toString())),
        organism: data['organism'],
        state: data['state'],
        summary: data['summary'],
        year: data['year'],
        normtype: data['normtype'],
        number: data['number'],
        startpage: data['startpage'],
        endpage: data['endpage']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'text': text,
      'gazette': gazette,
      'keywords': keywords,
      'tags': tags,
      'organism': organism,
      'state': state,
      'summary': summary,
      'year': year,
      'normtype': normtype,
      'number': number,
      'startpage': startpage,
      'endpage': endpage
    };
  }
}
