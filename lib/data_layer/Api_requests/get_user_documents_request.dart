import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/models/user_documents/document_list_response.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/data_layer/network/error_handler.dart';
import 'package:dio/dio.dart';

class GetUserDocumentsRequest {
  final dio = DioFactory.getDio();

  Future<GetUserDocumentsResponse> send() async {
    Response response;
    GetUserDocumentsResponse getUserDocumentsResponse;

    try {
      response = await dio.get(ApiEndpoints.getAllUserDocuments,
          options: Options(headers: ApiHeaders.tokenHeader));

      getUserDocumentsResponse =
          GetUserDocumentsResponse.fromJson(response.data);

      return getUserDocumentsResponse;
    } catch (error) {
      var handler = ErrorHandler.handle(error);
      return GetUserDocumentsResponse.empty(handler.failure.message);
    }
  }
}
