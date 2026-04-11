#ifndef __definitions_h
#define __definitions_h

#include <stdint.h>

#if defined __WINDOWS__ || defined WIN32
#define OTSYS_THREAD_RETURN  void
#define EWOULDBLOCK WSAEWOULDBLOCK
#else
#define OTSYS_THREAD_RETURN void*
typedef int64_t __int64;
#ifndef EWOULDBLOCK
#define EWOULDBLOCK EAGAIN
#endif
#endif

#ifdef XML_GCC_FREE
#define xmlFreeOTSERV(s)	free(s)
#else
#define xmlFreeOTSERV(s)	xmlFree(s)
#endif

#endif // __definitions_h
