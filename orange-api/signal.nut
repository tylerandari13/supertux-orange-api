class OSignal extends OCallback {
	function connect(func) {
		if(type(func) == "string") {
			func = compilestring(func)
        }
        connections.push(func)
	}

	function call(...) foreach(connection in connections) {
		local a = ::newthread(connection)
		api_table().thread_fix(a)
		a.call.acall([a].extend(vargv))
	}
}

api_table().Signal <- OSignal
api_table().signal <- OSignal // compatibility

api_table().init_signals <- function() {
	local OSignal_thread = OThread(function() {
		local added_players = {}
		while(true) {
			foreach(i, v in get_players())
				if(!(i in added_players)) {
					added_players[i] <- v
					api_table().get_signal("player_added").call(v, i)
				} else if(added_players.len() > get_players().len()) {
					foreach(i, v in added_players)
						if(!(i in get_players())) {
							api_table().get_signal("player_removed").call(v, i)
							delete added_players[i]
						}
				}
			wait(0.01)
		}
	})
	OSignal_thread.call()
}

api_table().add_signal <- function(name) {
	if(!("OSignals" in api_table())) api_table().OSignals <- {}
	api_table().OSignals[name.tolower()] <- OSignal()
}

api_table().get_signal <- function(name) {
	if(!("OSignals" in api_table())) api_table().add_signal(name)
	if(!(name in api_table().OSignals)) api_table().add_signal(name)
	return api_table().OSignals[name.tolower()]
}

api_table().remove_signal <- function(name) {
	if(!("OSignals" in api_table())) api_table().OSignals <- {}
	delete api_table().OSignals[name.tolower()]
}
