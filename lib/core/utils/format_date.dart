import 'package:intl/intl.dart';

String formatDateByDDMMYYY(DateTime dateTime){
  return DateFormat("d MMM, yyyy").format(dateTime);
}