-module(dsip_proxy_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	dsip_proxy_sup:start_link().

stop(_State) ->
	ok.
