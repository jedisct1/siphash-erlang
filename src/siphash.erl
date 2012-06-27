-module(siphash).
-export([hash24/2]).
-define(NOT_LOADED, not_loaded(?LINE)).
-on_load(init/0).

init() ->
    PrivDir = case code:priv_dir(?MODULE) of
        {error, _} ->
            EbinDir = filename:dirname(code:which(?MODULE)),
            AppPath = filename:dirname(EbinDir),
            filename:join(AppPath, "priv");
        Path ->
            Path
    end,
    erlang:load_nif(filename:join(PrivDir, "siphash"), 0).    

hash24(Key, Message) ->
    nif_hash24(Key, Message).

not_loaded(Line) ->
    erlang:nif_error({not_loaded, [{module, ?MODULE}, {line, Line}]}).
   
nif_hash24(_Key, _Message) ->
    ?NOT_LOADED.
