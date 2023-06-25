import 'package:equatable/equatable.dart';
import 'package:traind_app/features/tickets/data/models/trip_times_model.dart';

// ignore: must_be_immutable
class TripTimesEntity extends Equatable {
  List<dynamic> tripTimes;
  TripTimesEntity({
    required this.tripTimes,
  });

  @override
  List<Object?> get props => [tripTimes];
  factory TripTimesEntity.toEntity(TripTimesModel scheduleModel) {
    return TripTimesEntity(tripTimes: scheduleModel.tripTimes);
  }
}
