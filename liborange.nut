// items are to be listed in order of importance. if a script needs stuff from another script to function put it above. other than that i guess just follow alphabetical order
foreach(file in [
	"orange_api_util"

	"callback"
	"signal"
	"text"
	"thread"

	"badguy"
	"bumper"
	"button"
	"camera"
	"class"
	"console"
	"control"
	"grumbel"
	"location"
	"misc"
	"multiplayer"
	"oobject"
	"rand"
	"scriptloader"
	"state"
	"table"
	"test"
	"tilemap"
	"trampoline"
]) import("orange-api/" + file + ".nut")
