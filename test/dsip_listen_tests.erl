-module(dsip_listen_tests).
-include_lib("eunit/include/eunit.hrl").

send_test_() ->
    {   setup,
        fun start/0,               % setup function
        fun stop/1,                % teardown function
        fun send/1 }.              % instantiator
 
start() ->
    Pid = dsip_listen:start_link(),
    Pid.
 
stop(Pid) ->
    Pid.
 
send(Pid) ->
    {ok, Socket1} = gen_udp:open(60000, [binary, {active, false}]),
    Mess = <<"Hello">>,
    ok = dsip_listen:send({127,0,0,1},60000,Mess),
    Recv = gen_udp:recv(Socket1, 0),
    {ok, {_Address , _Port , Res}} = Recv,
    [?_assertEqual(Mess, Res)].