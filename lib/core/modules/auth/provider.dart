import 'package:ecomerce_app/utils/add_delay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/app_exception.dart';
import '../../../utils/mem_store.dart';
import 'local_auth/app_user.dart';
import 'local_auth/user_model.dart';

class AuthRepository {
  AuthRepository({this.addDelay = true});
  final bool addDelay;
  final _authState = InMemoryStore<AppUser?>(null);

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  final List<UserModel> _users = [];

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);
    for (final u in _users) {
      if (u.email == email && u.password == password) {
        _authState.value = u;
        return;
      }
      if (u.email == email && u.password != password) {
        throw const AppException.wrongPassword();
      }
    }
    throw const AppException.userNotFound();
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await delay(addDelay);
    for (final u in _users) {
      if (u.email == email) {
        throw const AppException.emailAlreadyInUse();
      }
    }
    if (password.length < 8) {
      throw const AppException.weakPassword();
    }
    _createNewUser(email, password);
  }

  Future<void> signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();

  void _createNewUser(String email, String password) {
    final user = UserModel(
        uid: email.split('').reversed.join(), email: email, password: password);
    _users.add(user);

    _authState.value = user;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
