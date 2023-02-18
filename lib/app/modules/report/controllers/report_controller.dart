import 'package:get/get.dart';

import '../../../../appcon.dart';
import '../sales_report_model.dart';

class ReportController extends GetConnect {
  //
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SalesReport.fromJson(map);
      if (map is List) {
        return map.map((item) => SalesReport.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = AppCon.api.baseUrl;
    // getSalesReport();
  }

  // Future<SalesReport?>
  // Future<void> getSalesReport() async {
  //   final response = await get('/salesreport/');
  //   // return response.body;
  //   // print(response.body);
  // }

  Future<Response<SalesReport>> postSalesReport(
          SalesReport salesreport) async =>
      await post('salesreport', salesreport);
  Future<Response> deleteSalesReport(int id) async =>
      await delete('salesreport/$id');
}
