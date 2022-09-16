import 'package:coscos/page/dashboard/controller/dashboard_controller.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    //Cannot using tag because the controller used in GetView
    // Get.put<DashboardController>(DashboardController());
    Get.put<MainController>(MainController(), permanent: true);
    Get.put<DashboardController>(DashboardController(), permanent: true);
    // Get.put<ProfileController>(ProfileController(), permanent: true);
    // Get.lazyPut<SpecimenController>(() => SpecimenController(), fenix: true);
    // Get.lazyPut<BulkController>(() => BulkController(), fenix: true);
    // Get.put<SpecimenSignController>(SpecimenSignController());
    // Get.put<DashboardController>(DashboardController());
    // Get.put<DocumentsController>(DocumentsController(), permanent: true);
    // Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    // Get.lazyPut(()=>BulkAddDocController());
  }
}
