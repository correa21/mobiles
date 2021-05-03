import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'atletas.dart';
import 'deporte.dart';

@immutable
class Coach {
  final int id;
  final String idEntrenador;
  final String apellido;
  final String nombre;
  final Deporte deporte;
  final String publishedAt;
  final String createdAt;
  final String updatedAt;
  final List<Atletas> atletas;

  const Coach({
    this.id,
    this.idEntrenador,
    this.apellido,
    this.nombre,
    this.deporte,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.atletas,
  });

  @override
  String toString() {
    return 'Coach(id: $id, idEntrenador: $idEntrenador, apellido: $apellido, nombre: $nombre, deporte: $deporte, publishedAt: $publishedAt, createdAt: $createdAt, updatedAt: $updatedAt, atletas: $atletas)';
  }

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json['id'] as int,
      idEntrenador: json['ID_entrenador'] as String,
      apellido: json['apellido'] as String,
      nombre: json['Nombre'] as String,
      deporte: json['deporte'] == null
          ? null
          : Deporte.fromJson(json['deporte'] as Map<String, dynamic>),
      publishedAt: json['published_at'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      atletas: (json['atletas'] as List<dynamic>)
          ?.map((e) =>
              e == null ? null : Atletas.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ID_entrenador': idEntrenador,
      'apellido': apellido,
      'Nombre': nombre,
      'deporte': deporte?.toJson(),
      'published_at': publishedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'atletas': atletas?.map((e) => e?.toJson())?.toList(),
    };
  }

  Coach copyWith({
    int id,
    String idEntrenador,
    String apellido,
    String nombre,
    Deporte deporte,
    String publishedAt,
    String createdAt,
    String updatedAt,
    List<Atletas> atletas,
  }) {
    return Coach(
      id: id ?? this.id,
      idEntrenador: idEntrenador ?? this.idEntrenador,
      apellido: apellido ?? this.apellido,
      nombre: nombre ?? this.nombre,
      deporte: deporte ?? this.deporte,
      publishedAt: publishedAt ?? this.publishedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      atletas: atletas ?? this.atletas,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Coach &&
        other.id == id &&
        other.idEntrenador == idEntrenador &&
        other.apellido == apellido &&
        other.nombre == nombre &&
        other.deporte == deporte &&
        other.publishedAt == publishedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        listEquals(other.atletas, atletas);
  }

  @override
  int get hashCode {
    return hashValues(
      id,
      idEntrenador,
      apellido,
      nombre,
      deporte,
      publishedAt,
      createdAt,
      updatedAt,
      atletas,
    );
  }
}
