import 'package:ultra_market/models/user_model.dart';

abstract class IUserRepository {
  Stream<UserModel> getUser(String userId);
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
}
