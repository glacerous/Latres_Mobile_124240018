import 'package:get/get.dart';
import '../models/item_model.dart';
import '../services/api_service.dart';

class DetailController extends GetxController {
  final Rx<ItemModel?> _item = Rx<ItemModel?>(null);
  final RxBool _isLoading = true.obs;

  ItemModel? get item => _item.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    final int id = Get.arguments as int;
    fetchDetail(id);
  }

  Future<void> fetchDetail(int id) async {
    try {
      _isLoading.value = true;
      _item.value = await ApiService.fetchItemDetail(id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
}