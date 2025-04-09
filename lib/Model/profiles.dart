import 'dart:convert';

List<Profiles> profilesFromJson(String str) => List<Profiles>.from(json.decode(str).map((x) => Profiles.fromJson(x)));

String profilesToJson(List<Profiles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profiles {
    String name;
    String imagePath;
    int age;
    int weight;
    Gender gender;
    String bloodGroup;

    Profiles({
        required this.name,
        required this.imagePath,
        required this.age,
        required this.weight,
        required this.gender,
        required this.bloodGroup,
    });

    factory Profiles.fromJson(Map<String, dynamic> json) => Profiles(
        name: json["name"],
        imagePath: json["imagePath"],
        age: json["age"],
        weight: json["weight"],
        gender: genderValues.map[json["gender"]]!,
        bloodGroup: json["bloodGroup"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imagePath": imagePath,
        "age": age,
        "weight": weight,
        "gender": genderValues.reverse[gender],
        "bloodGroup": bloodGroup,
    };
}

enum Gender {
    FEMALE,
    MALE
}

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
