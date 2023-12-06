-module(dsip_listen).
-behaviour(gen_server).

%% API.
-export([start_link/0]).
-export([send/3]).

%% gen_server.
-export([init/1]).
-export([handle_call/3]).
-export([handle_cast/2]).
-export([handle_info/2]).
-export([terminate/2]).
-export([code_change/3]).

-record(state, {
	socket :: gen_udp:socket()
}).

%% API.

-spec start_link() -> {ok, pid()}.
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

send(Address, Port, Data) ->
	gen_server:call(?MODULE, {send_mess, Address, Port, Data}).

%% gen_server.

init([]) ->
	{ok, Socket} = gen_udp:open(50000, [binary, {active, true}]),
	{ok, #state{socket=Socket}}.

handle_call({send_mess, Address, Port, Data}, _ , State = #state{socket=Socket}) ->
    gen_udp:send(Socket, Address, Port, Data),
    {reply, ok, State};

handle_call(_Request, _From, State) ->
	{reply, ignored, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_info(_Info, State) ->
	{noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.
