import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/wid_gen.dart';
import 'package:wid_gen/widgets/ff_scaffold.dart';

class BoardController extends GetxController with StateMixin {

  Map<String,WidGen>? widTree = {"mainKeyScafold":FFScaffold(keyID: "mainKeyScafold")};

  // List<Product> getWishList() => products;
  // @override
  // void onReady() {
  //   super.onReady();
  //   getLocalWishlist();
  // }

  // Future<void> addToWishlist(Product product) async {
  //   product.isFavorite = true;
  //   var fav = Favorite()..product.target = product;

  //   favoritesBox.put(fav);
  //   products.add(product);
  //   update();
  //   print("kkkkk");
  //   change(null, status: RxStatus.success());
  // }

  // Future<void> removeToWishlist(Product product) async {
  //   favoritesBox.getAll().forEach((element) {
  //     if (element.product.target?.id == product.id) {
  //       favoritesBox.remove(element.idLocal);
  //     }

  //     products.add(element.product.target!);
  //   });
  //   getLocalWishlist();
  //   update();
  //   change(null, status: RxStatus.success());
  // }

  // Future<void> getLocalWishlist() async {
  //   products.clear();
  //   favoritesBox.getAll().forEach((element) {
  //     if (element.product.target != null) {
  //       products.add(element.product.target!);
  //     }
  //   });

  //   update();
  //   change(null, status: RxStatus.success());
  // }

  // Future<void> clearWishList() async {
  //   products = [];
  //   favoritesBox.removeAll();
  //   update();
  //   change(null, status: RxStatus.success());
  // }
}
