
#ifndef __SIPHASH_IMPL_H__
#define __SIPHASH_IMPL_H__ 1

int siphash24(unsigned char *out, const unsigned char *in,
              unsigned long long inlen, const unsigned char *k);

#endif
