import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/models/delete_document/delete_document_response.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/data_layer/network/error_handler.dart';
import 'package:dio/dio.dart';

class DeleteDocumentRequest {
  final String id;
  final dio = DioFactory.getDio();

  DeleteDocumentRequest(this.id);

  Future<DeleteDocumentResponse> send() async {
    try {
      await dio.delete("${ApiEndpoints.deleteDocument}$id",
          options: Options(headers: ApiHeaders.tokenHeader));

      return DeleteDocumentResponse(
          status: AppStrings.success, message: "Deleted");
    } catch (error) {
      var handler = ErrorHandler.handle(error);

      return DeleteDocumentResponse(
          status: AppStrings.failure, message: handler.failure.message);
    }
  }
}
