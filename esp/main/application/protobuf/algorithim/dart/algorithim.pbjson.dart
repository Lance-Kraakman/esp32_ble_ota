///
//  Generated code. Do not modify.
//  source: algorithim.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use timedDescriptor instead')
const Timed$json = const {
  '1': 'Timed',
  '2': const [
    const {'1': 'duration', '3': 1, '4': 1, '5': 13, '10': 'duration'},
  ],
};

/// Descriptor for `Timed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timedDescriptor = $convert.base64Decode('CgVUaW1lZBIaCghkdXJhdGlvbhgBIAEoDVIIZHVyYXRpb24=');
@$core.Deprecated('Use countedDescriptor instead')
const Counted$json = const {
  '1': 'Counted',
  '2': const [
    const {'1': 'counts', '3': 1, '4': 1, '5': 13, '10': 'counts'},
  ],
};

/// Descriptor for `Counted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List countedDescriptor = $convert.base64Decode('CgdDb3VudGVkEhYKBmNvdW50cxgBIAEoDVIGY291bnRz');
@$core.Deprecated('Use spikeStartDescriptor instead')
const SpikeStart$json = const {
  '1': 'SpikeStart',
};

/// Descriptor for `SpikeStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spikeStartDescriptor = $convert.base64Decode('CgpTcGlrZVN0YXJ0');
@$core.Deprecated('Use bouncingDescriptor instead')
const Bouncing$json = const {
  '1': 'Bouncing',
  '2': const [
    const {'1': 'jumps', '3': 1, '4': 1, '5': 13, '10': 'jumps'},
  ],
};

/// Descriptor for `Bouncing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bouncingDescriptor = $convert.base64Decode('CghCb3VuY2luZxIUCgVqdW1wcxgBIAEoDVIFanVtcHM=');
@$core.Deprecated('Use bouningRepDescriptor instead')
const BouningRep$json = const {
  '1': 'BouningRep',
  '2': const [
    const {'1': 'averageHeight', '3': 1, '4': 1, '5': 13, '10': 'averageHeight'},
    const {'1': 'averageGroundContactTime', '3': 2, '4': 1, '5': 13, '10': 'averageGroundContactTime'},
    const {'1': 'measurements', '3': 3, '4': 3, '5': 11, '6': '.BounceMeasurment', '10': 'measurements'},
  ],
};

/// Descriptor for `BouningRep`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bouningRepDescriptor = $convert.base64Decode('CgpCb3VuaW5nUmVwEiQKDWF2ZXJhZ2VIZWlnaHQYASABKA1SDWF2ZXJhZ2VIZWlnaHQSOgoYYXZlcmFnZUdyb3VuZENvbnRhY3RUaW1lGAIgASgNUhhhdmVyYWdlR3JvdW5kQ29udGFjdFRpbWUSNQoMbWVhc3VyZW1lbnRzGAMgAygLMhEuQm91bmNlTWVhc3VybWVudFIMbWVhc3VyZW1lbnRz');
@$core.Deprecated('Use bounceMeasurmentDescriptor instead')
const BounceMeasurment$json = const {
  '1': 'BounceMeasurment',
  '2': const [
    const {'1': 'groundContactTime', '3': 1, '4': 1, '5': 13, '10': 'groundContactTime'},
    const {'1': 'height', '3': 2, '4': 1, '5': 13, '10': 'height'},
  ],
};

/// Descriptor for `BounceMeasurment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bounceMeasurmentDescriptor = $convert.base64Decode('ChBCb3VuY2VNZWFzdXJtZW50EiwKEWdyb3VuZENvbnRhY3RUaW1lGAEgASgNUhFncm91bmRDb250YWN0VGltZRIWCgZoZWlnaHQYAiABKA1SBmhlaWdodA==');
@$core.Deprecated('Use algorithimConfigurationDescriptor instead')
const AlgorithimConfiguration$json = const {
  '1': 'AlgorithimConfiguration',
  '2': const [
    const {'1': 'timed', '3': 1, '4': 1, '5': 11, '6': '.Timed', '9': 0, '10': 'timed'},
    const {'1': 'spikeStart', '3': 2, '4': 1, '5': 11, '6': '.SpikeStart', '9': 1, '10': 'spikeStart'},
    const {'1': 'bouncing', '3': 3, '4': 1, '5': 11, '6': '.Bouncing', '9': 2, '10': 'bouncing'},
  ],
  '8': const [
    const {'1': 'endAlgorithim'},
    const {'1': 'startAlgorthim'},
    const {'1': 'configuration'},
  ],
};

/// Descriptor for `AlgorithimConfiguration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List algorithimConfigurationDescriptor = $convert.base64Decode('ChdBbGdvcml0aGltQ29uZmlndXJhdGlvbhIeCgV0aW1lZBgBIAEoCzIGLlRpbWVkSABSBXRpbWVkEi0KCnNwaWtlU3RhcnQYAiABKAsyCy5TcGlrZVN0YXJ0SAFSCnNwaWtlU3RhcnQSJwoIYm91bmNpbmcYAyABKAsyCS5Cb3VuY2luZ0gCUghib3VuY2luZ0IPCg1lbmRBbGdvcml0aGltQhAKDnN0YXJ0QWxnb3J0aGltQg8KDWNvbmZpZ3VyYXRpb24=');
@$core.Deprecated('Use repDescriptor instead')
const Rep$json = const {
  '1': 'Rep',
  '2': const [
    const {'1': 'bouningRep', '3': 1, '4': 1, '5': 11, '6': '.BouningRep', '9': 0, '10': 'bouningRep'},
  ],
  '8': const [
    const {'1': 'rep'},
  ],
};

/// Descriptor for `Rep`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repDescriptor = $convert.base64Decode('CgNSZXASLQoKYm91bmluZ1JlcBgBIAEoCzILLkJvdW5pbmdSZXBIAFIKYm91bmluZ1JlcEIFCgNyZXA=');
@$core.Deprecated('Use transferDescriptor instead')
const Transfer$json = const {
  '1': 'Transfer',
  '2': const [
    const {'1': 'Algorithim', '3': 1, '4': 1, '5': 11, '6': '.AlgorithimConfiguration', '9': 0, '10': 'Algorithim'},
    const {'1': 'rep', '3': 2, '4': 1, '5': 11, '6': '.Rep', '9': 0, '10': 'rep'},
  ],
  '8': const [
    const {'1': 'message'},
  ],
};

/// Descriptor for `Transfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferDescriptor = $convert.base64Decode('CghUcmFuc2ZlchI6CgpBbGdvcml0aGltGAEgASgLMhguQWxnb3JpdGhpbUNvbmZpZ3VyYXRpb25IAFIKQWxnb3JpdGhpbRIYCgNyZXAYAiABKAsyBC5SZXBIAFIDcmVwQgkKB21lc3NhZ2U=');
