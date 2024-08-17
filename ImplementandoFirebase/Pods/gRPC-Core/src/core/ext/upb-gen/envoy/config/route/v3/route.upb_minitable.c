/* This file was generated by upb_generator from the input file:
 *
 *     envoy/config/route/v3/route.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/generated_code_support.h"
#include "envoy/config/route/v3/route.upb_minitable.h"
#include "envoy/config/core/v3/base.upb_minitable.h"
#include "envoy/config/core/v3/config_source.upb_minitable.h"
#include "envoy/config/route/v3/route_components.upb_minitable.h"
#include "google/protobuf/any.upb_minitable.h"
#include "google/protobuf/wrappers.upb_minitable.h"
#include "udpa/annotations/status.upb_minitable.h"
#include "udpa/annotations/versioning.upb_minitable.h"
#include "validate/validate.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

static const upb_MiniTableSub envoy_config_route_v3_RouteConfiguration_submsgs[10] = {
  {.UPB_PRIVATE(submsg) = &envoy__config__route__v3__VirtualHost_msg_init},
  {.UPB_PRIVATE(submsg) = &envoy__config__core__v3__HeaderValueOption_msg_init},
  {.UPB_PRIVATE(submsg) = &envoy__config__core__v3__HeaderValueOption_msg_init},
  {.UPB_PRIVATE(submsg) = &google__protobuf__BoolValue_msg_init},
  {.UPB_PRIVATE(submsg) = &envoy__config__route__v3__Vhds_msg_init},
  {.UPB_PRIVATE(submsg) = &google__protobuf__UInt32Value_msg_init},
  {.UPB_PRIVATE(submsg) = &envoy__config__route__v3__ClusterSpecifierPlugin_msg_init},
  {.UPB_PRIVATE(submsg) = &envoy__config__route__v3__RouteAction__RequestMirrorPolicy_msg_init},
  {.UPB_PRIVATE(submsg) = &envoy__config__route__v3__RouteConfiguration__TypedPerFilterConfigEntry_msg_init},
  {.UPB_PRIVATE(submsg) = &envoy__config__core__v3__Metadata_msg_init},
};

static const upb_MiniTableField envoy_config_route_v3_RouteConfiguration__fields[17] = {
  {1, UPB_SIZE(72, 16), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(12, 32), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(16, 40), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(20, 48), 0, 1, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(24, 56), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(28, 64), 0, 2, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(32, 72), 64, 3, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {8, UPB_SIZE(36, 80), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {9, UPB_SIZE(40, 88), 65, 4, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {10, UPB_SIZE(44, 9), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {11, UPB_SIZE(48, 96), 66, 5, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {12, UPB_SIZE(52, 104), 0, 6, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {13, UPB_SIZE(56, 112), 0, 7, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {14, UPB_SIZE(60, 10), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {15, UPB_SIZE(61, 11), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {16, UPB_SIZE(64, 120), 0, 8, 11, (int)kUpb_FieldMode_Map | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {17, UPB_SIZE(68, 128), 67, 9, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__config__route__v3__RouteConfiguration_msg_init = {
  &envoy_config_route_v3_RouteConfiguration_submsgs[0],
  &envoy_config_route_v3_RouteConfiguration__fields[0],
  UPB_SIZE(80, 136), 17, kUpb_ExtMode_NonExtendable, 17, UPB_FASTTABLE_MASK(120), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001000003f00000a, &upb_pss_1bt},
    {0x002000003f000012, &upb_prm_1bt_maxmaxb},
    {0x002800003f00001a, &upb_prs_1bt},
    {0x003000003f010022, &upb_prm_1bt_maxmaxb},
    {0x003800003f00002a, &upb_prs_1bt},
    {0x004000003f020032, &upb_prm_1bt_maxmaxb},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x005000003f000042, &upb_prs_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000900003f000050, &upb_psb1_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x006800003f060062, &upb_prm_1bt_maxmaxb},
    {0x007000003f07006a, &upb_prm_1bt_maxmaxb},
    {0x000a00003f000070, &upb_psb1_1bt},
    {0x000b00003f000078, &upb_psb1_1bt},
  })
};

static const upb_MiniTableSub envoy_config_route_v3_RouteConfiguration_TypedPerFilterConfigEntry_submsgs[1] = {
  {.UPB_PRIVATE(submsg) = &google__protobuf__Any_msg_init},
};

static const upb_MiniTableField envoy_config_route_v3_RouteConfiguration_TypedPerFilterConfigEntry__fields[2] = {
  {1, 16, 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, 32, 64, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__config__route__v3__RouteConfiguration__TypedPerFilterConfigEntry_msg_init = {
  &envoy_config_route_v3_RouteConfiguration_TypedPerFilterConfigEntry_submsgs[0],
  &envoy_config_route_v3_RouteConfiguration_TypedPerFilterConfigEntry__fields[0],
  48, 2, kUpb_ExtMode_NonExtendable, 2, UPB_FASTTABLE_MASK(8), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001000003f00000a, &upb_pss_1bt},
  })
};

static const upb_MiniTableSub envoy_config_route_v3_Vhds_submsgs[1] = {
  {.UPB_PRIVATE(submsg) = &envoy__config__core__v3__ConfigSource_msg_init},
};

static const upb_MiniTableField envoy_config_route_v3_Vhds__fields[1] = {
  {1, UPB_SIZE(12, 16), 64, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__config__route__v3__Vhds_msg_init = {
  &envoy_config_route_v3_Vhds_submsgs[0],
  &envoy_config_route_v3_Vhds__fields[0],
  UPB_SIZE(16, 24), 1, kUpb_ExtMode_NonExtendable, 1, UPB_FASTTABLE_MASK(255), 0,
};

static const upb_MiniTable *messages_layout[3] = {
  &envoy__config__route__v3__RouteConfiguration_msg_init,
  &envoy__config__route__v3__RouteConfiguration__TypedPerFilterConfigEntry_msg_init,
  &envoy__config__route__v3__Vhds_msg_init,
};

const upb_MiniTableFile envoy_config_route_v3_route_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  3,
  0,
  0,
};

#include "upb/port/undef.inc"

