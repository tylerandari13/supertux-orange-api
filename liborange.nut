// items are to be listed in order of importance. if a script needs stuff from another script to function put it above. other than that i guess just follow alphabetical order
foreach(file in [
	"orange_api_util"

	"callback"
	"containers"
	"control"
	"factory"
	"math"
	"misc"
	"oobject"
	"signal"
	"text"
	"thread"

	"background"
	"badguy"
	"bumper"
	"button"
	"camera"
	"class"
	"colors"
	"console"
	"grumbel"
	"location"
	"multiplayer"
	"rand"
	"scriptloader"
	"state"
	"table"
	"test"
	"tilemap"
	"time"
	"trampoline"
]) import("orange-api/" + file + ".nut")
