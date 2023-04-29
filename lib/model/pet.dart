// To parse this JSON data, do
//
//     final pets = petsFromMap(jsonString);

import 'dart:convert';
import 'dart:ui';

import 'package:hive/hive.dart';

part 'pet.g.dart';

@HiveType(typeId: 1)
class Pets extends HiveObject{
  @HiveField(0)
  final List<Pet> pets;

  Pets({
    required this.pets,
  });

  Pets copyWith({
    List<Pet>? pets,
  }) =>
      Pets(
        pets: pets ?? this.pets,
      );

  factory Pets.fromJson(String str) => Pets.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pets.fromMap(Map<String, dynamic> json) => Pets(
    pets: List<Pet>.from(json["pets"].map((x) => Pet.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "pets": List<dynamic>.from(pets.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 2)
class Pet extends HiveObject{
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final String species;
  @HiveField(4)
  final Breeds breeds;
  @HiveField(5)
  final PetColors colors;
  @HiveField(6)
  final String age;
  @HiveField(7)
  final String gender;
  @HiveField(8)
  final String size;
  @HiveField(9)
  final Attributes attributes;
  @HiveField(10)
  final Environment environment;
  @HiveField(11)
  final List<String> tags;
  @HiveField(12)
  final String name;
  @HiveField(13)
  final String description;
  @HiveField(14)
  final List<Photo> photos;
  @HiveField(15)
  final String status;
  @HiveField(16)
  final String publishedAt;
  @HiveField(17)
  final Contact contact;
  @HiveField(46)
  final String price;

  Pet({
    required this.id,
    required this.type,
    required this.species,
    required this.breeds,
    required this.colors,
    required this.age,
    required this.gender,
    required this.size,
    required this.attributes,
    required this.environment,
    required this.tags,
    required this.name,
    required this.description,
    required this.photos,
    required this.status,
    required this.publishedAt,
    required this.contact,
    required this.price,
  });

  Pet copyWith({
    int? id,
    String? type,
    String? species,
    Breeds? breeds,
    PetColors? colors,
    String? age,
    String? gender,
    String? size,
    dynamic coat,
    Attributes? attributes,
    Environment? environment,
    List<String>? tags,
    String? name,
    String? description,
    List<Photo>? photos,
    String? status,
    String? publishedAt,
    Contact? contact,
    String? price,
  }) =>
      Pet(
        id: id ?? this.id,
        type: type ?? this.type,
        species: species ?? this.species,
        breeds: breeds ?? this.breeds,
        colors: colors ?? this.colors,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        size: size ?? this.size,
        attributes: attributes ?? this.attributes,
        environment: environment ?? this.environment,
        tags: tags ?? this.tags,
        name: name ?? this.name,
        description: description ?? this.description,
        photos: photos ?? this.photos,
        status: status ?? this.status,
        publishedAt: publishedAt ?? this.publishedAt,
        contact: contact ?? this.contact,
        price: price ?? this.price,
      );

  factory Pet.fromJson(String str) => Pet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pet.fromMap(Map<String, dynamic> json) => Pet(
    id: json["id"],
    type: json["type"],
    species: json["species"],
    breeds: Breeds.fromMap(json["breeds"]),
    colors: PetColors.fromMap(json["colors"]),
    age: json["age"],
    gender: json["gender"],
    size: json["size"],
    attributes: Attributes.fromMap(json["attributes"]),
    environment: Environment.fromMap(json["environment"]),
    tags: List<String>.from(json["tags"].map((x) => x)),
    name: json["name"],
    description: json["description"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromMap(x))),
    status: json["status"],
    publishedAt: json["published_at"],
    contact: Contact.fromMap(json["contact"]),
    price: json["price"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "species": species,
    "breeds": breeds.toMap(),
    "colors": colors.toMap(),
    "age": age,
    "gender": gender,
    "size": size,
    "attributes": attributes.toMap(),
    "environment": environment.toMap(),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "name": name,
    "description": description,
    "photos": List<dynamic>.from(photos.map((x) => x.toMap())),
    "status": status,
    "published_at": publishedAt,
    "contact": contact.toMap(),
    "price": price
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Pet &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              description == other.description &&
              publishedAt == other.publishedAt;

  @override
  int get hashCode => Object.hash(id, name, description, publishedAt);
}

@HiveType(typeId: 3)
class Attributes extends HiveObject{
  @HiveField(18)
  final bool spayedNeutered;
  @HiveField(19)
  final bool houseTrained;
  @HiveField(20)
  final dynamic declawed;
  @HiveField(21)
  final bool specialNeeds;
  @HiveField(22)
  final bool shotsCurrent;

  Attributes({
    required this.spayedNeutered,
    required this.houseTrained,
    required this.declawed,
    required this.specialNeeds,
    required this.shotsCurrent,
  });

  Attributes copyWith({
    bool? spayedNeutered,
    bool? houseTrained,
    dynamic declawed,
    bool? specialNeeds,
    bool? shotsCurrent,
  }) =>
      Attributes(
        spayedNeutered: spayedNeutered ?? this.spayedNeutered,
        houseTrained: houseTrained ?? this.houseTrained,
        declawed: declawed ?? this.declawed,
        specialNeeds: specialNeeds ?? this.specialNeeds,
        shotsCurrent: shotsCurrent ?? this.shotsCurrent,
      );

  factory Attributes.fromJson(String str) => Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
    spayedNeutered: json["spayed_neutered"],
    houseTrained: json["house_trained"],
    declawed: json["declawed"],
    specialNeeds: json["special_needs"],
    shotsCurrent: json["shots_current"],
  );

  Map<String, dynamic> toMap() => {
    "spayed_neutered": spayedNeutered,
    "house_trained": houseTrained,
    "declawed": declawed,
    "special_needs": specialNeeds,
    "shots_current": shotsCurrent,
  };
}

@HiveType(typeId: 4)
class Breeds extends HiveObject{
  @HiveField(23)
  final String primary;
  @HiveField(24)
  final dynamic secondary;
  @HiveField(25)
  final bool mixed;
  @HiveField(26)
  final bool unknown;

  Breeds({
    required this.primary,
    required this.secondary,
    required this.mixed,
    required this.unknown,
  });

  Breeds copyWith({
    String? primary,
    dynamic secondary,
    bool? mixed,
    bool? unknown,
  }) =>
      Breeds(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        mixed: mixed ?? this.mixed,
        unknown: unknown ?? this.unknown,
      );

  factory Breeds.fromJson(String str) => Breeds.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Breeds.fromMap(Map<String, dynamic> json) => Breeds(
    primary: json["primary"],
    secondary: json["secondary"],
    mixed: json["mixed"],
    unknown: json["unknown"],
  );

  Map<String, dynamic> toMap() => {
    "primary": primary,
    "secondary": secondary,
    "mixed": mixed,
    "unknown": unknown,
  };
}

@HiveType(typeId: 5)
class PetColors extends HiveObject{
  @HiveField(27)
  final dynamic primary;
  @HiveField(28)
  final dynamic secondary;
  @HiveField(29)
  final dynamic tertiary;

  PetColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  PetColors copyWith({
    dynamic primary,
    dynamic secondary,
    dynamic tertiary,
  }) =>
      PetColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
      );

  factory PetColors.fromJson(String str) => PetColors.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PetColors.fromMap(Map<String, dynamic> json) => PetColors(
    primary: json["primary"],
    secondary: json["secondary"],
    tertiary: json["tertiary"],
  );

  Map<String, dynamic> toMap() => {
    "primary": primary,
    "secondary": secondary,
    "tertiary": tertiary,
  };
}

@HiveType(typeId: 6)
class Contact extends HiveObject{
  @HiveField(30)
  final String email;
  @HiveField(31)
  final String phone;
  @HiveField(32)
  final Address address;

  Contact({
    required this.email,
    required this.phone,
    required this.address,
  });

  Contact copyWith({
    String? email,
    String? phone,
    Address? address,
  }) =>
      Contact(
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
      );

  factory Contact.fromJson(String str) => Contact.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
    email: json["email"],
    phone: json["phone"],
    address: Address.fromMap(json["address"]),
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "phone": phone,
    "address": address.toMap(),
  };
}

@HiveType(typeId: 7)
class Address extends HiveObject{
  @HiveField(33)
  final String address1;
  @HiveField(34)
  final String address2;
  @HiveField(35)
  final String city;
  @HiveField(36)
  final String state;
  @HiveField(37)
  final String postcode;
  @HiveField(38)
  final String country;

  Address({
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
  });

  Address copyWith({
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? postcode,
    String? country,
  }) =>
      Address(
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        state: state ?? this.state,
        postcode: postcode ?? this.postcode,
        country: country ?? this.country,
      );

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    address1: json["address1"],
    address2: json["address2"],
    city: json["city"],
    state: json["state"],
    postcode: json["postcode"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => {
    "address1": address1,
    "address2": address2,
    "city": city,
    "state": state,
    "postcode": postcode,
    "country": country,
  };
}

@HiveType(typeId: 8)
class Environment extends HiveObject{
  @HiveField(39)
  final bool children;
  @HiveField(40)
  final bool dogs;
  @HiveField(41)
  final bool cats;

  Environment({
    required this.children,
    required this.dogs,
    required this.cats,
  });

  Environment copyWith({
    bool? children,
    bool? dogs,
    bool? cats,
  }) =>
      Environment(
        children: children ?? this.children,
        dogs: dogs ?? this.dogs,
        cats: cats ?? this.cats,
      );

  factory Environment.fromJson(String str) => Environment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Environment.fromMap(Map<String, dynamic> json) => Environment(
    children: json["children"],
    dogs: json["dogs"],
    cats: json["cats"],
  );

  Map<String, dynamic> toMap() => {
    "children": children,
    "dogs": dogs,
    "cats": cats,
  };
}

@HiveType(typeId: 9)
class Photo extends HiveObject{
  @HiveField(42)
  final String small;
  @HiveField(43)
  final String medium;
  @HiveField(44)
  final String large;
  @HiveField(45)
  final String full;

  Photo({
    required this.small,
    required this.medium,
    required this.large,
    required this.full,
  });

  Photo copyWith({
    String? small,
    String? medium,
    String? large,
    String? full,
  }) =>
      Photo(
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
        full: full ?? this.full,
      );

  factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
    full: json["full"],
  );

  Map<String, dynamic> toMap() => {
    "small": small,
    "medium": medium,
    "large": large,
    "full": full,
  };
}
