import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/item_model.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
  await Hive.openBox<ItemModel>('favorites');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Latres Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
    );
  }
}