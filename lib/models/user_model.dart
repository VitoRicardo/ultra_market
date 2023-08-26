import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({required this.id, this.email, this.name, this.photo});
  final String id;
  final String? email;
  final String? name;
  final String? photo;

  static const empty = UserModel(id: '');

  // Não compreendi pq está sendo criado duas variáveis que possuem a mesma lógica
  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap.id,
      email: snap['email'],
      name: snap['name'],
      photo: snap['photo'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {'id': id, 'email': email, 'name': name, 'photo': photo};
  }

  @override
  List<Object?> get props => [email, id, name, photo];

  @override
  String toString() {
    return 'User>>> id:$id, email: $email, name: $name, photo: $photo';
  }
}
