PROJECT = dsip_proxy
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0

DEPS = ersip
dep_ersip = git http://github.com/poroh/ersip.git master

# DEPS = erl_lru
# dep_erl_lru = git http://github.com/poroh/erl_lru.git master

# DEPS = nkpacket
# dep_nkpacket = git http://github.com/poroh/nkpacket.git master

include erlang.mk
