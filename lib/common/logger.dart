import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final logger = Logger(
  printer: PrettyPrinter(),
);

final _logger = Logger(printer: SimplePrinter());

final prettyDioLogger = PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: true,
  responseHeader: true,
  error: true,
  compact: true,
  maxWidth: 1000,
  // logPrint: (obj) => _logger.i(obj),
);
