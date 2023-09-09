import 'package:elredio_assignment_2/service/response/api_status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.initial() : status = Status.initial;

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data";
  }
}
