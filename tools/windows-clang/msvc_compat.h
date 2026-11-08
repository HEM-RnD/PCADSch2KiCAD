/* Host build shim: GCC/glibc-isms used by PCADSch2KiCAD, compiled with clang against the MSVC CRT. */
#ifndef MSVC_COMPAT_H
#define MSVC_COMPAT_H
#define _USE_MATH_DEFINES
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <BaseTsd.h>
#undef min
#undef max
typedef SSIZE_T ssize_t;
#define strcasecmp _stricmp
static inline void sincos( double a, double *s, double *c ) { *s = sin( a ); *c = cos( a ); }
#endif
