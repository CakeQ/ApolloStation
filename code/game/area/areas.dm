/*

### This file contains a list of all the areas in your station. Format is as follows:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = "ICON FILENAME" 			(defaults to areas.dmi)
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = 0 				(defaults to 1)
	music = list( 'sound/music/music.ogg' )

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0

*/


/area
	level = null
	name = "Unknown"
	icon = 'icons/turf/areas.dmi'
	icon_state = "unknown"
	layer = 10
	luminosity = 0
	mouse_opacity = 0

	var/fire = null
	var/atmos = 1
	var/atmosalm = 0
	var/poweralm = 1
	var/party = null

	var/lightswitch = 1

	var/eject = null

	var/debug = 0
	var/requires_power = 1
	var/always_unpowered = 0	// this gets overriden to 1 for space in area/New()

	var/power_equip = 1
	var/power_light = 1
	var/power_environ = 1
	var/used_equip = 0
	var/used_light = 0
	var/used_environ = 0

	var/has_gravity = 1
	var/list/apc = list()
	var/no_air = null
//	var/list/lights				// list of all lights on this area
	var/list/all_doors = list()		//Added by Strumpetplaya - Alarm Change - Contains a list of doors adjacent to this area
	var/air_doors_activated = 0
	var/list/ambience = list( 'sound/ambience/shipambience.ogg' )
	var/list/music = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambigen14.ogg')
	var/sound/forced_ambience = null

	var/base_turf = /turf/space

	var/parallax_style = "space"

	var/rad_shielded = 0
	var/environment = ROOM

/*-----------------------------------------------------------------------------*/

/////////
//SPACE//
/////////

/area/space
	name = "\improper Space"
	icon_state = "space"
	requires_power = 1
	always_unpowered = 1
	lighting_use_dynamic = 0
	power_light = 0
	power_equip = 0
	power_environ = 0
	music = list('sound/ambience/ambispace.ogg','sound/ambience/ambispace1.ogg','sound/ambience/ambispace2.ogg')
	ambience = list()
	environment = PLAIN

/area/space/s_hanger_1
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_2
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_3
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_4
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_5
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_6
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_7
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_8
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_9
	name = "\improper Space"
	icon_state = "space_1"

/area/space/s_hanger_10
	name = "\improper Space"
	icon_state = "space_1"

/area/space/inner
	name = "\improper Inner Station Space"
	icon_state = "space"

area/space/atmosalert()
	return

/area/space/firealert()
	return

/area/space/readyalert()
	return

/area/space/partyalert()
	return

/area/space/bluespace
	name = "\improper Bluespace"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/space/bluespace/hanger_1
	icon_state = "start"
	name = "\improper Bluespace"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/space/bluespace/hanger_2
	icon_state = "start"
	name = "\improper Bluespace"

/area/space/bluespace/hanger_3
	icon_state = "start"
	name = "\improper Bluespace"

/area/space/bluespace/hanger_4
	icon_state = "start"
	name = "\improper Bluespace"

/area/space/bluespace/hanger_5
	icon_state = "start"
	name = "\improper Bluespace"

/area/space/bluespace/hanger_6
	icon_state = "start"
	name = "\improper Bluespace"

/area/space/bluespace/hanger_7
	icon_state = "start"
	name = "\improper Bluespace"

/area/engine/
	music = list('sound/ambience/ambisin1.ogg','sound/ambience/ambisin2.ogg','sound/ambience/ambisin3.ogg','sound/ambience/ambisin4.ogg' )

/area/turret_protected/

/area/arrival
	requires_power = 0

/area/arrival/start
	name = "\improper Arrival Area"
	icon_state = "start"

/area/admin
	name = "\improper Admin room"
	icon_state = "start"



//These are shuttle areas, they must contain two areas in a subgroup if you want to move a shuttle from one
//place to another. Look at escape shuttle for example.
//All shuttles show now be under shuttle since we have smooth-wall code.

/area/shuttle
	requires_power = 0
	lighting_use_dynamic = 1
	environment = CAVE

/area/hanger
	requires_power = 0
	lighting_use_dynamic = 1
	environment = CAVE

/area/hanger/north
	name = "\improper Hangar"
	icon_state = "north"

/area/hanger/northeast
	name = "\improper Hangar"
	icon_state = "northeast"

/area/hanger/east
	name = "\improper Hangar"
	icon_state = "east"

/area/hanger/southeast
	name = "\improper Hangar"
	icon_state = "southeast"

/area/hanger/south
	name = "\improper Hangar"
	icon_state = "south"

/area/hanger/southwest
	name = "\improper Hangar"
	icon_state = "southwest"

/area/hanger/west
	name = "\improper Hangar"
	icon_state = "west"

/area/hanger/northwest
	name = "\improper Hangar"
	icon_state = "northwest"

/area/podbay
	name = "\improper Podbay"
	icon_state = "yellow"
	environment = SEWER_PIPE

/area/podbay/hangar
	name = "\improper Hangar"
	icon_state = "green"
	environment = SEWER_PIPE

/area/podbay/hangar/s_hanger_e
	name = "\improper Hangar_loc_e"
	icon_state = "green_e"
	environment = SEWER_PIPE

/area/shuttle/arrival
	name = "\improper Arrival Shuttle"

/area/shuttle/arrival/apollo
	icon_state = "shuttle"
	name = "\improper NOS Apollo Arrival Shuttle"

/area/shuttle/arrival/nssartemis
	icon_state = "shuttle"
	name = "\improper NSS Artemis Arrival Shuttle"

/area/shuttle/escape
	name = "\improper Emergency Shuttle"

/area/shuttle/escape/station
	name = "\improper Emergency Shuttle Station"
	icon_state = "shuttle2"

/area/shuttle/escape/centcom
	name = "\improper Emergency Shuttle Centcom"
	icon_state = "shuttle"

/area/shuttle/escape/spawn_area
	name = "\improper Emergency Shuttle Centcom"
	icon_state = "shuttle"

/area/shuttle/escape/transit // the area to pass through for 3 minute transit
	name = "\improper Emergency Shuttle Transit"
	icon_state = "shuttle"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/shuttle/escape_pod1
	name = "\improper Escape Pod One"

/area/shuttle/escape_pod1/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod1/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod1/transit
	icon_state = "shuttle"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/shuttle/escape_pod2
	name = "\improper Escape Pod Two"

/area/shuttle/escape_pod2/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod2/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod2/transit
	icon_state = "shuttle"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/shuttle/escape_pod3
	name = "\improper Escape Pod Three"

/area/shuttle/escape_pod3/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod3/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod3/transit
	icon_state = "shuttle"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/shuttle/escape_pod5 //Pod 4 was lost to meteors
	name = "\improper Escape Pod Five"

/area/shuttle/escape_pod5/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod5/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod5/transit
	icon_state = "shuttle"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/shuttle/mining
	name = "\improper Mining Shuttle"

/area/shuttle/mining/station
	icon_state = "shuttle2"

/area/shuttle/mining/outpost
	icon_state = "shuttle"

/area/shuttle/transport1/centcom
	icon_state = "shuttle"
	name = "\improper Transport Shuttle Centcom"

/area/shuttle/transport1/station
	icon_state = "shuttle"
	name = "\improper Transport Shuttle"

/area/shuttle/alien/base
	icon_state = "shuttle"
	name = "\improper Alien Shuttle Base"
	requires_power = 1
	luminosity = 0

/area/shuttle/alien/mine
	icon_state = "shuttle"
	name = "\improper Alien Shuttle Mine"
	requires_power = 1
	luminosity = 0

/area/shuttle/prison/
	name = "\improper Prison Shuttle"

/area/shuttle/prison/station
	icon_state = "shuttle"

/area/shuttle/prison/prison
	icon_state = "shuttle2"

/area/shuttle/specops/centcom
	name = "\improper Special Ops Shuttle"
	icon_state = "shuttlered"

/area/shuttle/specops/station
	name = "\improper Special Ops Shuttle"
	icon_state = "shuttlered2"

/area/shuttle/syndicate_elite/mothership
	name = "\improper Merc Elite Shuttle"
	icon_state = "shuttlered"
	lighting_use_dynamic = 0

/area/shuttle/syndicate_elite/station
	name = "\improper Merc Elite Shuttle"
	icon_state = "shuttlered2"

/area/shuttle/administration/centcom
	name = "\improper Administration Shuttle Centcom"
	icon_state = "shuttlered"

/area/shuttle/administration/station
	name = "\improper Administration Shuttle"
	icon_state = "shuttlered2"

/area/shuttle/thunderdome
	name = "honk"

/area/shuttle/thunderdome/grnshuttle
	name = "\improper Thunderdome GRN Shuttle"
	icon_state = "green"

/area/shuttle/thunderdome/grnshuttle/dome
	name = "\improper GRN Shuttle"
	icon_state = "shuttlegrn"

/area/shuttle/thunderdome/grnshuttle/station
	name = "\improper GRN Station"
	icon_state = "shuttlegrn2"

/area/shuttle/thunderdome/redshuttle
	name = "\improper Thunderdome RED Shuttle"
	icon_state = "red"

/area/shuttle/thunderdome/redshuttle/dome
	name = "\improper RED Shuttle"
	icon_state = "shuttlered"

/area/shuttle/thunderdome/redshuttle/station
	name = "\improper RED Station"
	icon_state = "shuttlered2"
// === Trying to remove these areas:

/area/shuttle/research
	name = "\improper Research Shuttle"

/area/shuttle/research/station
	icon_state = "shuttle2"

/area/shuttle/research/outpost
	icon_state = "shuttle"

/area/shuttle/vox/station
	name = "\improper Vox Skipjack"
	icon_state = "yellow"
	requires_power = 0
	lighting_use_dynamic = 0


/area/shuttle/laborcamp/station
	name = "\improper Labor Camp Shuttle"
	icon_state = "shuttlered"

/area/shuttle/laborcamp/outpost
	name = "\improper Labor Camp Shuttle"
	icon_state = "shuttlered"

/area/airtunnel1/      // referenced in airtunnel.dm:759

/area/dummy/           // Referenced in engine.dm:261

/area/start            // will be unused once kurper gets his login interface patch done
	name = "start area"
	icon_state = "start"
	requires_power = 0
	has_gravity = 1
	lighting_use_dynamic = 0

// === end remove

/area/alien
	name = "\improper Alien base"
	icon_state = "yellow"
	requires_power = 0

// CENTCOM

/area/centcom
	name = "\improper Centcom"
	icon_state = "centcom"
	requires_power = 0

/area/centcom/control
	name = "\improper Centcom Control"

/area/centcom/evac
	name = "\improper Centcom Emergency Shuttle"

/area/centcom/suppy
	name = "\improper Centcom Supply Shuttle"

/area/centcom/ferry
	name = "\improper Centcom Transport Shuttle"

/area/centcom/shuttle
	name = "\improper Centcom Administration Shuttle"

/area/centcom/test
	name = "\improper Centcom Testing Facility"

/area/centcom/living
	name = "\improper Centcom Living Quarters"

/area/centcom/specops
	name = "\improper Centcom Special Ops"

/area/centcom/creed
	name = "Creed's Office"

/area/centcom/holding
	name = "\improper Holding Facility"

//SYNDICATES

/area/syndicate_mothership
	name = "\improper Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	lighting_use_dynamic = 0

/area/syndicate_mothership/control
	name = "\improper Mercenary Control Room"
	icon_state = "syndie-control"

/area/syndicate_mothership/elite_squad
	name = "\improper Elite Mercenary Squad"
	icon_state = "syndie-elite"

/area/syndicate_mothership/shuttle
	name = "\improper Elite Mercenary Squad"
	icon_state = "syndie-elite"

/area/syndicate_mothership/offsite_hanger
	name = "\improper Elite Mercenary Squad"
	icon_state = "syndie-elite"

//EXTRA

/area/asteroid					// -- TLE
	name = "\improper Asteroid"
	icon_state = "asteroid"
	requires_power = 0

/area/asteroid/cave				// -- TLE
	name = "\improper Asteroid - Underground"
	icon_state = "cave"
	requires_power = 0

/area/asteroid/artifactroom
	name = "\improper Asteroid - Artifact"
	icon_state = "cave"




/area/planet/clown
	name = "\improper Clown Planet"
	icon_state = "honk"
	requires_power = 0

/area/tdome
	name = "\improper Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	ambience = list('sound/music/THUNDERDOME.ogg')

/area/tdome/arena
	name = "\improper Thunderdome Arena"
	icon_state = "thunder"
	requires_power = 0

/area/tdome/tdome1
	name = "\improper Thunderdome (Team 1)"
	icon_state = "green"

/area/tdome/tdome2
	name = "\improper Thunderdome (Team 2)"
	icon_state = "yellow"

/area/tdome/tdomeadmin
	name = "\improper Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "\improper Thunderdome (Observer.)"
	icon_state = "purple"

//ENEMY

//names are used
/area/syndicate_station
	name = "\improper Independant Station"
	icon_state = "yellow"
	requires_power = 0
	rad_shielded = 1
	lighting_use_dynamic = 0

/area/syndicate_station/start
	name = "\improper Mercenary Forward Operating Base"
	icon_state = "yellow"

/area/syndicate_station/southwest
	name = "\improper south-west of SS13"
	icon_state = "southwest"

/area/syndicate_station/northwest
	name = "\improper north-west of SS13"
	icon_state = "northwest"

/area/syndicate_station/northeast
	name = "\improper north-east of SS13"
	icon_state = "northeast"

/area/syndicate_station/southeast
	name = "\improper south-east of SS13"
	icon_state = "southeast"

/area/syndicate_station/south
	name = "\improper south of SS13"
	icon_state = "south"

/area/syndicate_station/commssat
	name = "\improper south of the communication satellite"
	icon_state = "south"

/area/syndicate_station/mining
	name = "\improper north east of the mining asteroid"
	icon_state = "north"

/area/syndicate_station/maint_dock
	name = "\improper docked with station"
	icon_state = "shuttle"

/area/syndicate_station/transit
	name = "\improper bluespace"
	icon_state = "shuttle"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/wizard_station
	name = "\improper Wizard's Den"
	icon_state = "yellow"
	requires_power = 0

/area/vox_station
	requires_power = 0
	rad_shielded = 1
	lighting_use_dynamic = 0

/area/vox_station/transit
	name = "\improper bluespace"
	icon_state = "shuttle"
	ambience = list('sound/ambience/ambbspace.ogg')
	environment = UNDERWATER
	parallax_style = "bluespace"

/area/vox_station/southwest_solars
	name = "\improper aft port solars"
	icon_state = "southwest"
	lighting_use_dynamic = 0

/area/vox_station/northwest_solars
	name = "\improper fore port solars"
	icon_state = "northwest"
	lighting_use_dynamic = 0

/area/vox_station/northeast_solars
	name = "\improper fore starboard solars"
	icon_state = "northeast"
	lighting_use_dynamic = 0

/area/vox_station/southeast_solars
	name = "\improper aft starboard solars"
	icon_state = "southeast"
	lighting_use_dynamic = 0

/area/vox_station/mining
	name = "\improper nearby mining asteroid"
	icon_state = "north"

//PRISON
/area/prison
	name = "\improper Prison Station"
	icon_state = "brig"
	environment = HALLWAY

/area/prison/arrival_airlock
	name = "\improper Prison Station Airlock"
	icon_state = "green"
	requires_power = 0

/area/prison/control
	name = "\improper Prison Security Checkpoint"
	icon_state = "security"

/area/prison/crew_quarters
	name = "\improper Prison Security Quarters"
	icon_state = "security"

/area/prison/rec_room
	name = "\improper Prison Rec Room"
	icon_state = "green"

/area/prison/closet
	name = "\improper Prison Supply Closet"
	icon_state = "dk_yellow"
	environment = ROOM

/area/prison/hallway/fore
	name = "\improper Prison Fore Hallway"
	icon_state = "yellow"

/area/prison/hallway/aft
	name = "\improper Prison Aft Hallway"
	icon_state = "yellow"

/area/prison/hallway/port
	name = "\improper Prison Port Hallway"
	icon_state = "yellow"

/area/prison/hallway/starboard
	name = "\improper Prison Starboard Hallway"
	icon_state = "yellow"

/area/prison/morgue
	name = "\improper Prison Morgue"
	icon_state = "morgue"

/area/prison/medical_research
	name = "\improper Prison Genetic Research"
	icon_state = "medresearch"

/area/prison/medical
	name = "\improper Prison Medbay"
	icon_state = "medbay"

/area/prison/solar
	name = "\improper Prison Solar Array"
	icon_state = "storage"
	requires_power = 0
	lighting_use_dynamic = 0

/area/prison/podbay
	name = "\improper Prison Podbay"
	icon_state = "dk_yellow"

/area/prison/solar_control
	name = "\improper Prison Solar Array Control"
	icon_state = "dk_yellow"

/area/prison/solitary
	name = "Solitary Confinement"
	icon_state = "brig"

/area/prison/execution
	name = "Execution Chamber"
	icon_state = "brig"

/area/prison/cell_block/A
	name = "Prison Cell Block A"
	icon_state = "brig"

/area/prison/cell_block/B
	name = "Prison Cell Block B"
	icon_state = "brig"

/area/prison/cell_block/C
	name = "Prison Cell Block C"
	icon_state = "brig"

//STATION13

/area/atmos
	name = "Atmospherics"
	icon_state = "atmos"
	environment = CONCERT_HALL

//Maintenance

/area/maintenance
	rad_shielded = 1
	environment = STONEROOM

/area/maintenance/aft
	name = "Aft Maintenance"
	icon_state = "amaint"

/area/maintenance/portdorm
	name = "Dormitory Maintenance"
	icon_state = "pmaint"


/area/maintenance/portkitchen
	name = "Kitchen Maintenance"
	icon_state = "amaint"

/area/maintenance/bridge_aft
	name = "Bridge Aft Maintenance"
	icon_state = "amaint"

/area/maintenance/fore
	name = "Fore Maintenance"
	icon_state = "fmaint"

/area/maintenance/bridge_pfore
	name = "Bridge Port Maintenance"
	icon_state = "fmaint"

/area/maintenance/bridge_sfore
	name = "Bridge Starboard Maintenance"
	icon_state = "fmaint"

/area/maintenance/starboard
	name = "Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/port
	name = "Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/atmos_control
	name = "Atmospherics Maintenance"
	icon_state = "fpmaint"

/area/maintenance/fpmaint
	name = "Fore Port Maintenance - 1"
	icon_state = "fpmaint"

/area/maintenance/fpmaint2
	name = "Fore Port Maintenance - 2"
	icon_state = "fpmaint"

/area/maintenance/fsmaint
	name = "Fore Starboard Maintenance - 1"
	icon_state = "fsmaint"

/area/maintenance/fsmaint2
	name = "Fore Starboard Maintenance - 2"
	icon_state = "fsmaint"

/area/maintenance/asmaint
	name = "Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/engi_shuttle
	name = "Engineering Shuttle Access"
	icon_state = "maint_e_shuttle"

/area/maintenance/engi_engine
	name = "Engine Maintenance"
	icon_state = "maint_engine"

/area/maintenance/asmaint2
	name = "Science Maintenance"
	icon_state = "asmaint"

/area/maintenance/apmaint
	name = "Cargo Maintenance"
	icon_state = "apmaint"

/area/maintenance/maintcentral
	name = "Bridge Maintenance"
	icon_state = "maintcentral"

/area/maintenance/arrivals
	name = "Arrivals Maintenance"
	icon_state = "maint_arrivals"

/area/maintenance/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"

/area/maintenance/cargo
	name = "Cargo Maintenance"
	icon_state = "maint_cargo"

/area/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/maintenance/engineering
	name = "Engineering Maintenance"
	icon_state = "maint_engineering"

/area/maintenance/shadygarden
	name = "\improper Shady Garden"
	icon_state = "maint_engineering"

/area/maintenance/evahallway
	name = "\improper EVA Maintenance"
	icon_state = "maint_eva"

/area/maintenance/ghettosurgery
	name = "\improper Ghetto Surgery"
	icon_state = "maint_eva"

/area/maintenance/dormitory
	name = "Dormitory Maintenance"
	icon_state = "maint_dormitory"

/area/maintenance/incinerator
	name = "\improper Incinerator"
	icon_state = "disposal"

/area/maintenance/library
	name = "Library Maintenance"
	icon_state = "maint_library"

/area/maintenance/locker
	name = "Locker Room Maintenance"
	icon_state = "maint_locker"

/area/maintenance/medbay
	name = "Medbay Maintenance"
	icon_state = "maint_medbay"

/area/maintenance/research_port
	name = "Research Maintenance - Port"
	icon_state = "maint_research_port"

/area/maintenance/research_starboard
	name = "Research Maintenance - Starboard"
	icon_state = "maint_research_starboard"

/area/maintenance/research_shuttle
	name = "Research Shuttle Dock Maintenance"
	icon_state = "maint_research_shuttle"

/area/maintenance/security_port
	name = "Security Maintenance - Port"
	icon_state = "maint_security_port"

/area/maintenance/security_starboard
	name = "Security Maintenance - Starboard"
	icon_state = "maint_security_starboard"

/area/maintenance/storage
	name = "Atmospherics"
	icon_state = "green"

// SUBSTATIONS (Subtype of maint, that should let them serve as shielded area during radstorm)

/area/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	environment = ALLEY

/area/maintenance/substation/engineering // Probably will be connected to engineering SMES room, as wires cannot be crossed properly without them sharing powernets.
	name = "Engineering Substation"

// No longer used:
/area/maintenance/substation/medical_science // Medbay and Science. Each has it's own separated machinery, but it originates from the same room.
	name = "Medical Research Substation"

/area/maintenance/substation/medical // Medbay
	name = "Medical Substation"

/area/maintenance/substation/research // Research
	name = "Research Substation"

/area/maintenance/substation/civilian_east // Bar, kitchen, dorms, ...
	name = "Civilian East Substation"

/area/maintenance/substation/civilian_west // Cargo, PTS, locker room, probably arrivals, ...)
	name = "Civilian West Substation"

/area/maintenance/substation/command // AI and central cluster. This one will be between HoP office and meeting room (probably).
	name = "Command Substation"

/area/maintenance/substation/security // Security, Brig, Permabrig, etc.
	name = "Security Substation"

/area/maintenance/substation/hangar // Hangar, Pod Hangar, Arrivals, Depatures, etc...
	name = "Hangar Substation"




//Hallway

/area/hallway/
	environment = HALLWAY

/area/hallway/primary/fore
	name = "\improper Fore Primary Hallway"
	icon_state = "hallF"

/area/hallway/primary/central_fore
	name = "\improper Central Fore Primary Hallway"
	icon_state = "hallF"

/area/hallway/primary/starboard
	name = "\improper Starboard Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/fore_starboard
	name = "\improper Fore Starboard Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/aft_starboard
	name = "\improper Aft Starboard Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/aft
	name = "\improper Aft Primary Hallway"
	icon_state = "hallA"

/area/hallway/primary/port
	name = "\improper Port Primary Hallway"
	icon_state = "hallP"

/area/hallway/primary/fore_port
	name = "\improper Fore Port Primary Hallway"
	icon_state = "hallP"

/area/hallway/primary/aft_port
	name = "\improper Aft Port Primary Hallway"
	icon_state = "hallP"

/area/hallway/primary/central_one
	name = "\improper Central Primary Hallway"
	icon_state = "hallC1"

/area/hallway/primary/central_two
	name = "\improper Central Primary Hallway"
	icon_state = "hallC2"

/area/hallway/primary/central_three
	name = "\improper Central Primary Hallway"
	icon_state = "hallC3"

/area/hallway/secondary/exit
	name = "\improper Departures Lobby"
	icon_state = "escape"

/area/hallway/secondary/construction
	name = "\improper Construction Area"
	icon_state = "construction"

/area/hallway/secondary/entry/fore
	name = "\improper Arrival Shuttle Hallway - Fore"
	icon_state = "entry_1"

/area/hallway/secondary/entry/port
	name = "\improper Arrival Shuttle Hallway - Port"
	icon_state = "entry_2"

/area/hallway/secondary/entry/starboard
	name = "\improper Arrival Shuttle Hallway - Starboard"
	icon_state = "entry_3"

/area/hallway/secondary/entry/aft
	name = "\improper Arrival Shuttle Hallway - Aft"
	icon_state = "entry_4"

//Command

/area/bridge
	name = "\improper Bridge"
	icon_state = "bridge"
	environment = STONEROOM

/area/bridge/bridgemed
	name = "\improper Bridge Medical"
	icon_state = "bridge"
	environment = STONEROOM

/area/bridge/meeting_room
	name = "\improper Heads of Staff Meeting Room"
	icon_state = "bridge"
	music = list()
	environment = ROOM

/area/crew_quarters/captain
	name = "\improper Captain's Office"
	icon_state = "captain"

/area/crew_quarters/heads/hop
	name = "\improper Head of Personnel's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/hor
	name = "\improper Research Director's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/chief
	name = "\improper Chief Engineer's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/hos
	name = "\improper Head of Security's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/hos/sleeproom
	name = "\improper Head of Security's Quarters"
	icon_state = "head_quarters"


/area/crew_quarters/heads/cmo
	name = "\improper Chief Medical Officer's Office"
	icon_state = "head_quarters"

/area/crew_quarters/courtroom
	name = "\improper Courtroom"
	icon_state = "courtroom"

/area/mint
	name = "\improper Mint"
	icon_state = "green"

/area/comms
	name = "\improper Communications Relay"
	icon_state = "tcomsatcham"

/area/server
	name = "\improper Messaging Server Room"
	icon_state = "server"

//Crew

/area/crew_quarters
	name = "\improper Dormitories"
	icon_state = "Sleep"
	rad_shielded = 1
	environment = QUARRY

/area/crew_quarters/toilet
	name = "\improper Dormitory Toilets"
	icon_state = "toilet"
	environment = BATHROOM

/area/crew_quarters/observe
	name = "\improper Observatory"
	icon_state = "green"

/area/crew_quarters/shop1
	name = "\improper Shop One"
	icon_state = "red"

/area/crew_quarters/shop2
	name = "\improper Shop One"
	icon_state = "yellow"

/area/crew_quarters/sleep
	name = "\improper Dormitories"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/medroom
	name = "\improper Fore Port Private Quarter"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/secroom1
	name = "\improper Fore Starboard Private Quarter One"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/secroom2
	name = "\improper Fore Starboard Private Quarter Two"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/secroom3
	name = "\improper Fore Starboard Private Quarter Three"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/sciroom1
	name = "\improper Aft Starboard Private Quarter One"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/sciroom2
	name = "\improper Aft Starboard Private Quarter Two"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/sciroom3
	name = "\improper Aft Starboard Private Quarter Three"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/civroom
	name = "\improper Aft Port Private Quarter"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/centroom
	name = "\improper Central Private Quarter"
	icon_state = "Sleep"

/area/crew_quarters/sleep/engi_wash
	name = "\improper Engineering Washroom"
	icon_state = "toilet"
	environment = BATHROOM

/area/crew_quarters/sleep/bedrooms
	name = "\improper Dormitory Bedroom One"
	icon_state = "Sleep"

/area/crew_quarters/sleep/cryo
	name = "\improper Cryogenic Storage"
	icon_state = "Sleep"

/area/crew_quarters/sleep_male
	name = "\improper Male Dorm"
	icon_state = "Sleep"

/area/crew_quarters/sleep_male/toilet_male
	name = "\improper Male Toilets"
	icon_state = "toilet"
	environment = BATHROOM

/area/crew_quarters/sleep_female
	name = "\improper Female Dorm"
	icon_state = "Sleep"

/area/crew_quarters/sleep_female/toilet_female
	name = "\improper Female Toilets"
	icon_state = "toilet"
	environment = BATHROOM

/area/crew_quarters/locker
	name = "\improper Locker Room"
	icon_state = "locker"

/area/crew_quarters/locker/locker_toilet
	name = "\improper Locker Toilets"
	icon_state = "toilet"

/area/crew_quarters/fitness
	name = "\improper Fitness Room"
	icon_state = "fitness"

/area/crew_quarters/kitchen
	name = "\improper Kitchen"
	icon_state = "kitchen"

/area/crew_quarters/bar
	name = "\improper Bar"
	icon_state = "bar"
	environment = QUARRY

/area/crew_quarters/lounge
	name = "\improper Lounge"
	icon_state = "Break Room"
	environment = QUARRY

/area/crew_quarters/diner
	name = "\improper Diner"
	icon_state = "bar"
	environment = QUARRY

/area/basement/civilian/hallway
	name = "\improper Civilian Basement Hallway"
	icon_state = "bar"

/area/basement/civilian/breaker
	name = "\improper Civlian Basement Breaker"
	icon_state = "bar"

/area/basement/civilian/maintenance
	name = "\improper Civlian Basement Maintenance"
	icon_state = "bar"

/area/basement/civilian/dancefloor
	name = "\improper Dance Floor"
	icon_state = "bar"
	environment = QUARRY

/area/basement/civilian/theatre
	name = "\improper Theatre"
	icon_state = "Theatre"
	music = list( 'sound/ambience/ambitheatre1.ogg' )
	environment = AUDITORIUM

/area/basement/civilian/theatre/backstage
	name = "\improper Theatre Back Stage"
	icon_state = "Theatre"
	environment = HALLWAY

/area/basement/civilian/theatre/changingroom
	name = "\improper Theatre Changing Room"
	icon_state = "Theatre"
	environment = QUARRY

/area/basement/civilian/theatre/office
	name = "\improper Entertainer's Office"
	icon_state = "Theatre"
	environment = QUARRY

/area/library
	name = "\improper Library"
	icon_state = "library"
	environment = QUARRY

/area/chapel/main
	name = "\improper Chapel"
	icon_state = "chapel"
	music = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg','sound/music/traitor.ogg')
	environment = MOUNTAINS

/area/chapel/office
	name = "\improper Chapel Office"
	icon_state = "chapeloffice"
	environment = QUARRY

/area/lawoffice
	name = "\improper Internal Affairs"
	icon_state = "law"
	environment = QUARRY

/area/holodeck
	name = "\improper Holodeck"
	icon_state = "Holodeck"
	luminosity = 1
	lighting_use_dynamic = 0

/area/holodeck/alphadeck
	name = "\improper Holodeck Alpha"

/area/holodeck/source_plating
	name = "\improper Holodeck - Off"
	icon_state = "Holodeck"

/area/holodeck/source_emptycourt
	name = "\improper Holodeck - Empty Court"

/area/holodeck/source_boxingcourt
	name = "\improper Holodeck - Boxing Court"

/area/holodeck/source_basketball
	name = "\improper Holodeck - Basketball Court"

/area/holodeck/source_thunderdomecourt
	name = "\improper Holodeck - Thunderdome Court"

/area/holodeck/source_beach
	name = "\improper Holodeck - Beach"
	icon_state = "Holodeck" // Lazy.

/area/holodeck/source_burntest
	name = "\improper Holodeck - Atmospheric Burn Test"

/area/holodeck/source_wildlife
	name = "\improper Holodeck - Wildlife Simulation"

/area/holodeck/source_meetinghall
	name = "\improper Holodeck - Meeting Hall"

/area/holodeck/source_theatre
	name = "\improper Holodeck - Theatre"

/area/holodeck/source_picnicarea
	name = "\improper Holodeck - Picnic Area"

/area/holodeck/source_snowfield
	name = "\improper Holodeck - Snow Field"

/area/holodeck/source_desert
	name = "\improper Holodeck - Desert"

/area/holodeck/source_space
	name = "\improper Holodeck - Space"
	has_gravity = 0


//Engineering

/area/engine
	environment = SEWER_PIPE

	drone_fabrication
		name = "\improper Drone Fabrication"
		icon_state = "engine"

	engine_smes
		name = "Engineering SMES"
		icon_state = "engine_smes"
//		requires_power = 0//This area only covers the batteries and they deal with their own power

	engine_room
		name = "\improper Engine Room"
		icon_state = "engine"

	engine_airlock
		name = "\improper Engine Room Airlock"
		icon_state = "engine"

	engine_monitoring
		name = "\improper Engine Monitoring Room"
		icon_state = "engine_monitoring"

	engine_waste
		name = "\improper Engine Waste Handling"
		icon_state = "engine_waste"

	engineering_monitoring
		name = "\improper Engineering Monitoring Room"
		icon_state = "engine_monitoring"

	atmos_monitoring
		name = "\improper Atmospherics Monitoring Room"
		icon_state = "engine_monitoring"

	engineering
		name = "Engineering"
		icon_state = "engine_smes"

	engineering_foyer
		name = "\improper Engineering Foyer"
		icon_state = "engine"

	engineering_supply
		name = "Engineering Supply"
		icon_state = "engine_supply"

	break_room
		name = "\improper Engineering Break Room"
		icon_state = "engine"
		environment = QUARRY

	hallway
		name = "\improper Engineering Hallway"
		icon_state = "engine_hallway"
		environment = HALLWAY

	engine_hallway
		name = "\improper Engine Room Hallway"
		icon_state = "engine_hallway"
		environment = HALLWAY

	engine_eva
		name = "\improper Engine EVA"
		icon_state = "engine_eva"
		environment = QUARRY

	engine_eva_maintenance
		name = "\improper Engine EVA Maintenance"
		icon_state = "engine_eva"
		environment = STONE_CORRIDOR

	workshop
		name = "\improper Engineering Workshop"
		icon_state = "engine_storage"

	locker_room
		name = "\improper Engineering Locker Room"
		icon_state = "engine_storage"
		environment = QUARRY

	dock
		name = "\improper Engineering Dock"
		icon_state = "engine_storage"
		environment = SEWER_PIPE

//Solars

/area/solar
	requires_power = 1
	always_unpowered = 1
	lighting_use_dynamic = 0
	luminosity = 1
	environment = PLAIN

	auxport
		name = "\improper Fore Port Solar Array"
		icon_state = "panelsA"

	auxstarboard
		name = "\improper Fore Starboard Solar Array"
		icon_state = "panelsA"

	fore
		name = "\improper Fore Solar Array"
		icon_state = "yellow"

	aft
		name = "\improper Aft Solar Array"
		icon_state = "aft"

	starboard
		name = "\improper Aft Starboard Solar Array"
		icon_state = "panelsS"

	port
		name = "\improper Aft Port Solar Array"
		icon_state = "panelsP"

/area/maintenance/auxsolarport
	name = "Fore Port Solar Maintenance"
	icon_state = "SolarcontrolP"

/area/maintenance/starboardsolar
	name = "Aft Starboard Solar Maintenance"
	icon_state = "SolarcontrolS"

/area/maintenance/portsolar
	name = "Aft Port Solar Maintenance"
	icon_state = "SolarcontrolP"

/area/maintenance/auxsolarstarboard
	name = "Fore Starboard Solar Maintenance"
	icon_state = "SolarcontrolS"

/area/maintenance/foresolar
	name = "Fore Solar Maintenance"
	icon_state = "SolarcontrolA"

/area/assembly/chargebay
	name = "\improper Mech Bay"
	icon_state = "mechbay"
	environment = QUARRY

/area/assembly/showroom
	name = "\improper Robotics Showroom"
	icon_state = "showroom"

/area/assembly/robotics
	name = "\improper Robotics Lab"
	icon_state = "robotics"
	environment = QUARRY

/area/assembly/assembly_line //Derelict Assembly Line
	name = "\improper Assembly Line"
	icon_state = "ass_line"
	power_equip = 0
	power_light = 0
	power_environ = 0

//Teleporter

/area/teleporter
	name = "\improper Teleporter"
	icon_state = "teleporter"
	music = list( 'sound/ambience/signal.ogg' )
	environment = QUARRY

/area/gateway
	name = "\improper Gateway"
	icon_state = "teleporter"
	music = list( 'sound/ambience/signal.ogg' )
	environment = QUARRY

/area/AIsattele
	name = "\improper AI Satellite Teleporter Room"
	icon_state = "teleporter"
	music = list( 'sound/ambience/ambimalf.ogg', 'sound/ambience/signal.ogg' )
	environment = QUARRY

//MedBay

/area/medical
	environment = HALLWAY

/area/medical/medbay
	name = "\improper Medbay Hallway - Port"
	icon_state = "medbay"

//Medbay is a large area, these additional areas help level out APC load.
/area/medical/medbay2
	name = "\improper Medbay Hallway - Starboard"
	icon_state = "medbay2"

/area/medical/medbay3
	name = "\improper Medbay Hallway - Fore"
	icon_state = "medbay3"

/area/medical/medbay4
	name = "\improper Medbay Hallway - Aft"
	icon_state = "medbay4"

/area/medical/biostorage
	name = "\improper Secondary Storage"
	icon_state = "medbay2"

/area/medical/reception
	name = "\improper Medbay Reception"
	icon_state = "medbay"

/area/medical/psych
	name = "\improper Psych Room"
	icon_state = "medbay3"

/area/crew_quarters/medbreak
	name = "\improper Break Room"
	icon_state = "medbay3"

/area/medical/patients_rooms
	name = "\improper Patient's Rooms"
	icon_state = "patients"

/area/medical/ward
	name = "\improper Recovery Ward"
	icon_state = "patients"

/area/medical/patient_a
	name = "\improper Isolation A"
	icon_state = "patients"

/area/medical/patient_b
	name = "\improper Isolation B"
	icon_state = "patients"

/area/medical/patient_c
	name = "\improper Isolation C"
	icon_state = "patients"

/area/medical/patient_wing
	name = "\improper Patient Wing"
	icon_state = "patients"

/area/medical/cmostore
	name = "\improper Secure Storage"
	icon_state = "CMO"

/area/medical/robotics
	name = "\improper Robotics"
	icon_state = "medresearch"

/area/medical/virology
	name = "\improper Virology"
	icon_state = "virology"

/area/medical/virologyaccess
	name = "\improper Virology Access"
	icon_state = "virology"

/area/medical/morgue
	name = "\improper Morgue"
	icon_state = "morgue"
	music = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')

/area/medical/chemistry
	name = "\improper Chemistry"
	icon_state = "chem"

/area/medical/surgery
	name = "\improper Operating Theatre 1"
	icon_state = "surgery"

/area/medical/surgery2
	name = "\improper Operating Theatre 2"
	icon_state = "surgery"

/area/medical/surgeryobs
	name = "\improper Operation Observation Room"
	icon_state = "surgery"

/area/medical/surgeryprep
	name = "\improper Pre-Op Prep Room"
	icon_state = "surgery"

/area/medical/cryo
	name = "\improper Cryogenics"
	icon_state = "cryo"

/area/medical/exam_room
	name = "\improper Exam Room"
	icon_state = "exam_room"

/area/medical/storage
	name = "\improper Storage Room"
	icon_state = "medbay3"

/area/medical/medicinestorage
	name = "\improper Medical Supplies"
	icon_state = "medbay3"

/area/medical/biostorage
	name = "\improper Biogear Storage Room"
	icon_state = "medbay3"

/area/medical/genetics
	name = "\improper Genetics Lab"
	icon_state = "genetics"

/area/medical/genetics_cloning
	name = "\improper Cloning Lab"
	icon_state = "cloning"

/area/medical/sleeper
	name = "\improper Emergency Treatment Centre"
	icon_state = "exam_room"

//Security

/area/security
	environment = HALLWAY

/area/security/main
	name = "\improper Security Office"
	icon_state = "security"

/area/security/breakroom
	name = "\improper Security Break Room"
	icon_state = "security"

/area/security/interrogate
	name = "\improper Security Interrogation"
	icon_state = "security"

/area/security/meeting
	name = "\improper Security Meeting Room"
	icon_state = "security"

/area/security/tribunal
	name = "\improper Courtroom"
	icon_state = "security"

/area/security/monitor
	name = "\improper Security Monitoring"
	icon_state = "security"

/area/security/lobby
	name = "\improper Security lobby"
	icon_state = "security"

/area/security/evidence
	name = "\improper Security Evidence"
	icon_state = "security"

/area/security/brig
	name = "\improper Brig"
	icon_state = "brig"
	environment = SEWER_PIPE

/area/security/prison
	name = "\improper Prison Wing"
	icon_state = "sec_prison"

/area/security/warden
	name = "\improper Warden"
	icon_state = "Warden"
	environment = QUARRY

/area/security/armoury
	name = "\improper Armory"
	icon_state = "Warden"
	environment = QUARRY

/area/security/detectives_office
	name = "\improper Detective's Office"
	icon_state = "detective"
	environment = QUARRY

/area/security/range
	name = "\improper Firing Range"
	icon_state = "firingrange"
	environment = HALLWAY

/area/security/tactical
	name = "\improper Tactical Equipment"
	icon_state = "Tactical"
	environment = QUARRY

/*
	New()
		..()

		spawn(10) //let objects set up first
			for(var/turf/turfToGrayscale in src)
				if(turfToGrayscale.icon)
					var/icon/newIcon = icon(turfToGrayscale.icon)
					newIcon.GrayScale()
					turfToGrayscale.icon = newIcon
				for(var/obj/objectToGrayscale in turfToGrayscale) //1 level deep, means tables, apcs, locker, etc, but not locker contents
					if(objectToGrayscale.icon)
						var/icon/newIcon = icon(objectToGrayscale.icon)
						newIcon.GrayScale()
						objectToGrayscale.icon = newIcon
*/

/area/security/nuke_storage
	name = "\improper Vault"
	icon_state = "nuke_storage"
	environment = QUARRY

/area/security/checkpoint
	name = "\improper Security Checkpoint"
	icon_state = "checkpoint1"

/area/security/checkpoint2
	name = "\improper Security Checkpoint"
	icon_state = "security"

/area/security/checkpoint/supply
	name = "Security Post - Cargo Bay"
	icon_state = "checkpoint1"

/area/security/checkpoint/engineering
	name = "Security Post - Engineering"
	icon_state = "checkpoint1"

/area/security/checkpoint/medical
	name = "Security Post - Medbay"
	icon_state = "checkpoint1"

/area/security/checkpoint/science
	name = "Security Post - Science"
	icon_state = "checkpoint1"

/area/security/vacantoffice
	name = "\improper Vacant Office"
	icon_state = "security"
	environment = QUARRY

/area/security/vacantoffice2
	name = "\improper Vacant Office"
	icon_state = "security"
	environment = QUARRY

/area/quartermaster
	name = "\improper Quartermasters"
	icon_state = "quart"
	environment = QUARRY

///////////WORK IN PROGRESS//////////

/area/quartermaster/sorting
	name = "\improper Delivery Office"
	icon_state = "quartstorage"

////////////WORK IN PROGRESS//////////

/area/quartermaster/office
	name = "\improper Cargo Office"
	icon_state = "quartoffice"

/area/quartermaster/storage
	name = "\improper Cargo Bay"
	icon_state = "quartstorage"
	environment = SEWER_PIPE

/area/quartermaster/qm
	name = "\improper Quartermaster's Office"
	icon_state = "quart"
	environment = QUARRY

/area/quartermaster/miningdock
	name = "\improper Mining Dock"
	icon_state = "mining"

/area/quartermaster/miningstorage
	name = "\improper Mining Storage"
	icon_state = "green"

/area/quartermaster/mechbay
	name = "\improper Mech Bay"
	icon_state = "yellow"

/area/janitor/
	name = "\improper Custodial Closet"
	icon_state = "janitor"

/area/hydroponics
	name = "\improper Hydroponics"
	icon_state = "hydro"
	environment = CAVE

/area/hydroponics/garden
	name = "\improper Garden"
	icon_state = "garden"
	environment = CAVE

/area/hydroponics/pasture
	name = "\improper Pasture"
	icon_state = "garden"
	environment = CAVE

//rnd (Research and Development
/area/rnd
	environment = HALLWAY

/area/rnd/research
	name = "\improper Research and Development"
	icon_state = "research"

/area/rnd/researchbreak
	name = "\improper Research Break Room"
	icon_state = "research"

/area/rnd/docking
	name = "\improper Research Dock"
	icon_state = "research_dock"

/area/rnd/lab
	name = "\improper Research Lab"
	icon_state = "toxlab"

/area/rnd/rdoffice
	name = "\improper Research Director's Office"
	icon_state = "head_quarters"

/area/rnd/supermatter
	name = "\improper Supermatter Lab"
	icon_state = "toxlab"

/area/rnd/xenobiology
	name = "\improper Xenobiology Lab"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/xenoflora_storage
	name = "\improper Xenoflora Storage"
	icon_state = "xeno_f_store"

/area/rnd/xenobiology/xenoflora
	name = "\improper Xenoflora Lab"
	icon_state = "xeno_f_lab"

/area/rnd/storage
	name = "\improper Toxins Storage"
	icon_state = "toxstorage"

/area/rnd/test_area
	name = "\improper Toxins Test Area"
	icon_state = "toxtest"

/area/rnd/mixing
	name = "\improper Toxins Mixing Room"
	icon_state = "toxmix"

/area/rnd/alloy_lab
	name = "\improper Alloys Lab"
	icon_state = "alloylab"

/area/rnd/misc_lab
	name = "\improper Miscellaneous Research"
	icon_state = "toxmisc"

/area/toxins/server
	name = "\improper Server Room"
	icon_state = "server"

//Storage

/area/storage
	environment = STONE_CORRIDOR

/area/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "storage"

/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/autolathe
	name = "Autolathe Storage"
	icon_state = "storage"

/area/storage/art
	name = "Art Supply Storage"
	icon_state = "storage"

/area/storage/auxillary
	name = "Auxillary Storage"
	icon_state = "auxstorage"

/area/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/storage/secure
	name = "Secure Storage"
	icon_state = "storage"

/area/storage/emergency
	name = "Starboard Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency2
	name = "Port Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency3
	name = "Central Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"

/area/storage/testroom
	requires_power = 0
	name = "\improper Test Room"
	icon_state = "storage"

//ENGINEERING OUTPOST

/area/engioutpost
	name = "\improper Engineering Outpost"
	icon_state = "LP"
	environment = HALLWAY

/area/engioutpost/solars
	name = "\improper Engineering Outpost Solars"
	icon_state = "LPS"
	environment = PLAIN

/area/engioutpost/dock
	name = "\improper Engineering Outpost"
	icon_state = "LP"
	environment = SEWER_PIPE

//NMV SLATER
/area/slater
	environment = PLAIN

/area/slater/hallway1
	name = "\improper Primary Hallway"
	icon_state = "hallP"
	environment = HALLWAY

/area/slater/hallway2
	name = "\improper Secondary Hallway"
	icon_state = "hallS"
	environment = HALLWAY

/area/slater/bridge
	name = "\improper NMV Slater Bridge"
	icon_state = "bridge"

/area/slater/bridge
	name = "\improper NMV Slater Bridge"
	icon_state = "bridge"

/area/slater/foreman
	name = "\improper NMV Slater Foreman's Office"
	icon_state = "bridge"

/area/slater/maint1
	name = "\improper NMV Slater Fore Maintenance"
	icon_state = "fmaint"

/area/slater/maint2
	name = "\improper NMV Slater Aft Maintenance"
	icon_state = "amaint"

/area/slater/maint3
	name = "\improper NMV Slater Secondary Maintenance"
	icon_state = "pmaint"

/area/slater/engine
	name = "\improper NMV Slater Engine Room"
	icon_state = "engine"

/area/slater/disposals
	name = "\improper NMV Slater Disposals Control"
	icon_state = "disposal"

/area/slater/refinery
	name = "\improper NMV Slater Refinery"
	icon_state = "mining_production"

/area/slater/cargo
	name = "\improper NMV Slater Cargo Hold"
	icon_state = "storage"

/area/slater/hangar
	name = "\improper NMV Slater Hangar"
	icon_state = "green"

/area/slater/expeditionprep
	name = "\improper NMV Slater Expedition Prep"
	icon_state = "mining_eva"

/area/slater/medbay
	name = "\improper NMV Slater Medbay"
	icon_state = "medbay"

/area/slater/lounge
	name = "\improper NMV Slater Break Room"
	icon_state = "cafeteria"

/area/slater/dorm
	name = "\improper NMV Slater Dormitory"
	icon_state = "Sleep"



//DERELICT

/area/derelict
	name = "\improper Derelict Station"
	icon_state = "storage"
	environment = PLAIN

/area/derelict/hallway/primary
	name = "\improper Derelict Primary Hallway"
	icon_state = "hallP"

/area/derelict/hallway/secondary
	name = "\improper Derelict Secondary Hallway"
	icon_state = "hallS"

/area/derelict/arrival
	name = "\improper Derelict Arrival Centre"
	icon_state = "yellow"

/area/derelict/storage/equipment
	name = "Derelict Equipment Storage"

/area/derelict/storage/storage_access
	name = "Derelict Storage Access"

/area/derelict/storage/engine_storage
	name = "Derelict Engine Storage"
	icon_state = "green"

/area/derelict/bridge
	name = "\improper Derelict Control Room"
	icon_state = "bridge"

/area/derelict/secret
	name = "\improper Derelict Secret Room"
	icon_state = "library"

/area/derelict/bridge/access
	name = "Derelict Control Room Access"
	icon_state = "auxstorage"

/area/derelict/bridge/ai_upload
	name = "\improper Derelict Computer Core"
	icon_state = "ai"

/area/derelict/solar_control
	name = "\improper Derelict Solar Control"
	icon_state = "engine"

/area/derelict/crew_quarters
	name = "\improper Derelict Crew Quarters"
	icon_state = "fitness"

/area/derelict/medical
	name = "Derelict Medbay"
	icon_state = "medbay"

/area/derelict/medical/morgue
	name = "\improper Derelict Morgue"
	icon_state = "morgue"

/area/derelict/medical/chapel
	name = "\improper Derelict Chapel"
	icon_state = "chapel"

/area/derelict/teleporter
	name = "\improper Derelict Teleporter"
	icon_state = "teleporter"

/area/derelict/eva
	name = "Derelict EVA Storage"
	icon_state = "eva"

/area/derelict/ship
	name = "\improper Abandoned Ship"
	icon_state = "yellow"

/area/solar/derelict_starboard
	name = "\improper Derelict Starboard Solar Array"
	icon_state = "panelsS"

/area/solar/derelict_aft
	name = "\improper Derelict Aft Solar Array"
	icon_state = "aft"

/area/derelict/singularity_engine
	name = "\improper Derelict Singularity Engine"
	icon_state = "engine"

//HALF-BUILT STATION (REPLACES DERELICT IN BAYCODE, ABOVE IS LEFT FOR DOWNSTREAM)

/area/shuttle/constructionsite
	name = "\improper Construction Site Shuttle"
	icon_state = "yellow"

/area/shuttle/constructionsite/station
	name = "\improper Construction Site Shuttle"

/area/shuttle/constructionsite/site
	name = "\improper Construction Site Shuttle"

/area/constructionsite
	name = "\improper Construction Site"
	icon_state = "storage"
	environment = PLAIN

/area/constructionsite/storage
	name = "\improper Construction Site Storage Area"

/area/constructionsite/science
	name = "\improper Construction Site Research"

/area/constructionsite/bridge
	name = "\improper Construction Site Bridge"
	icon_state = "bridge"

/area/constructionsite/maintenance
	name = "\improper Construction Site Maintenance"
	icon_state = "yellow"

/area/constructionsite/hallway/aft
	name = "\improper Construction Site Aft Hallway"
	icon_state = "hallP"

/area/constructionsite/hallway/fore
	name = "\improper Construction Site Fore Hallway"
	icon_state = "hallS"

/area/constructionsite/atmospherics
	name = "\improper Construction Site Atmospherics"
	icon_state = "green"

/area/constructionsite/medical
	name = "\improper Construction Site Medbay"
	icon_state = "medbay"

/area/constructionsite/ai
	name = "\improper Construction Computer Core"
	icon_state = "ai"

/area/constructionsite/engineering
	name = "\improper Construction Site Engine Bay"
	icon_state = "engine"

/area/solar/constructionsite
	name = "\improper Construction Site Solars"
	icon_state = "aft"

//area/constructionsite
//	name = "\improper Construction Site Shuttle"

//area/constructionsite
//	name = "\improper Construction Site Shuttle"


//Construction

/area/construction
	name = "\improper Construction Area"
	icon_state = "yellow"
	environment = QUARRY

/area/desubber
	name = "\improper Phoron Desublimation Room"
	icon_state = "yellow"
	environment = QUARRY

/area/expansionzone
	name = "\improper Expansion Zone"
	icon_state = "yellow"
	environment = QUARRY

/area/construction/IAA
	name = "\improper Construction Zone"

/area/construction/supplyshuttle
	name = "\improper Supply Shuttle"
	icon_state = "yellow"

/area/construction/quarters
	name = "\improper Engineer's Quarters"
	icon_state = "yellow"

/area/construction/qmaint
	name = "Maintenance"
	icon_state = "yellow"

/area/construction/hallway
	name = "\improper Hallway"
	icon_state = "yellow"

/area/construction/solars
	name = "\improper Solar Panels"
	icon_state = "yellow"
	environment = PLAIN

/area/construction/solarscontrol
	name = "\improper Solar Panel Control"
	icon_state = "yellow"

/area/construction/Storage
	name = "Construction Site Storage"
	icon_state = "yellow"

//AI

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"
	environment = ALLEY

/area/ai_monitored/storage/secure
	name = "Secure Storage"
	icon_state = "storage"
	environment = ALLEY

/area/ai_monitored/storage/emergency
	name = "Emergency Storage"
	icon_state = "storage"

/area/turret_protected/ai_upload
	name = "\improper AI Upload Chamber"
	icon_state = "ai_upload"
	music = list('sound/ambience/ambimalf.ogg')
	environment = ALLEY

/area/turret_protected/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"
	music = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_server_room
	name = "AI Server Room"
	icon_state = "ai_server"

/area/turret_protected/ai
	name = "\improper AI Chamber"
	icon_state = "ai_chamber"
	music = list('sound/ambience/ambimalf.ogg')
	environment = ALLEY

/area/turret_protected/ai_cyborg_station
	name = "\improper Cyborg Station"
	icon_state = "ai_cyborg"

/area/turret_protected/aisat
	name = "\improper AI Satellite"
	icon_state = "ai"
	environment = ALLEY

/area/turret_protected/aisat_interior
	name = "\improper AI Satellite"
	icon_state = "ai"

/area/turret_protected/AIsatextFP
	name = "\improper AI Sat Ext"
	icon_state = "storage"
	luminosity = 1
	lighting_use_dynamic = 0

/area/turret_protected/AIsatextFS
	name = "\improper AI Sat Ext"
	icon_state = "storage"
	luminosity = 1
	lighting_use_dynamic = 0

/area/turret_protected/AIsatextAS
	name = "\improper AI Sat Ext"
	icon_state = "storage"
	luminosity = 1
	lighting_use_dynamic = 0

/area/turret_protected/AIsatextAP
	name = "\improper AI Sat Ext"
	icon_state = "storage"
	luminosity = 1
	lighting_use_dynamic = 0

/area/turret_protected/NewAIMain
	name = "\improper AI Main New"
	icon_state = "storage"



//Misc



/area/wreck/ai
	name = "\improper AI Chamber"
	icon_state = "ai"
	environment = PLAIN

/area/wreck/main
	name = "\improper Wreck"
	icon_state = "storage"
	environment = PLAIN

/area/wreck/engineering
	name = "\improper Power Room"
	icon_state = "engine"
	environment = PLAIN

/area/wreck/bridge
	name = "\improper Bridge"
	icon_state = "bridge"
	environment = PLAIN

/area/generic
	name = "Unknown"
	icon_state = "storage"
	environment = QUARRY


// Telecommunications Satellite
/area/tcomms/
	music = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	environment = QUARRY

/area/tcomms/entrance
	name = "\improper Telecomms Teleporter"
	icon_state = "tcomsatentrance"

/area/tcomms/chamber
	name = "\improper Telecomms Central Compartment"
	icon_state = "tcomsatcham"

/area/turret_protected/tcommbreaker
	name = "\improper Telecomms Breaker Room"
	icon_state = "tcomsatcomp"

/area/tcomms/computer
	name = "\improper Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/turret_protected/tcomsat
	name = "\improper Abandoned Satellite"
	icon_state = "tcomsatlob"
	music = list('sound/ambience/ambispace.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg','sound/ambience/ambispace1.ogg', ,'sound/ambience/ambispace2.ogg' )


// Labor Camp
/area/laborcamp
	name = "Labor Camp"
	icon_state = "brig"
	environment = QUARRY

/area/laborcamp/cargohold
	name = "\improper Cargohold"
	icon_state = "brig"

/area/laborcamp/armory
	name = "\improper Armory"
	icon_state = "brig"

/area/laborcamp/office
	name = "\improper Office"
	icon_state = "brig"

/area/laborcamp/officebackroom
	name = "\improper Office Backroom"
	icon_state = "brig"

/area/laborcamp/atmosphericsequip
	name = "\improper Atmospherics Equipment"
	icon_state = "brig"

/area/laborcamp/yard
	name = "\improper Yard"
	icon_state = "brig"

/area/laborcamp/yardairlock
	name = "\improper Yard Airlock"
	icon_state = "brig"

/area/laborcamp/guardpostnorth
	name = "\improper Guard Post North"
	icon_state = "brig"

/area/laborcamp/guardpostsouth
	name = "\improper Guard Post South"
	icon_state = "brig"

/area/laborcamp/medical
	name = "\improper Medical Room"
	icon_state = "brig"

/area/laborcamp/recreation
	name = "\improper Recreation"
	icon_state = "brig"

/area/laborcamp/hallwaynorth
	name = "\improper North Wing"
	icon_state = "brig"

/area/laborcamp/hallwaysouth
	name = "\improper South Wing"
	icon_state = "brig"


// Away Missions
/area/awaymission
	name = "\improper Strange Location"
	icon_state = "away"

/area/awaymission/example
	name = "\improper Strange Station"
	icon_state = "away"

/area/awaymission/wwmines
	name = "\improper Wild West Mines"
	icon_state = "away1"
	luminosity = 1
	requires_power = 0

/area/awaymission/wwgov
	name = "\improper Wild West Mansion"
	icon_state = "away2"
	luminosity = 1
	requires_power = 0

/area/awaymission/wwrefine
	name = "\improper Wild West Refinery"
	icon_state = "away3"
	luminosity = 1
	requires_power = 0

/area/awaymission/wwvault
	name = "\improper Wild West Vault"
	icon_state = "away3"
	luminosity = 0

/area/awaymission/wwvaultdoors
	name = "\improper Wild West Vault Doors"  // this is to keep the vault area being entirely lit because of requires_power
	icon_state = "away2"
	requires_power = 0
	luminosity = 0

/area/awaymission/desert
	name = "Mars"
	icon_state = "away"

/area/awaymission/BMPship1
	name = "\improper Aft Block"
	icon_state = "away1"

/area/awaymission/BMPship2
	name = "\improper Midship Block"
	icon_state = "away2"

/area/awaymission/BMPship3
	name = "\improper Fore Block"
	icon_state = "away3"

/area/awaymission/spacebattle
	name = "\improper Space Battle"
	icon_state = "away"
	requires_power = 0

/area/awaymission/spacebattle/cruiser
	name = "\improper Nanotrasen Cruiser"

/area/awaymission/spacebattle/syndicate1
	name = "\improper Syndicate Assault Ship 1"

/area/awaymission/spacebattle/syndicate2
	name = "\improper Syndicate Assault Ship 2"

/area/awaymission/spacebattle/syndicate3
	name = "\improper Syndicate Assault Ship 3"

/area/awaymission/spacebattle/syndicate4
	name = "\improper Syndicate War Sphere 1"

/area/awaymission/spacebattle/syndicate5
	name = "\improper Syndicate War Sphere 2"

/area/awaymission/spacebattle/syndicate6
	name = "\improper Syndicate War Sphere 3"

/area/awaymission/spacebattle/syndicate7
	name = "\improper Syndicate Fighter"

/area/awaymission/spacebattle/secret
	name = "\improper Hidden Chamber"

/area/awaymission/listeningpost
	name = "\improper Listening Post"
	icon_state = "away"
	requires_power = 0

// Admin Preperation area for events for use with the valan's ship
/area/adminprep/valansship
	name = "\improper valans shuttle"
	icon_state = "south"
	requires_power = 0
	lighting_use_dynamic = 0 // the ship doesn't have any lights
	environment = PLAIN

/area/adminprep/valansshiparrival
	name = "\improper valans shuttle arrival"
	icon_state = "south"
	requires_power = 0
	lighting_use_dynamic = 0 // the ship doesn't have any lights
	environment = PLAIN

/area/adminprep/valanspreparea
	name = "\improper valan prep room"
	icon_state = "red"
	requires_power = 0
	environment = PLAIN

// Asteroid fields - it's space really
/area/asteroidfields/asteroideva
	name = "\improper Pirate Asteroid eva"
	icon_state = "red"
	environment = HANGAR
	requires_power = 0

/area/asteroidfields/asteroidarea1
	name = "\improper Pirate Asteroid area1"
	icon_state = "bluenew"
	environment = STONE_CORRIDOR

/area/asteroidfields/asteroidcave
	name = "\improper Pirate Asteroid cave"
	icon_state = "purple"
	environment = CAVE

/area/asteroidfields/shuttle
	name = "\improper Pirate Asteroid shuttle area"
	icon_state = "south"
	lighting_use_dynamic = 0 // the ship doesn't have any lights
	environment = PLAIN

/area/artemis/command
	name = "NSS Artemis Command"
	icon_state = "bridge"

/area/artemis/medical
	name = "NSS Artemis Medical Department"
	icon_state = "medbay"

/area/artemis/cargo
	name = "NSS Artemis Cargobay"
	icon_state = "quartoffice"

/area/artemis/security
	name = "NSS Artemis Security Department"
	icon_state = "security"

/area/artemis/science
	name = "NSS Artemis Science Department"
	icon_state = "research"

/area/artemis/engineering
	name = "NSS Artemis Engineering Department"
	icon_state = "yellow"

/area/artemis/civilian
	name = "NSS Artemis Civilian Wing"
	icon_state = "green"

/area/artemis/hallway
	name = "NSS Artemis Hallway"
	icon_state = "hallS"

/area/artemis/arrivals
	name = "NSS Artemis Arrivals"
	icon_state = "hallP"

/area/artemis/departure
	name = "NSS Artemis Departures"
	icon_state = "hallA"

/area/artemis/maint/port
	name = "NSS Artemis Portside Maintenance"
	icon_state = "pmaint"

/area/artemis/maint/starboard
	name = "NSS Artemis Starboard Maintenance"
	icon_state = "smaint"

//////////////// PLANET ///////////////////////////////////
/area/planet
	base_turf = /turf/planet

/area/planet/moon
	name = "\improper moon"
	icon_state = "moon"
	environment = PLAIN

	base_turf = /turf/planet/lunar

/area/planet/exterior
	name = "\improper moon"
	icon_state = "moon"
	environment = PLAIN

	ambience = list( 'sound/ambience/ambience_outpost.ogg' )
	music = list( 'sound/ambience/ambispace.ogg','sound/ambience/ambispace1.ogg','sound/ambience/ambispace2.ogg' )

/area/planet/moon/exterior
	name = "\improper moon"
	icon_state = "moon"
	environment = PLAIN

	ambience = list( 'sound/ambience/ambience_outpost.ogg' )
	music = list( 'sound/ambience/ambispace.ogg','sound/ambience/ambispace1.ogg','sound/ambience/ambispace2.ogg' )


/area/planet/moon/landing_zone
	name = "\improper landing zone"
	icon_state = "south"
	requires_power = 0

/area/planet/moon/explored
	name = "\improper explored moon"
	icon_state = "north"
	requires_power = 0

/area/planet/moon/outpost
	name = "\improper outpost"
	icon_state = "south"
	requires_power = 0

/area/planet/moon/base/
	environment = HALLWAY

/area/planet/moon/base/dorms
	name = "\improper Dormitory"
	icon_state = "Sleep"

/area/planet/moon/base/arrivals
	name = "\improper Moonbase Entry"
	icon_state = "research"

/area/planet/moon/base/security
	name = "\improper Security Post"
	icon_state = "security"

/area/planet/moon/base/medbay
	name = "\improper Medbay"
	icon_state = "medbay"

/area/planet/moon/base/engineering
	name = "\improper Engineering"
	icon_state = "engine"

/area/planet/moon/base/maintenance/foreport
	name = "\improper Fore Port Maintenance"
	icon_state = "fpmaint"

/area/planet/moon/base/maintenance/forestarboard
	name = "\improper Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/planet/moon/base/maintenance/aftport
	name = "\improper Aft Port Maintenance"
	icon_state = "apmaint"

/area/planet/moon/base/maintenance/aftstarboard
	name = "\improper Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/planet/moon/base/maintenance/solars
	name = "\improper Solar Control Room"
	icon_state = "SolarcontrolP"

/area/planet/moon/base/maintenance/solarsex
	name = "\improper Moonbase Solar Arrays"
	icon_state = "panelsA"

/area/planet/moon/base/dorms
	name = "\improper Dormitory"
	icon_state = "Sleep"

/area/planet/moon/base/exterior
	name = "\improper Moonbase Exterior"
	icon_state = "research"

/area/planet/moon/base/rnd/research
	name = "\improper Research and Development"
	icon_state = "research"

/area/planet/moon/base/rnd/researchbreak
	name = "\improper Research Break Room"
	icon_state = "research"

/area/planet/moon/base/rnd/docking
	name = "\improper Research Dock"
	icon_state = "research_dock"

/area/planet/moon/base/rnd/iso1
	name = "Isolation Cell 1"
	icon_state = "iso1"

/area/planet/moon/base/rnd/iso1_access
	name = "Isolation Cell 1 - Access"
	icon_state = "iso1"

/area/planet/moon/base/rnd/iso2
	name = "Isolation Cell 2"
	icon_state = "iso2"

/area/planet/moon/base/rnd/iso3
	name = "Isolation Cell 3"
	icon_state = "iso3"

/area/planet/moon/base/rnd/anomaly
	name = "Anomalous Materials Lab"
	icon_state = "anolab"

/area/planet/moon/base/incinerator
	name = "Incinerator"
	icon_state = "apmaint"

/area/planet/moon/base/rnd/lab
	name = "\improper Research Lab"
	icon_state = "toxlab"

/area/planet/moon/base/rnd/rdoffice
	name = "\improper Research Director's Office"
	icon_state = "head_quarters"

/area/planet/moon/base/rnd/supermatter
	name = "\improper Supermatter Lab"
	icon_state = "toxlab"

/area/planet/moon/base/rnd/xenobiology
	name = "\improper Xenobiology Lab"
	icon_state = "xeno_lab"

/area/planet/moon/base/rnd/xenobiology/xenoflora_storage
	name = "\improper Xenoflora Storage"
	icon_state = "xeno_f_store"

/area/planet/moon/base/rnd/xenobiology/xenoflora
	name = "\improper Xenoflora Lab"
	icon_state = "xeno_f_lab"

/area/planet/moon/base/rnd/storage
	name = "\improper Toxins Storage"
	icon_state = "toxstorage"

/area/planet/moon/base/rnd/storage2
	name = "\improper Research Equipment Storage"
	icon_state = "storage"

/area/planet/moon/base/rnd/test_area
	name = "\improper Toxins Test Area"
	icon_state = "toxtest"

/area/planet/moon/base/rnd/mixing
	name = "\improper Toxins Mixing Room"
	icon_state = "toxmix"

/area/planet/moon/base/rnd/alloy_lab
	name = "\improper Alloys Lab"
	icon_state = "alloylab"

/area/planet/moon/base/rnd/misc_lab
	name = "\improper Miscellaneous Research"
	icon_state = "toxmisc"

/area/planet/moon/base/rnd/server
	name = "\improper Server Room"
	icon_state = "server"

/area/planet/moon/base/rnd/hallway
	name = "\improper Server Room"
	icon_state = "research"




/////////////////////////////////////////////////////////////////////
/*
 Lists of areas to be used with is_type_in_list.
 Used in gamemodes code at the moment. --rastaf0
*/

// CENTCOM
var/list/centcom_areas = list (
	/area/centcom,
	/area/shuttle/escape/centcom,
	/area/shuttle/escape_pod1/centcom,
	/area/shuttle/escape_pod2/centcom,
	/area/shuttle/escape_pod3/centcom,
	/area/shuttle/escape_pod5/centcom,
	/area/shuttle/transport1/centcom,
	/area/shuttle/administration/centcom,
	/area/shuttle/specops/centcom,
)

//Apollo Station
var/list/the_station_areas = list (
	/area/shuttle/arrival,
	/area/shuttle/escape/station,
	/area/shuttle/escape_pod1/station,
	/area/shuttle/escape_pod2/station,
	/area/shuttle/escape_pod3/station,
	/area/shuttle/escape_pod5/station,
	/area/shuttle/mining/station,
	/area/shuttle/transport1/station,
	// /area/shuttle/transport2/station,
	/area/shuttle/prison/station,
	/area/shuttle/administration/station,
	/area/shuttle/specops/station,
	/area/atmos,
	/area/maintenance,
	/area/hallway,
	/area/bridge,
	/area/crew_quarters,
	/area/holodeck,
	/area/mint,
	/area/library,
	/area/chapel,
	/area/lawoffice,
	/area/engine,
	/area/solar,
	/area/assembly,
	/area/teleporter,
	/area/medical,
	/area/security,
	/area/quartermaster,
	/area/janitor,
	/area/hydroponics,
	/area/rnd,
	/area/storage,
	/area/construction,
	/area/ai_monitored/storage/eva, //do not try to simplify to "/area/ai_monitored" --rastaf0
	/area/ai_monitored/storage/secure,
	/area/ai_monitored/storage/emergency,
	/area/turret_protected/ai_upload, //do not try to simplify to "/area/turret_protected" --rastaf0
	/area/turret_protected/ai_upload_foyer,
	/area/turret_protected/ai,
)