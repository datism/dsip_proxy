{application, 'dsip_proxy', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['dsip_listen','dsip_proxy_app','dsip_proxy_sup']},
	{registered, [dsip_proxy_sup]},
	{applications, [kernel,stdlib]},
	{optional_applications, []},
	{mod, {dsip_proxy_app, []}},
	{env, []}
]}.