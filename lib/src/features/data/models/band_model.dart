class BandModel {
  String? id;
  String? name;
  int? votes;

  BandModel({this.id, this.name, this.votes});

  factory BandModel.fromMap(Map<String, dynamic> obj) =>
      BandModel(name: obj['name'], id: obj['id'], votes: obj['votes']);
}
