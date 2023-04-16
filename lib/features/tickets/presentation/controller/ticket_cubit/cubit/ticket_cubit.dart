import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitialState());

  static TicketCubit get(context) => BlocProvider.of(context);

  final screenshotCon = ScreenshotController();

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now().toString();
    final name = 'ticket $time';
    final result = await ImageGallerySaver.saveImage(bytes);
    return result['filePath'];
  }
}
