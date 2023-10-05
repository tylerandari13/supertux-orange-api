function get_sector() {
	try {
		return sector
	} 	catch(e) {
		try {
			return worldmap
		} catch(e) {
			return {}
		}
	}
}

if(!("orange_api" in get_sector())) get_sector().orange_api <- {}

function get_api_table() return get_sector().orange_api

function help() {
	display_text_file("orange-api/help.stxt")
}

function print(...) {
	local stronk = ""
	foreach(v in vargv) stronk += v.tostring()
	::print("[ORANGE API]" + stronk)
}

class OObject {
	object = null
	odata = null

	constructor(obj) {
		odata = {} // we dont want all odatas to point to the same table
		object = get_sector()[obj]
		delete get_sector()[obj]
		get_sector()[obj] <- this
	}

	function _get(key) {
		try {
			return this[key]
		} catch(e) try {
			return object[key]
		} catch(e) try {
			return odata[key]
		} catch(e) {
			throw null
		}
	}

	function _set(key, value) {
		try {
			return this[key] = value
		} catch(e) try {
			return odata[key] = value
		} catch(e) {
			throw e
		}
	}

	function _newslot(key, value) {
		return odata[key] <- value
	}
	
	function _delslot(key) {
		return delete odata[key]
    }
}