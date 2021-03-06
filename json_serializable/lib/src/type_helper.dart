// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

abstract class SerializeContext {
  bool get nullable;
  bool get useWrappers;

  /// [expression] may be just the name of the field or it may an expression
  /// representing the serialization of a value.
  String serialize(DartType fieldType, String expression);
  List<ElementAnnotation> get metadata;
}

abstract class DeserializeContext {
  bool get nullable;
  String deserialize(DartType fieldType, String expression);
  List<ElementAnnotation> get metadata;
}

abstract class TypeHelper {
  const TypeHelper();

  /// Returns Dart code that serializes an [expression] representing a Dart
  /// object of type [targetType].
  ///
  /// If [targetType] is not supported, returns `null`.
  ///
  /// Let's say you want to serialize a class `Foo` as just its `id` property
  /// of type `int`.
  ///
  /// Treating [expression] as a opaque Dart expression, the [serialize]
  /// implementation could be a simple as:
  ///
  /// ```dart
  /// String serialize(DartType targetType, String expression) =>
  ///   "$expression.id";
  /// ```.
  // TODO(kevmoo) – document `context`
  String serialize(
      DartType targetType, String expression, SerializeContext context);

  /// Returns Dart code that deserializes an [expression] representing a JSON
  /// literal to into [targetType].
  ///
  /// If [targetType] is not supported, returns `null`.
  ///
  /// Let's say you want to deserialize a class `Foo` by taking an `int` stored
  /// in a JSON literal and calling the `Foo.fromInt` constructor.
  ///
  /// Treating [expression] as a opaque Dart expression representing a JSON
  /// literal, the [deserialize] implementation could be a simple as:
  ///
  /// ```dart
  /// String deserialize(DartType targetType, String expression) =>
  ///   "new Foo.fromInt($expression)";
  /// ```.
  ///
  /// Note that [targetType] is not used here. If you wanted to support many
  /// types of [targetType] you could write:
  ///
  /// ```dart
  /// String deserialize(DartType targetType, String expression) =>
  ///   "new ${targetType.name}.fromInt($expression)";
  /// ```.
  // TODO(kevmoo) – document `context`
  String deserialize(
      DartType targetType, String expression, DeserializeContext context);
}

class UnsupportedTypeError extends Error {
  final String expression;
  final DartType type;
  final String reason;

  UnsupportedTypeError(this.type, this.expression, this.reason);
}

String commonNullPrefix(
        bool nullable, String expression, String unsafeExpression) =>
    nullable
        ? '$expression == null ? null : $unsafeExpression'
        : unsafeExpression;
