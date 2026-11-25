//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/site_kind.dart';
import 'package:casama_api/src/model/local_capabilities.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_local_device_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateLocalDeviceRequest {
  /// Returns a new [UpdateLocalDeviceRequest] instance.
  UpdateLocalDeviceRequest({

     this.name,

     this.capabilities,

     this.allowedRoots,

     this.allowedBotIds,

     this.allBots,

     this.browserMode,

     this.allowedSites,

     this.blockedSites,

     this.neverAskSites,

     this.allowedKinds,

     this.allowedCodingAgents,

     this.enabled,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'capabilities',
    required: false,
    includeIfNull: false,
  )


  final LocalCapabilities? capabilities;



  @JsonKey(
    
    name: r'allowed_roots',
    required: false,
    includeIfNull: false,
  )


  final List<String>? allowedRoots;



  @JsonKey(
    
    name: r'allowed_bot_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? allowedBotIds;



  @JsonKey(
    
    name: r'all_bots',
    required: false,
    includeIfNull: false,
  )


  final bool? allBots;



  @JsonKey(
    
    name: r'browser_mode',
    required: false,
    includeIfNull: false,
  )


  final UpdateLocalDeviceRequestBrowserModeEnum? browserMode;



  @JsonKey(
    
    name: r'allowed_sites',
    required: false,
    includeIfNull: false,
  )


  final List<String>? allowedSites;



  @JsonKey(
    
    name: r'blocked_sites',
    required: false,
    includeIfNull: false,
  )


  final List<String>? blockedSites;



  @JsonKey(
    
    name: r'never_ask_sites',
    required: false,
    includeIfNull: false,
  )


  final List<String>? neverAskSites;



  @JsonKey(
    
    name: r'allowed_kinds',
    required: false,
    includeIfNull: false,
  )


  final List<SiteKind>? allowedKinds;



      /// Coding agents beyond the built-in five allowed on this computer (D-370); one Allow each
  @JsonKey(
    
    name: r'allowed_coding_agents',
    required: false,
    includeIfNull: false,
  )


  final List<String>? allowedCodingAgents;



  @JsonKey(
    
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateLocalDeviceRequest &&
      other.name == name &&
      other.capabilities == capabilities &&
      other.allowedRoots == allowedRoots &&
      other.allowedBotIds == allowedBotIds &&
      other.allBots == allBots &&
      other.browserMode == browserMode &&
      other.allowedSites == allowedSites &&
      other.blockedSites == blockedSites &&
      other.neverAskSites == neverAskSites &&
      other.allowedKinds == allowedKinds &&
      other.allowedCodingAgents == allowedCodingAgents &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        name.hashCode +
        capabilities.hashCode +
        allowedRoots.hashCode +
        allowedBotIds.hashCode +
        allBots.hashCode +
        browserMode.hashCode +
        allowedSites.hashCode +
        blockedSites.hashCode +
        neverAskSites.hashCode +
        allowedKinds.hashCode +
        allowedCodingAgents.hashCode +
        enabled.hashCode;

  factory UpdateLocalDeviceRequest.fromJson(Map<String, dynamic> json) => _$UpdateLocalDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateLocalDeviceRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum UpdateLocalDeviceRequestBrowserModeEnum {
@JsonValue(r'ask')
ask(r'ask'),
@JsonValue(r'computer')
computer(r'computer'),
@JsonValue(r'device')
device(r'device');

const UpdateLocalDeviceRequestBrowserModeEnum(this.value);

final String value;

@override
String toString() => value;
}


