// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map json) {
  return $checkedNew('Config', json, () {
    $checkKeys(json, requiredKeys: const ['builders']);
    var val = new Config(
        builders: $checkedConvert(
            json,
            'builders',
            (v) => (v as Map)?.map((k, e) => new MapEntry(k as String,
                e == null ? null : new Builder.fromJson(e as Map)))));
    return val;
  });
}

abstract class _$ConfigSerializerMixin {
  Map<String, Builder> get builders;
  Map<String, dynamic> toJson() => <String, dynamic>{'builders': builders};
}

Builder _$BuilderFromJson(Map json) {
  return $checkedNew('Builder', json, () {
    $checkKeys(json, allowedKeys: const [
      'target',
      'import',
      'is_optional',
      'configLocation',
      'auto_apply',
      'build_to',
      'defaultEnumTest',
      'builder_factories',
      'applies_builders',
      'required_inputs',
      'build_extensions'
    ], disallowNullValues: const [
      'configLocation',
      'auto_apply'
    ]);
    var val = new Builder(
        import: $checkedConvert(json, 'import', (v) => v as String),
        target: $checkedConvert(json, 'target', (v) => v as String),
        isOptional: $checkedConvert(json, 'is_optional', (v) => v as bool),
        autoApply: $checkedConvert(json, 'auto_apply',
            (v) => v == null ? null : _autoApplyFromJson(v as String)),
        buildTo: $checkedConvert(json, 'build_to',
            (v) => $enumDecodeNullable('BuildTo', BuildTo.values, v as String)),
        defaultEnumTest: $checkedConvert(
            json,
            'defaultEnumTest',
            (v) => $enumDecodeNullable(
                'AutoApply', AutoApply.values, v as String)),
        builderFactories: $checkedConvert(json, 'builder_factories',
            (v) => (v as List).map((e) => e as String).toList()),
        appliesBuilders: $checkedConvert(json, 'applies_builders',
            (v) => (v as List)?.map((e) => e as String)?.toList()),
        requiredInputs: $checkedConvert(json, 'required_inputs',
            (v) => (v as List)?.map((e) => e as String)?.toList()),
        buildExtentions: $checkedConvert(
            json,
            'build_extensions',
            (v) => (v as Map)?.map((k, e) => new MapEntry(
                k as String, (e as List)?.map((e) => e as String)?.toList()))),
        configLocation: $checkedConvert(json, 'configLocation',
            (v) => v == null ? null : Uri.parse(v as String)));
    return val;
  }, fieldKeyMap: const {
    'isOptional': 'is_optional',
    'autoApply': 'auto_apply',
    'buildTo': 'build_to',
    'builderFactories': 'builder_factories',
    'appliesBuilders': 'applies_builders',
    'requiredInputs': 'required_inputs',
    'buildExtentions': 'build_extensions'
  });
}

abstract class _$BuilderSerializerMixin {
  String get target;
  String get import;
  bool get isOptional;
  Uri get configLocation;
  AutoApply get autoApply;
  BuildTo get buildTo;
  AutoApply get defaultEnumTest;
  List<String> get builderFactories;
  List<String> get appliesBuilders;
  List<String> get requiredInputs;
  Map<String, List<String>> get buildExtentions;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('target', target);
    writeNotNull('import', import);
    writeNotNull('is_optional', isOptional);
    writeNotNull('configLocation', configLocation?.toString());
    writeNotNull(
        'auto_apply', autoApply == null ? null : _autoApplyToJson(autoApply));
    writeNotNull('build_to', buildTo?.toString()?.split('.')?.last);
    writeNotNull(
        'defaultEnumTest', defaultEnumTest?.toString()?.split('.')?.last);
    val['builder_factories'] = builderFactories;
    writeNotNull('applies_builders', appliesBuilders);
    writeNotNull('required_inputs', requiredInputs);
    writeNotNull('build_extensions', buildExtentions);
    return val;
  }
}
