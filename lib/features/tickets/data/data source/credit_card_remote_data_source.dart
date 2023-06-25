import 'package:traind_app/features/tickets/data/models/third%20screen/credit_card_model.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/custome_id_model.dart';
import 'package:traind_app/features/tickets/domain/entities/third%20screen/customer_id_entity.dart';

import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/services/api_service.dart';

abstract class CreditCardRemoteDataSource {
  Future<CustomerIdEntity> creditCardInfo(CreditCardModel model);
}

class CreditCardRemoteDataSourceImpl extends CreditCardRemoteDataSource {
  final ApiService apiService;
  CreditCardRemoteDataSourceImpl(
     this.apiService,
  );
  @override
  Future<CustomerIdEntity> creditCardInfo(CreditCardModel model) async {
    var data = await apiService.post(
      endPoint: ApiConstants.creditCardEndPoint,
      data: model.toJson(),
    );

    CustomerIdEntity CustomerId = CustomerIdModel.fromJson(data);
    return CustomerId;
  }
}