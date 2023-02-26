///
//  Generated code. Do not modify.
//  source: algorithim.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Timed extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Timed', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Timed._() : super();
  factory Timed({
    $core.int? duration,
  }) {
    final _result = create();
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory Timed.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Timed.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Timed clone() => Timed()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Timed copyWith(void Function(Timed) updates) => super.copyWith((message) => updates(message as Timed)) as Timed; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Timed create() => Timed._();
  Timed createEmptyInstance() => create();
  static $pb.PbList<Timed> createRepeated() => $pb.PbList<Timed>();
  @$core.pragma('dart2js:noInline')
  static Timed getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timed>(create);
  static Timed? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get duration => $_getIZ(0);
  @$pb.TagNumber(1)
  set duration($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearDuration() => clearField(1);
}

class Counted extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Counted', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'counts', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Counted._() : super();
  factory Counted({
    $core.int? counts,
  }) {
    final _result = create();
    if (counts != null) {
      _result.counts = counts;
    }
    return _result;
  }
  factory Counted.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Counted.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Counted clone() => Counted()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Counted copyWith(void Function(Counted) updates) => super.copyWith((message) => updates(message as Counted)) as Counted; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Counted create() => Counted._();
  Counted createEmptyInstance() => create();
  static $pb.PbList<Counted> createRepeated() => $pb.PbList<Counted>();
  @$core.pragma('dart2js:noInline')
  static Counted getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Counted>(create);
  static Counted? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get counts => $_getIZ(0);
  @$pb.TagNumber(1)
  set counts($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCounts() => $_has(0);
  @$pb.TagNumber(1)
  void clearCounts() => clearField(1);
}

class SpikeStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SpikeStart', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SpikeStart._() : super();
  factory SpikeStart() => create();
  factory SpikeStart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpikeStart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SpikeStart clone() => SpikeStart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SpikeStart copyWith(void Function(SpikeStart) updates) => super.copyWith((message) => updates(message as SpikeStart)) as SpikeStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpikeStart create() => SpikeStart._();
  SpikeStart createEmptyInstance() => create();
  static $pb.PbList<SpikeStart> createRepeated() => $pb.PbList<SpikeStart>();
  @$core.pragma('dart2js:noInline')
  static SpikeStart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpikeStart>(create);
  static SpikeStart? _defaultInstance;
}

class Bouncing extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Bouncing', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jumps', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Bouncing._() : super();
  factory Bouncing({
    $core.int? jumps,
  }) {
    final _result = create();
    if (jumps != null) {
      _result.jumps = jumps;
    }
    return _result;
  }
  factory Bouncing.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Bouncing.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Bouncing clone() => Bouncing()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Bouncing copyWith(void Function(Bouncing) updates) => super.copyWith((message) => updates(message as Bouncing)) as Bouncing; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Bouncing create() => Bouncing._();
  Bouncing createEmptyInstance() => create();
  static $pb.PbList<Bouncing> createRepeated() => $pb.PbList<Bouncing>();
  @$core.pragma('dart2js:noInline')
  static Bouncing getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bouncing>(create);
  static Bouncing? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get jumps => $_getIZ(0);
  @$pb.TagNumber(1)
  set jumps($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJumps() => $_has(0);
  @$pb.TagNumber(1)
  void clearJumps() => clearField(1);
}

class BouningRep extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BouningRep', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'averageHeight', $pb.PbFieldType.OU3, protoName: 'averageHeight')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'averageGroundContactTime', $pb.PbFieldType.OU3, protoName: 'averageGroundContactTime')
    ..pc<BounceMeasurment>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'measurements', $pb.PbFieldType.PM, subBuilder: BounceMeasurment.create)
    ..hasRequiredFields = false
  ;

  BouningRep._() : super();
  factory BouningRep({
    $core.int? averageHeight,
    $core.int? averageGroundContactTime,
    $core.Iterable<BounceMeasurment>? measurements,
  }) {
    final _result = create();
    if (averageHeight != null) {
      _result.averageHeight = averageHeight;
    }
    if (averageGroundContactTime != null) {
      _result.averageGroundContactTime = averageGroundContactTime;
    }
    if (measurements != null) {
      _result.measurements.addAll(measurements);
    }
    return _result;
  }
  factory BouningRep.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BouningRep.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BouningRep clone() => BouningRep()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BouningRep copyWith(void Function(BouningRep) updates) => super.copyWith((message) => updates(message as BouningRep)) as BouningRep; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BouningRep create() => BouningRep._();
  BouningRep createEmptyInstance() => create();
  static $pb.PbList<BouningRep> createRepeated() => $pb.PbList<BouningRep>();
  @$core.pragma('dart2js:noInline')
  static BouningRep getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BouningRep>(create);
  static BouningRep? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get averageHeight => $_getIZ(0);
  @$pb.TagNumber(1)
  set averageHeight($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAverageHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearAverageHeight() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get averageGroundContactTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set averageGroundContactTime($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAverageGroundContactTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearAverageGroundContactTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<BounceMeasurment> get measurements => $_getList(2);
}

class BounceMeasurment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BounceMeasurment', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groundContactTime', $pb.PbFieldType.OU3, protoName: 'groundContactTime')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  BounceMeasurment._() : super();
  factory BounceMeasurment({
    $core.int? groundContactTime,
    $core.int? height,
  }) {
    final _result = create();
    if (groundContactTime != null) {
      _result.groundContactTime = groundContactTime;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory BounceMeasurment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BounceMeasurment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BounceMeasurment clone() => BounceMeasurment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BounceMeasurment copyWith(void Function(BounceMeasurment) updates) => super.copyWith((message) => updates(message as BounceMeasurment)) as BounceMeasurment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BounceMeasurment create() => BounceMeasurment._();
  BounceMeasurment createEmptyInstance() => create();
  static $pb.PbList<BounceMeasurment> createRepeated() => $pb.PbList<BounceMeasurment>();
  @$core.pragma('dart2js:noInline')
  static BounceMeasurment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BounceMeasurment>(create);
  static BounceMeasurment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get groundContactTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set groundContactTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroundContactTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroundContactTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);
}

enum AlgorithimConfiguration_EndAlgorithim {
  timed, 
  notSet
}

enum AlgorithimConfiguration_StartAlgorthim {
  spikeStart, 
  notSet
}

enum AlgorithimConfiguration_Configuration {
  bouncing, 
  notSet
}

class AlgorithimConfiguration extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, AlgorithimConfiguration_EndAlgorithim> _AlgorithimConfiguration_EndAlgorithimByTag = {
    1 : AlgorithimConfiguration_EndAlgorithim.timed,
    0 : AlgorithimConfiguration_EndAlgorithim.notSet
  };
  static const $core.Map<$core.int, AlgorithimConfiguration_StartAlgorthim> _AlgorithimConfiguration_StartAlgorthimByTag = {
    2 : AlgorithimConfiguration_StartAlgorthim.spikeStart,
    0 : AlgorithimConfiguration_StartAlgorthim.notSet
  };
  static const $core.Map<$core.int, AlgorithimConfiguration_Configuration> _AlgorithimConfiguration_ConfigurationByTag = {
    3 : AlgorithimConfiguration_Configuration.bouncing,
    0 : AlgorithimConfiguration_Configuration.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AlgorithimConfiguration', createEmptyInstance: create)
    ..oo(0, [1])
    ..oo(1, [2])
    ..oo(2, [3])
    ..aOM<Timed>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timed', subBuilder: Timed.create)
    ..aOM<SpikeStart>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'spikeStart', protoName: 'spikeStart', subBuilder: SpikeStart.create)
    ..aOM<Bouncing>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bouncing', subBuilder: Bouncing.create)
    ..hasRequiredFields = false
  ;

  AlgorithimConfiguration._() : super();
  factory AlgorithimConfiguration({
    Timed? timed,
    SpikeStart? spikeStart,
    Bouncing? bouncing,
  }) {
    final _result = create();
    if (timed != null) {
      _result.timed = timed;
    }
    if (spikeStart != null) {
      _result.spikeStart = spikeStart;
    }
    if (bouncing != null) {
      _result.bouncing = bouncing;
    }
    return _result;
  }
  factory AlgorithimConfiguration.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AlgorithimConfiguration.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AlgorithimConfiguration clone() => AlgorithimConfiguration()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AlgorithimConfiguration copyWith(void Function(AlgorithimConfiguration) updates) => super.copyWith((message) => updates(message as AlgorithimConfiguration)) as AlgorithimConfiguration; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AlgorithimConfiguration create() => AlgorithimConfiguration._();
  AlgorithimConfiguration createEmptyInstance() => create();
  static $pb.PbList<AlgorithimConfiguration> createRepeated() => $pb.PbList<AlgorithimConfiguration>();
  @$core.pragma('dart2js:noInline')
  static AlgorithimConfiguration getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AlgorithimConfiguration>(create);
  static AlgorithimConfiguration? _defaultInstance;

  AlgorithimConfiguration_EndAlgorithim whichEndAlgorithim() => _AlgorithimConfiguration_EndAlgorithimByTag[$_whichOneof(0)]!;
  void clearEndAlgorithim() => clearField($_whichOneof(0));

  AlgorithimConfiguration_StartAlgorthim whichStartAlgorthim() => _AlgorithimConfiguration_StartAlgorthimByTag[$_whichOneof(1)]!;
  void clearStartAlgorthim() => clearField($_whichOneof(1));

  AlgorithimConfiguration_Configuration whichConfiguration() => _AlgorithimConfiguration_ConfigurationByTag[$_whichOneof(2)]!;
  void clearConfiguration() => clearField($_whichOneof(2));

  @$pb.TagNumber(1)
  Timed get timed => $_getN(0);
  @$pb.TagNumber(1)
  set timed(Timed v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimed() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimed() => clearField(1);
  @$pb.TagNumber(1)
  Timed ensureTimed() => $_ensure(0);

  @$pb.TagNumber(2)
  SpikeStart get spikeStart => $_getN(1);
  @$pb.TagNumber(2)
  set spikeStart(SpikeStart v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSpikeStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpikeStart() => clearField(2);
  @$pb.TagNumber(2)
  SpikeStart ensureSpikeStart() => $_ensure(1);

  @$pb.TagNumber(3)
  Bouncing get bouncing => $_getN(2);
  @$pb.TagNumber(3)
  set bouncing(Bouncing v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBouncing() => $_has(2);
  @$pb.TagNumber(3)
  void clearBouncing() => clearField(3);
  @$pb.TagNumber(3)
  Bouncing ensureBouncing() => $_ensure(2);
}

enum Rep_Rep {
  bouningRep, 
  notSet
}

class Rep extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Rep_Rep> _Rep_RepByTag = {
    1 : Rep_Rep.bouningRep,
    0 : Rep_Rep.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Rep', createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<BouningRep>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bouningRep', protoName: 'bouningRep', subBuilder: BouningRep.create)
    ..hasRequiredFields = false
  ;

  Rep._() : super();
  factory Rep({
    BouningRep? bouningRep,
  }) {
    final _result = create();
    if (bouningRep != null) {
      _result.bouningRep = bouningRep;
    }
    return _result;
  }
  factory Rep.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Rep.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Rep clone() => Rep()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Rep copyWith(void Function(Rep) updates) => super.copyWith((message) => updates(message as Rep)) as Rep; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Rep create() => Rep._();
  Rep createEmptyInstance() => create();
  static $pb.PbList<Rep> createRepeated() => $pb.PbList<Rep>();
  @$core.pragma('dart2js:noInline')
  static Rep getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Rep>(create);
  static Rep? _defaultInstance;

  Rep_Rep whichRep() => _Rep_RepByTag[$_whichOneof(0)]!;
  void clearRep() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  BouningRep get bouningRep => $_getN(0);
  @$pb.TagNumber(1)
  set bouningRep(BouningRep v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBouningRep() => $_has(0);
  @$pb.TagNumber(1)
  void clearBouningRep() => clearField(1);
  @$pb.TagNumber(1)
  BouningRep ensureBouningRep() => $_ensure(0);
}

enum Transfer_Message {
  algorithim, 
  rep, 
  notSet
}

class Transfer extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Transfer_Message> _Transfer_MessageByTag = {
    1 : Transfer_Message.algorithim,
    2 : Transfer_Message.rep,
    0 : Transfer_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Transfer', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AlgorithimConfiguration>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Algorithim', protoName: 'Algorithim', subBuilder: AlgorithimConfiguration.create)
    ..aOM<Rep>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rep', subBuilder: Rep.create)
    ..hasRequiredFields = false
  ;

  Transfer._() : super();
  factory Transfer({
    AlgorithimConfiguration? algorithim,
    Rep? rep,
  }) {
    final _result = create();
    if (algorithim != null) {
      _result.algorithim = algorithim;
    }
    if (rep != null) {
      _result.rep = rep;
    }
    return _result;
  }
  factory Transfer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transfer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transfer clone() => Transfer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transfer copyWith(void Function(Transfer) updates) => super.copyWith((message) => updates(message as Transfer)) as Transfer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transfer create() => Transfer._();
  Transfer createEmptyInstance() => create();
  static $pb.PbList<Transfer> createRepeated() => $pb.PbList<Transfer>();
  @$core.pragma('dart2js:noInline')
  static Transfer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transfer>(create);
  static Transfer? _defaultInstance;

  Transfer_Message whichMessage() => _Transfer_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  AlgorithimConfiguration get algorithim => $_getN(0);
  @$pb.TagNumber(1)
  set algorithim(AlgorithimConfiguration v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlgorithim() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlgorithim() => clearField(1);
  @$pb.TagNumber(1)
  AlgorithimConfiguration ensureAlgorithim() => $_ensure(0);

  @$pb.TagNumber(2)
  Rep get rep => $_getN(1);
  @$pb.TagNumber(2)
  set rep(Rep v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRep() => $_has(1);
  @$pb.TagNumber(2)
  void clearRep() => clearField(2);
  @$pb.TagNumber(2)
  Rep ensureRep() => $_ensure(1);
}

