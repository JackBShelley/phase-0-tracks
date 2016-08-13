#I'm aware this example isn't currently a real world example, I'm just trying to be proactive.

spaceship = {
	:dockingbay => {
		objective: ["Maintain operational status of all Kestrel Class fighters", "Escort incoming ships to appropriate docking area", "Fuel and equip outgoing fighters and transports"], 
		:ship_count => 6, 
		shield_status: 'active', 
		lifeform_count:14,
		captains_log: "Too god damned loud down here. Thomas the mechanic also makes fun of my captains hat. It is a very cool hat. Avoid the docking bay."
	},
		
	:living_quarters => {
		objective: [nil],
		shield_status: 'active',
		lifeform_count: 32,
		:inventory => {:rations => 1204, :blasters => 46, :spacesuits => 20},
		captains_log: "The crew is complaining about living conditions again. I can send the request to improve the living quarters, or I can equip the ship with the new Orbital Destruction Cannon. I think the choice is clear."
	},
	
	:control_room => {
		objective: ["Set waypoints for inter-planetary travel", "Maintain life support systems", "Don't crash the ship, DAREN."], 
		shield_status:  'active', 
		lifeform_count: 11, 
		'people who are banned from flying the ship' => ["Daren", "Perseus B", "Captain Comstock"],
		captains_log: "Pretty comfy up here. I got the Federation to install one of those big swivel chairs with all the buttons on it. The crew insists the buttons have a function but I'm starting to get suspicious."
	},
	
	:weapons_array => {
		objective: ["Eliminate enemy forces swiftly and without mercy"],
		shield_status:  'active', 
		lifeform_count: 4,
		:weapons => ["Atomic Deconstruction Ray", "Particle Incenerator", "Orbital Destruction Cannon", "Peter's Wife ahahaha (Remove Entry Before Departure)"],
		captains_log: "PEW PEW PEW RATATATATATATTA BANG BANG KABOOOSH ahahahahhaaa... man I love being captain."
	}
}

p spaceship[:dockingbay][:objective]
p spaceship[:dockingbay][:objective][0]
p spaceship[:weapons_array][:captains_log]
p spaceship[:control_room]['people who are banned from flying the ship'][0]

