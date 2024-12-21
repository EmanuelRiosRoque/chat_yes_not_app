import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {

  final _dio = Dio(BaseOptions());
  Future<Message> getAnswer() async {
    final response = await _dio.get('http://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    
    return yesNoModel.toMessageEntity();
  }
}