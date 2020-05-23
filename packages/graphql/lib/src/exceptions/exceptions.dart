import 'package:gql_link/gql_link.dart' show LinkException;
import 'package:graphql/src/exceptions/exceptions_next.dart'
    show UnknownException;

export 'package:graphql/src/exceptions/exceptions_next.dart';

import 'package:graphql/src/exceptions/network.dart'
    if (dart.library.io) 'package:graphql/src/exceptions/network_io.dart'
    as network;

LinkException translateFailure(dynamic failure) {
  if (failure is LinkException) {
    return failure;
  }
  return network.translateFailure(failure) ?? UnknownException(failure);
}