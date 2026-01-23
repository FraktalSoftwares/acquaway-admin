// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? nome,
    String? email,
    String? fotoPerfil,
    String? nivel,
    String? tipoUser,
  })  : _nome = nome,
        _email = email,
        _fotoPerfil = fotoPerfil,
        _nivel = nivel,
        _tipoUser = tipoUser;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "fotoPerfil" field.
  String? _fotoPerfil;
  String get fotoPerfil => _fotoPerfil ?? '';
  set fotoPerfil(String? val) => _fotoPerfil = val;

  bool hasFotoPerfil() => _fotoPerfil != null;

  // "nivel" field.
  String? _nivel;
  String get nivel => _nivel ?? '';
  set nivel(String? val) => _nivel = val;

  bool hasNivel() => _nivel != null;

  // "tipo_user" field.
  String? _tipoUser;
  String get tipoUser => _tipoUser ?? '';
  set tipoUser(String? val) => _tipoUser = val;

  bool hasTipoUser() => _tipoUser != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        nome: data['nome'] as String?,
        email: data['email'] as String?,
        fotoPerfil: data['fotoPerfil'] as String?,
        nivel: data['nivel'] as String?,
        tipoUser: data['tipo_user'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'email': _email,
        'fotoPerfil': _fotoPerfil,
        'nivel': _nivel,
        'tipo_user': _tipoUser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'fotoPerfil': serializeParam(
          _fotoPerfil,
          ParamType.String,
        ),
        'nivel': serializeParam(
          _nivel,
          ParamType.String,
        ),
        'tipo_user': serializeParam(
          _tipoUser,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        fotoPerfil: deserializeParam(
          data['fotoPerfil'],
          ParamType.String,
          false,
        ),
        nivel: deserializeParam(
          data['nivel'],
          ParamType.String,
          false,
        ),
        tipoUser: deserializeParam(
          data['tipo_user'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        nome == other.nome &&
        email == other.email &&
        fotoPerfil == other.fotoPerfil &&
        nivel == other.nivel &&
        tipoUser == other.tipoUser;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nome, email, fotoPerfil, nivel, tipoUser]);
}

UserStruct createUserStruct({
  String? nome,
  String? email,
  String? fotoPerfil,
  String? nivel,
  String? tipoUser,
}) =>
    UserStruct(
      nome: nome,
      email: email,
      fotoPerfil: fotoPerfil,
      nivel: nivel,
      tipoUser: tipoUser,
    );
