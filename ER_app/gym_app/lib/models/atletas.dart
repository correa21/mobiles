import 'package:equatable/equatable.dart';

class Atletas extends Equatable {
  final int? id;
  final String? nombre;
  final String? apellido;
  final String? pocision;
  final String? idAtleta;
  final int? entrenador;
  final int? deporte;
  final String? publishedAt;
  final String? createdAt;
  final String? updatedAt;

  const Atletas({
    this.id,
    this.nombre,
    this.apellido,
    this.pocision,
    this.idAtleta,
    this.entrenador,
    this.deporte,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Atletas.fromJson(Map<String, dynamic> json) {
    return Atletas(
      id: json['id'] as int?,
      nombre: json['Nombre'] as String?,
      apellido: json['Apellido'] as String?,
      pocision: json['pocision'] as String?,
      idAtleta: json['ID_atleta'] as String?,
      entrenador: json['entrenador'] as int?,
      deporte: json['deporte'] as int?,
      publishedAt: json['published_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Nombre': nombre,
      'Apellido': apellido,
      'pocision': pocision,
      'ID_atleta': idAtleta,
      'entrenador': entrenador,
      'deporte': deporte,
      'published_at': publishedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  Atletas copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? pocision,
    String? idAtleta,
    int? entrenador,
    int? deporte,
    String? publishedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return Atletas(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      pocision: pocision ?? this.pocision,
      idAtleta: idAtleta ?? this.idAtleta,
      entrenador: entrenador ?? this.entrenador,
      deporte: deporte ?? this.deporte,
      publishedAt: publishedAt ?? this.publishedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      nombre,
      apellido,
      pocision,
      idAtleta,
      entrenador,
      deporte,
      publishedAt,
      createdAt,
      updatedAt,
    ];
  }
}
