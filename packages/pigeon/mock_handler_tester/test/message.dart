// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
// Autogenerated from Pigeon (v6.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

/// This comment is to test enum documentation comments.
///
/// This comment also tests multiple line comments.
///
/// ////////////////////////
/// This comment also tests comments that start with '/'
/// ////////////////////////
enum MessageRequestState {
  pending,
  success,
  failure,
}

/// This comment is to test class documentation comments.
///
/// This comment also tests multiple line comments.
class MessageSearchRequest {
  MessageSearchRequest({
    this.query,
    this.anInt,
    this.aBool,
  });

  /// This comment is to test field documentation comments.
  String? query;

  /// This comment is to test field documentation comments.
  int? anInt;

  /// This comment is to test field documentation comments.
  bool? aBool;

  Object encode() {
    return <Object?>[
      query,
      anInt,
      aBool,
    ];
  }

  static MessageSearchRequest decode(Object result) {
    result as List<Object?>;
    return MessageSearchRequest(
      query: result[0] as String?,
      anInt: result[1] as int?,
      aBool: result[2] as bool?,
    );
  }
}

/// This comment is to test class documentation comments.
class MessageSearchReply {
  MessageSearchReply({
    this.result,
    this.error,
    this.state,
  });

  /// This comment is to test field documentation comments.
  ///
  /// This comment also tests multiple line comments.
  String? result;

  /// This comment is to test field documentation comments.
  String? error;

  /// This comment is to test field documentation comments.
  MessageRequestState? state;

  Object encode() {
    return <Object?>[
      result,
      error,
      state?.index,
    ];
  }

  static MessageSearchReply decode(Object result) {
    result as List<Object?>;
    return MessageSearchReply(
      result: result[0] as String?,
      error: result[1] as String?,
      state: result[2] != null
          ? MessageRequestState.values[result[2]! as int]
          : null,
    );
  }
}

/// This comment is to test class documentation comments.
class MessageNested {
  MessageNested({
    this.request,
  });

  /// This comment is to test field documentation comments.
  MessageSearchRequest? request;

  Object encode() {
    return <Object?>[
      request?.encode(),
    ];
  }

  static MessageNested decode(Object result) {
    result as List<Object?>;
    return MessageNested(
      request: result[0] != null
          ? MessageSearchRequest.decode(result[0]! as List<Object?>)
          : null,
    );
  }
}

class _MessageApiCodec extends StandardMessageCodec {
  const _MessageApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MessageSearchReply) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is MessageSearchRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MessageSearchReply.decode(readValue(buffer)!);

      case 129:
        return MessageSearchRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// This comment is to test api documentation comments.
///
/// This comment also tests multiple line comments.
class MessageApi {
  /// Constructor for [MessageApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MessageApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _MessageApiCodec();

  /// This comment is to test documentation comments.
  ///
  /// This comment also tests multiple line comments.
  Future<void> initialize() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.MessageApi.initialize', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  /// This comment is to test method documentation comments.
  Future<MessageSearchReply> search(MessageSearchRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.MessageApi.search', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_request]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as MessageSearchReply?)!;
    }
  }
}

class _MessageNestedApiCodec extends StandardMessageCodec {
  const _MessageNestedApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MessageNested) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is MessageSearchReply) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is MessageSearchRequest) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MessageNested.decode(readValue(buffer)!);

      case 129:
        return MessageSearchReply.decode(readValue(buffer)!);

      case 130:
        return MessageSearchRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// This comment is to test api documentation comments.
class MessageNestedApi {
  /// Constructor for [MessageNestedApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MessageNestedApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _MessageNestedApiCodec();

  /// This comment is to test method documentation comments.
  ///
  /// This comment also tests multiple line comments.
  Future<MessageSearchReply> search(MessageNested arg_nested) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.MessageNestedApi.search', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_nested]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as MessageSearchReply?)!;
    }
  }
}

class _MessageFlutterSearchApiCodec extends StandardMessageCodec {
  const _MessageFlutterSearchApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MessageSearchReply) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is MessageSearchRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MessageSearchReply.decode(readValue(buffer)!);

      case 129:
        return MessageSearchRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// This comment is to test api documentation comments.
abstract class MessageFlutterSearchApi {
  static const MessageCodec<Object?> codec = _MessageFlutterSearchApiCodec();

  /// This comment is to test method documentation comments.
  MessageSearchReply search(MessageSearchRequest request);

  static void setup(MessageFlutterSearchApi? api,
      {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.MessageFlutterSearchApi.search', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.MessageFlutterSearchApi.search was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final MessageSearchRequest? arg_request =
              (args[0] as MessageSearchRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.MessageFlutterSearchApi.search was null, expected non-null MessageSearchRequest.');
          final MessageSearchReply output = api.search(arg_request!);
          return output;
        });
      }
    }
  }
}
