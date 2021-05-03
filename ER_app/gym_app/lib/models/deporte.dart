import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class Deporte {
  final int id;
  final String idDeporte;
  final String deporte;
  final bool femenil;
  final String publishedAt;
  final String createdAt;
  final String updatedAt;

  const Deporte({
    this.id,
    this.idDeporte,
    this.deporte,
    this.femenil,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Deporte(id: $id, idDeporte: $idDeporte, deporte: $deporte, femenil: $femenil, publishedAt: $publishedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Deporte.fromJson(Map<String, dynamic> json) {
    return Deporte(
      id: json['id'] as int,
      idDeporte: json['ID_deporte'] as String,
      deporte: json['Deporte'] as String,
      femenil: json['Femenil'] as bool,
      publishedAt: json['published_at'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ID_deporte': idDeporte,
      'Deporte': deporte,
      'Femenil': femenil,
      'published_at': publishedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  Deporte copyWith({
    int id,
    String idDeporte,
    String deporte,
    bool femenil,
    String publishedAt,
    String createdAt,
    String updatedAt,
  }) {
    return Deporte(
      id: id ?? this.id,
      idDeporte: idDeporte ?? this.idDeporte,
      deporte: deporte ?? this.deporte,
      femenil: femenil ?? this.femenil,
      publishedAt: publishedAt ?? this.publishedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Deporte &&
        other.id == id &&
        other.idDeporte == idDeporte &&
        other.deporte == deporte &&
        other.femenil == femenil &&
        other.publishedAt == publishedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashValues(
      id,
      idDeporte,
      deporte,
      femenil,
      publishedAt,
      createdAt,
      updatedAt,
    );
  }
}
