// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings to `ios/Classes/witnesscalc.h`.
class WitnessLib {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  WitnessLib(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  WitnessLib.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  /// @return error code:
  /// WITNESSCALC_OK - in case of success.
  /// WITNESSCALC_ERROR - in case of an error.
  ///
  /// On success wtns_buffer is filled with witness data and
  /// wtns_size contains the number bytes copied to wtns_buffer.
  ///
  /// If wtns_buffer is too small then the function returns WITNESSCALC_ERROR_SHORT_BUFFER
  /// and the minimum size for wtns_buffer in wtns_size.
  int witnesscalc(
    ffi.Pointer<ffi.Char> crcuit_buffer,
    int crcuit_size,
    ffi.Pointer<ffi.Char> json_buffer,
    int json_size,
    ffi.Pointer<ffi.Char> wtns_buffer,
    ffi.Pointer<ffi.UnsignedLong> wtns_size,
    ffi.Pointer<ffi.Char> error_msg,
    int error_msg_maxsize,
  ) {
    return _witnesscalc(
      crcuit_buffer,
      crcuit_size,
      json_buffer,
      json_size,
      wtns_buffer,
      wtns_size,
      error_msg,
      error_msg_maxsize,
    );
  }

  late final _witnesscalcPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Char>,
              ffi.UnsignedLong,
              ffi.Pointer<ffi.Char>,
              ffi.UnsignedLong,
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.UnsignedLong>,
              ffi.Pointer<ffi.Char>,
              ffi.UnsignedLong)>>('witnesscalc');
  late final _witnesscalc = _witnesscalcPtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Char>,
          int,
          ffi.Pointer<ffi.Char>,
          int,
          ffi.Pointer<ffi.Char>,
          ffi.Pointer<ffi.UnsignedLong>,
          ffi.Pointer<ffi.Char>,
          int)>();
}

const int WITNESSCALC_OK = 0;

const int WITNESSCALC_ERROR = 1;

const int WITNESSCALC_ERROR_SHORT_BUFFER = 2;
