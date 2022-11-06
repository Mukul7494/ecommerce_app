import 'package:ecomerce_app/core/modules/auth/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountController extends StateNotifier<AsyncValue<void>> {
  AccountController({required this.authRepository})
      : super(const AsyncData(null));
  final AuthRepository authRepository;

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}

final accountControllerProvider =
    StateNotifierProvider.autoDispose<AccountController, AsyncValue<void>>(
        (ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountController(authRepository: authRepository);
});
