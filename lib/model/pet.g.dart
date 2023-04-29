// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PetsAdapter extends TypeAdapter<Pets> {
  @override
  final int typeId = 1;

  @override
  Pets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pets(
      pets: (fields[0] as List).cast<Pet>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pets obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PetAdapter extends TypeAdapter<Pet> {
  @override
  final int typeId = 2;

  @override
  Pet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pet(
      id: fields[1] as int,
      type: fields[2] as String,
      species: fields[3] as String,
      breeds: fields[4] as Breeds,
      colors: fields[5] as PetColors,
      age: fields[6] as String,
      gender: fields[7] as String,
      size: fields[8] as String,
      attributes: fields[9] as Attributes,
      environment: fields[10] as Environment,
      tags: (fields[11] as List).cast<String>(),
      name: fields[12] as String,
      description: fields[13] as String,
      photos: (fields[14] as List).cast<Photo>(),
      status: fields[15] as String,
      publishedAt: fields[16] as String,
      contact: fields[17] as Contact,
      price: fields[46] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Pet obj) {
    writer
      ..writeByte(18)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.breeds)
      ..writeByte(5)
      ..write(obj.colors)
      ..writeByte(6)
      ..write(obj.age)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.size)
      ..writeByte(9)
      ..write(obj.attributes)
      ..writeByte(10)
      ..write(obj.environment)
      ..writeByte(11)
      ..write(obj.tags)
      ..writeByte(12)
      ..write(obj.name)
      ..writeByte(13)
      ..write(obj.description)
      ..writeByte(14)
      ..write(obj.photos)
      ..writeByte(15)
      ..write(obj.status)
      ..writeByte(16)
      ..write(obj.publishedAt)
      ..writeByte(17)
      ..write(obj.contact)
      ..writeByte(46)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttributesAdapter extends TypeAdapter<Attributes> {
  @override
  final int typeId = 3;

  @override
  Attributes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attributes(
      spayedNeutered: fields[18] as bool,
      houseTrained: fields[19] as bool,
      declawed: fields[20] as dynamic,
      specialNeeds: fields[21] as bool,
      shotsCurrent: fields[22] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Attributes obj) {
    writer
      ..writeByte(5)
      ..writeByte(18)
      ..write(obj.spayedNeutered)
      ..writeByte(19)
      ..write(obj.houseTrained)
      ..writeByte(20)
      ..write(obj.declawed)
      ..writeByte(21)
      ..write(obj.specialNeeds)
      ..writeByte(22)
      ..write(obj.shotsCurrent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BreedsAdapter extends TypeAdapter<Breeds> {
  @override
  final int typeId = 4;

  @override
  Breeds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Breeds(
      primary: fields[23] as String,
      secondary: fields[24] as dynamic,
      mixed: fields[25] as bool,
      unknown: fields[26] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Breeds obj) {
    writer
      ..writeByte(4)
      ..writeByte(23)
      ..write(obj.primary)
      ..writeByte(24)
      ..write(obj.secondary)
      ..writeByte(25)
      ..write(obj.mixed)
      ..writeByte(26)
      ..write(obj.unknown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PetColorsAdapter extends TypeAdapter<PetColors> {
  @override
  final int typeId = 5;

  @override
  PetColors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PetColors(
      primary: fields[27] as dynamic,
      secondary: fields[28] as dynamic,
      tertiary: fields[29] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, PetColors obj) {
    writer
      ..writeByte(3)
      ..writeByte(27)
      ..write(obj.primary)
      ..writeByte(28)
      ..write(obj.secondary)
      ..writeByte(29)
      ..write(obj.tertiary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetColorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 6;

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      email: fields[30] as String,
      phone: fields[31] as String,
      address: fields[32] as Address,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(3)
      ..writeByte(30)
      ..write(obj.email)
      ..writeByte(31)
      ..write(obj.phone)
      ..writeByte(32)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 7;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      address1: fields[33] as String,
      address2: fields[34] as String,
      city: fields[35] as String,
      state: fields[36] as String,
      postcode: fields[37] as String,
      country: fields[38] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(6)
      ..writeByte(33)
      ..write(obj.address1)
      ..writeByte(34)
      ..write(obj.address2)
      ..writeByte(35)
      ..write(obj.city)
      ..writeByte(36)
      ..write(obj.state)
      ..writeByte(37)
      ..write(obj.postcode)
      ..writeByte(38)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnvironmentAdapter extends TypeAdapter<Environment> {
  @override
  final int typeId = 8;

  @override
  Environment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Environment(
      children: fields[39] as bool,
      dogs: fields[40] as bool,
      cats: fields[41] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Environment obj) {
    writer
      ..writeByte(3)
      ..writeByte(39)
      ..write(obj.children)
      ..writeByte(40)
      ..write(obj.dogs)
      ..writeByte(41)
      ..write(obj.cats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnvironmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 9;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      small: fields[42] as String,
      medium: fields[43] as String,
      large: fields[44] as String,
      full: fields[45] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(4)
      ..writeByte(42)
      ..write(obj.small)
      ..writeByte(43)
      ..write(obj.medium)
      ..writeByte(44)
      ..write(obj.large)
      ..writeByte(45)
      ..write(obj.full);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
