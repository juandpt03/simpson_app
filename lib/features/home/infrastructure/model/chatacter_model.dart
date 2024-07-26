import 'package:simpson_app/features/home/domain/domain.dart';

List<Character> characterModelFromJson(List<dynamic> data) {
  return List<Character>.from(
      data.map((x) => CharacterModel.fromJson(x).toEntity()));
}

class CharacterModel {
  final int id;
  final String name;
  final String normalizedName;
  final String gender;

  CharacterModel({
    required this.id,
    required this.name,
    required this.normalizedName,
    required this.gender,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        normalizedName: json["normalized_name"],
        gender: json["gender"] == '' ? 'unknown' : json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "normalized_name": normalizedName,
        "gender": gender,
      };

  Character toEntity() => Character(id: id, name: name, gender: gender);
}
