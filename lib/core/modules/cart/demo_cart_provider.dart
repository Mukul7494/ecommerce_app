import '../../../utils/add_delay.dart';
import '../../../utils/mem_store.dart';
import 'cart.dart';
import 'cart_provider.dart';

class FakeRemoteCartRepository implements RemoteCartRepository {
  FakeRemoteCartRepository({this.addDelay = true});
  final bool addDelay;

  /// An InMemoryStore containing the shopping cart data for all users, where:
  /// key: uid of the user
  /// value: Cart of that user
  final _carts = InMemoryStore<Map<String, Cart>>({});

  @override
  Future<Cart> fetchCart(String uid) {
    return Future.value(_carts.value[uid] ?? const Cart());
  }

  @override
  Stream<Cart> watchCart(String uid) {
    return _carts.stream.map((cartData) => cartData[uid] ?? const Cart());
  }

  @override
  Future<void> setCart(String uid, Cart cart) async {
    await delay(addDelay);
    // First, get the current carts data for all users
    final carts = _carts.value;
    // Then, set the cart for the given uid
    carts[uid] = cart;
    // Finally, update the carts data (will emit a new value)
    _carts.value = carts;
  }
}
