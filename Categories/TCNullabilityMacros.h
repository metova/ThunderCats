//
//  TCNullabilityMacros.h
//  ThunderCats
//
//  Copyright (c) 2015 Metova Inc.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#ifndef ThunderCats_TCNullabilityMacros_h
#define ThunderCats_TCNullabilityMacros_h

#if __has_feature(nullability)
#define TC_ASSUME_NONNULL_BEGIN _Pragma("clang assume_nonnull begin")
#define TC_ASSUME_NONNULL_END _Pragma("clang assume_nonnull end")
#define tc_nullable nullable
#define tc_nonnull nonnull
#define tc_null_unspecified null_unspecified
#define tc_null_resettable null_resettable
#define __tc_nullable __nullable
#define __tc_nonnull __nonnull
#define __tc_null_unspecified __null_unspecified
#else
#define TC_ASSUME_NONNULL_BEGIN
#define TC_ASSUME_NONNULL_END
#define tc_nullable
#define tc_nonnull
#define tc_null_unspecified
#define tc_null_resettable
#define __tc_nullable
#define __tc_nonnull
#define __tc_null_unspecified
#endif

#endif
