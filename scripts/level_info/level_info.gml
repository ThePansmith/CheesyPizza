function __levelinfo(gate_room, john_room, name) constructor
{
	self.gate_room = gate_room;
	self.john_room = john_room;
	self.name = name;
}
function level_info(levelname)
{
	switch levelname
	{
		case "entrance":
			return new __levelinfo(entrance_1, entrance_10, "John Gutter");
		case "medieval":
			return new __levelinfo(medieval_1, medieval_10, "Pizzascape");
		case "ruin":
			return new __levelinfo(ruin_1, ruin_11, "Ancient Cheese");
		case "dungeon":
			return new __levelinfo(dungeon_1, dungeon_10, "Bloodsauce Dungeon");
		case "badland":
			return new __levelinfo(badland_1, badland_9, "Oregano Desert");
		case "graveyard":
			return new __levelinfo(graveyard_1, graveyard_6, "Wasteyard");
		case "farm":
			return new __levelinfo(farm_2, farm_11, "Fun Farm");
		case "saloon":
			return new __levelinfo(saloon_1, saloon_6, "Fast Food Saloon");
		case "plage":
			return new __levelinfo(plage_entrance, plage_cavern2, "Crust Cove");
		case "forest":
			return new __levelinfo(forest_1, forest_john, "Gnome Forest");
		case "space":
			return new __levelinfo(space_1, space_9, "Deep-Dish 9");
		case "minigolf":
			return new __levelinfo(minigolf_1, minigolf_8, "GOLF");
		case "street":
			return new __levelinfo(street_intro, street_john, "The Pig City");
		case "sewer":
			return new __levelinfo(sewer_1, sewer_8, "Oh Shit!");
		case "industrial":
			return new __levelinfo(industrial_1, industrial_5, "Peppibot Factory");
		case "freezer":
			return new __levelinfo(freezer_1, freezer_escape1, "Refrigerator-Refrigerador-Freezerator");
		case "chateau":
			return new __levelinfo(chateau_9, chateau_1, "Pizzascare");
		case "kidsparty":
			return new __levelinfo(kidsparty_1, kidsparty_john, "Don't Make A Sound");
		case "exit":
			return new __levelinfo(tower_finalhallway, tower_entrancehall, "The Crumbling Tower Of Pizza");
	}
	return noone;
}
