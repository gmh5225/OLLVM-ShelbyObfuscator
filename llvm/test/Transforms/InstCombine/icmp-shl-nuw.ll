; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

define i1 @icmp_ugt_32(i64) {
; CHECK-LABEL: @icmp_ugt_32(
; CHECK-NEXT:    [[D:%.*]] = icmp ne i64 %0, 0
; CHECK-NEXT:    ret i1 [[D]]
;
  %c = shl nuw i64 %0, 32
  %d = icmp ugt i64 %c, 4294967295
  ret i1 %d
}

define i1 @icmp_ule_64(i128) {
; CHECK-LABEL: @icmp_ule_64(
; CHECK-NEXT:    [[D:%.*]] = icmp eq i128 %0, 0
; CHECK-NEXT:    ret i1 [[D]]
;
  %c = shl nuw i128 %0, 64
  %d = icmp ule i128 %c, 18446744073709551615
  ret i1 %d
}

define i1 @icmp_ugt_16(i64) {
; CHECK-LABEL: @icmp_ugt_16(
; CHECK-NEXT:    [[D:%.*]] = icmp ugt i64 %0, 15
; CHECK-NEXT:    ret i1 [[D]]
;
  %c = shl nuw i64 %0, 16
  %d = icmp ugt i64 %c, 1048575 ; 0x0f_ffff
  ret i1 %d
}

define <2 x i1> @icmp_ule_16x2(<2 x i64>) {
; CHECK-LABEL: @icmp_ule_16x2(
; CHECK-NEXT:    [[D:%.*]] = icmp eq <2 x i64> %0, zeroinitializer
; CHECK-NEXT:    ret <2 x i1> [[D]]
;
  %c = shl nuw <2 x i64> %0, <i64 16, i64 16>
  %d = icmp ule <2 x i64> %c, <i64 65535, i64 65535>
  ret <2 x i1> %d
}

define <2 x i1> @icmp_ule_16x2_nonzero(<2 x i64>) {
; CHECK-LABEL: @icmp_ule_16x2_nonzero(
; CHECK-NEXT:    [[D:%.*]] = icmp ult <2 x i64> %0, <i64 4, i64 4>
; CHECK-NEXT:    ret <2 x i1> [[D]]
;
  %c = shl nuw <2 x i64> %0, <i64 16, i64 16>
  %d = icmp ule <2 x i64> %c, <i64 196608, i64 196608>  ; 0x03_0000
  ret <2 x i1> %d
}

define <2 x i1> @icmp_ule_12x2(<2 x i64>) {
; CHECK-LABEL: @icmp_ule_12x2(
; CHECK-NEXT:    [[D:%.*]] = icmp ult <2 x i64> %0, <i64 4, i64 4>
; CHECK-NEXT:    ret <2 x i1> [[D]]
;
  %c = shl nuw <2 x i64> %0, <i64 12, i64 12>
  %d = icmp ule <2 x i64> %c, <i64 12288, i64 12288>  ; 0x3000
  ret <2 x i1> %d
}

define i1 @icmp_ult_8(i64) {
; CHECK-LABEL: @icmp_ult_8(
; CHECK-NEXT:    [[D:%.*]] = icmp ult i64 %0, 16
; CHECK-NEXT:    ret i1 [[D]]
;
  %c = shl nuw i64 %0, 8
  %d = icmp ult i64 %c, 4095 ; 0x0fff
  ret i1 %d
}

define <2 x i1> @icmp_uge_8x2(<2 x i16>) {
; CHECK-LABEL: @icmp_uge_8x2(
; CHECK-NEXT:    [[D:%.*]] = icmp ugt <2 x i16> %0, <i16 15, i16 15>
; CHECK-NEXT:    ret <2 x i1> [[D]]
;
  %c = shl nuw <2 x i16> %0, <i16 8, i16 8>
  %d = icmp uge <2 x i16> %c, <i16 4095, i16 4095>
  ret <2 x i1> %d
}

define <2 x i1> @icmp_ugt_16x2(<2 x i32>) {
; CHECK-LABEL: @icmp_ugt_16x2(
; CHECK-NEXT:    [[D:%.*]] = icmp ugt <2 x i32> %0, <i32 15, i32 15>
; CHECK-NEXT:    ret <2 x i1> [[D]]
;
  %c = shl nuw <2 x i32> %0, <i32 16, i32 16>
  %d = icmp ugt <2 x i32> %c, <i32 1048575, i32 1048575>
  ret <2 x i1> %d
}