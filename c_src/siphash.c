
#include "siphash.h"
#include "siphash-impl.h"

ERL_NIF_TERM
hash24(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    ErlNifBinary key;
    ErlNifBinary message;
    ErlNifBinary hash;

    if (argc != 2) {
        return enif_make_badarg(env);
    }
    if (enif_inspect_binary(env, argv[0], &key) == 0 ||
        key.size != 16U) {
        return enif_make_badarg(env);
    }
    if (enif_inspect_binary(env, argv[1], &message) == 0 ||
        message.size == 0U) {
        return enif_make_badarg(env);
    }
    enif_alloc_binary(8, &hash);
    siphash24(hash.data, (const unsigned char *) message.data,
              (unsigned long long) message.size,
              (const unsigned char *) key.data);

    return enif_make_binary(env, &hash);
}

static ErlNifFunc nif_funcs[] = {
    { "hash24", 2, hash24 }
};

ERL_NIF_INIT(siphash, nif_funcs, NULL, NULL, NULL, NULL)
