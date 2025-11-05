function create_dialouge(_messages){
if (instance_exists(Obj_dialouge))return;

var _inst = instance_create_depth(0, 0, 0, Obj_dialouge);
_inst.messages = _messages;
_inst.current_message = 0;
}

char_colours = {
        "Congrats": c_yellow,
		"Dad": c_purple,
		"Timmy(you)": c_maroon,
		"Just your fellow npc (nothing to do with lore... right?)": c_orange,
		"Goblin": c_olive,
		"Blacksmith": c_gray,
		"Karen": c_dkgray,
		"Guard": c_silver,
}

welcome_dialouge = [
{
	name:"Dad",
	msg:"good morn'n timmy!!!"
},

{
	name:"Timmy(you)",
	msg:"Morning"
},

{
	name:"Dad",
	msg:"Happy 13th b-day"
},

{
	name:"Timmy(you)",
	msg:"(Oh yea its my b-day!!!)-thought"
},

{
	name:"Timmy(you)",
	msg:"Thanks!!!"
},

{
	name:"Dad",
	msg:"Oh yeah! You are finnaly old enough to join the wood chopping buisness!"
},

{
	name:"Dad",
	msg:"You meet me outside! I'll be chopp'n wood!"
},
]

Quest = [
{
	name:"Dad",
	msg:"Nice you made it!"
},

{
	name:"Timmy(you)",
	msg:"How can i help!!!"
},

{
	name:"Dad",
	msg:"I need you to chop wood in the forest nearby. Here is my spear axe!"
},

{
	name:"Congrats",
	msg:"You have recieved a spare axe!\nPress space to use it!"
},

{
	name:"Dad",
	msg:"When you see a pig press shift to open shop and ESC to close use your gold wisly"
},

{
	name:"Congrats",
	msg:"You have recieved 100 GOLD!\Use it in da shop!"
},
]

Warning = [

{
	name:"Just your fellow npc (nothing to do with lore... right?)",
	msg:"Just warnin ya its dangerous out there!"
},
]

GetOut = [
{
	name:"Karen",
	msg:"Erm... Get OUT!!!"
},
]

Blacksmith = [
{
	name:"Blacksmith",
	msg:"Want new weapons?"
},

{
	name:"Timmy(you)",
	msg:"Yes!!!"
},

{
	name:"Blacksmith",
	msg:"Womp womp ur not getting noth'n"
},
]

Goblin = [
{
	name:"Goblin",
	msg:"Just enjoing da veiw!"
},
]

Welcome_to_goblin_city = [
{
	name:"Guard",
	msg:"Welcome to goblin town..."
},

{
	name:"Guard",
	msg:"Wait...\nAre you a goblin?"
},

{
	name:"Timmy(you)",
	msg:"umm...\nyeah, yeah..."
},

{
	name:"Guard",
	msg:"Never seen a goblin this ugl...\nNVM"
},

{
	name:"Timmy(you)",
	msg:"HEY!!!"
},
]

DONT = [

{
	name:"Just your fellow npc (nothing to do with lore... right?)",
	msg:"Hey its me again..."
},

{
	name:"Timmy(you)",
	msg:"Hey thanks for warnin me back there!"
},

{
	name:"Just your fellow npc (nothing to do with lore... right?)",
	msg:"Your welcome"
},

{
	name:"Timmy(you)",
	msg:"Anything else u wanna add?"
},

{
	name:"Just your fellow npc (nothing to do with lore... right?)",
	msg:"Oh yea!"
},

{
	name:"Just your fellow npc (nothing to do with lore... right?)",
	msg:"Just warnin ya its dangerous down there!"
},

{
	name:"Timmy(you)",
	msg:"Haha, Thanks!!!"
},
]


