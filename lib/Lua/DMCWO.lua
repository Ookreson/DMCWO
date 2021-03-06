--[[
DMC's Weapon Overhaul
v1.42.3
HoxHud Hook Version
]]

--The native Windows notepad application likes to mess with the formatting/encryption and makes the script unreadable by the hook so I recommend something like Notepad++

if not DMCWO then
	DMCWO = DMCWO or {}
end

--Set to true if you don't want the "rebalance" set up messages to print to the console/log
DMCWO.Setup_Stfu = false 

--Set to true if you don't want the random message printing to the console/log after the persist scripts set up
DMCWO.stfu = false 

--Regardless of either setting, you will still be warned if you leave the TestVar for w/e "rebalance" script commented out/nil

--[[ DEBUG/WIP TOGGLES ]]--{
--Really these are just for me for development and testing purposes but I figure why not? The default setting for all of these are "false"

--REQUIRES THE ENGINE CONSOLE TO BE ENABLED (unless you feel like reading the log.txt)
--YOU MAY GET PERFORMANCE DROPS WHILE USING THIS WITH AUTOMATIC FIRE
--If set to true, outputs various statistics from your last shot taken from a "newraycastweaponbase" gun
--Shots into the open skybox are not tracked
--Non-"newraycastweaponbase" guns are not tracked
DMCWO.debug_range = false

--If set to true, disables ALL damage boosts from skills
DMCWO.debug_damage = false

--If set to true, viewmodel positioning while UNAIMED is changed to emulate DOOM
--Attached optics have a pretty good chance of getting in the way so you should remove them before hand
--Overrides hipfire/crouched stance changes from "reposed_vms" if that is active
--WIP
DMCWO.doomguy = false

--If set to true, gets rid of the ammo purse reload system for box magazine/belt fed weapons. Reloading before emptying your current magazine will discard any rounds left in that magazine.
--The chambered round is taken into consideration (if the weapon is closed bolt) and will not be lost if doing a non-empty reload
--The Beretta 682/Joceline is excluded from this despite using the "magazine" reload system as you keep your second shell loaded when you perform a non-empty reload.
--NOTE: This does NOT play well with Tasers. When you get tased, it runs the reload code to top up your mag before you dump it all. Guess what happens...
--WIP
DMCWO.no_ammo_purse = false
--}

--[[ STRING TOGGLES ]]--{

--If set to true, renames/changes the description of weapons to their IRL counter parts
--NOTE: This only affects weapon names. Descriptions are unchanged
--Default = true
DMCWO.reelnaems = true

--If set to true, Revolver Ocelot
--NOTE: Revolver Ocelot
--NOTE 2: Revolver Ocelot
--NOTE 3: This overrides weapons affected by DMCWO.reelnaems if it's also set to true
--Default = false
DMCWO.ocelot = false

--If set to true, renames/changes the description of weapons to their Upotte counter parts (if they've made an appearance)
--NOTE: This is really fucking stupid
--NOTE 2: Jiisuri is loev. Jiisuri is lyfe.
--NOTE 3: This overrides weapons affected by DMCWO.reelnaems if it's also set to true
--Default = false
DMCWO.upotte = false

--}

--[[ WEAPON TOGGLES ]]--{

--If set to true, you leave behind PD:TH sniper trails for the MSR, R93, Mosin, WA2000 and M95
--Default = false
DMCWO.sniper_tracers = false

--If set to true, ALL raycast firing guns (shotguns too) leave PD:TH sniper trails.
--NOTE: This is really fucking stupid
--Default = false
DMCWO.light_show = false

--If set to true, you retain closer-to-vanilla total ammo counts.
--I say "closer-to-vanilla" as mag capacities remain adjusted which can still influence total ammo.
--More or less just there if you're really paranoid about being questioned about your ammo when playing with the unknowing (but with that said, why are you playing pubs?)
--Default = false
DMCWO.vanilla_ammo = false

--Repositions the viewmodels of most weapons so they obscure less of your view and reduce clipping of guns and/or attachments with the FPS camera
--Intended for use with a maximized FOV slider (using the default slider ranges) although it'll still work with any FOV setting
--If false, you'll probably encounter floating arms or camera clipping
--Default = true
DMCWO.reposed_vms = true

--If set to true, allows attachments that modify ammo pickup to be affected by Walk-in-Closet or Fully Loaded Aced
--Default = false
DMCWO.fix_pickup = false

--}

--[[ MELEE TOGGLES ]]--{

--If set to true, using the fists allows you to turn into Kenshiro from Hokuto No Ken (Fist of the North Star)
--"AAAH-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA-TA"
--Default = false
DMCWO.kenshiro = false

--If set to true, become Raiden
DMCWO.RULESOFNATURE = false
--AND THEY RUN WHEN THE SUN COMES UP
--WITH THEIR LIVES ON THE LINE

--}

--[[ ATTACHMENT TOGGLES ]]--{
--Pick and choose what you want, mostly eveything here is aesthetic. Only a few may change gameplay
--Changes will ony take effect after you go through a loading screen or reboot the game

--[General]--{
--If set to true, hides attachable rifle/SMG/LMG class muzzle brakes
--Default = false
DMCWO.hide_brakes = false

--If set to true, hides attachable shotgun class muzzle brakes
--Default = false
DMCWO.hide_sg_brakes = false

--If set to true, hides the Flash Hider attachment for all pistols that can accept it. 
--Default = false
DMCWO.hide_pis_flash = false

--If set to true, enables the ELCAN Specter to use the BUIS on the top of the optic. 
--Default = false
--NOTE: Enabling this will remove the 45 degree irons if they're attached, disallow it from being attached along with the ELCAN scope and will take the place as the first gadget you switch to with the laser/flashlight gadget becoming the second and/or third gadget you switch to
--NOTE 2: You'll also get a floating 45 degree angle gadget in the main menu and mod screen, it's a side effect of having the BUIS actually work
--NOTE 3: Every now and then I might forget to update this for new weapons
DMCWO.elcan_buis = false

--if set to true, swaps the Magpul BUIS/Flip-up sights with the default ones from the KSG (Daniel Defence Irons)
--NOTE: May be slightly misaligned, not a priority of mine to fix it.
DMCWO.buis_swap = false
--}

--[AK type weapons]--{
--If set to true, when low power optics are attached to an AK type weapon, the gun is pulled up closer for optics to be in-line with the other guns. 
--Default = false
--NOTE: Higher powered optics like the Specter, ACOG, Short Dot and Leupold will always be held close to the player camera while ADS, regardless of this being true or false
DMCWO.ak_optics = false

--If set to true, all occurences of the underfolding stock being default on AK type weapons is changed to the sidefolding stock and the sidefolding stock attachment is changed to the Underfolder. Makes more sense from a stability standpoint too
--Default = false
DMCWO.akmsu_stock_switch = false
DMCWO.akm_stock_switch = false
DMCWO.saiga_stock_switch = false
DMCWO.rpk_stock_switch = false
--}

--[AR15 type weapons]--{
--If set to true, changes the upper receiver on the M16 and Para SMG/AR to the A2 upper receiver.
--Default = false
--NOTE: The empty reload for the Para SMG/AR are kinda broken when you use this (charging handle does not move). If I set it to move it looks even worse due to the timing being really off
DMCWO.a2_upper = false

--Makes it so the front post gas block for the AMCAR/M733, AMR/M16 and Para/Olympic stay even when an optic is attached (with the exception of the two sniper scopes) and IRL, actually be able to function (removing the gas block prevents the bolt from cycling and would pretty much turn the gun into a bolt action rifle). 
--Default = true
DMCWO.ar_front_post = true

--If set to true, sets the Long Barrel for the CAR-4/M4A1 to use the medium barrel (default barrel normally), the default Medium Barrel for the CAR-4/M4A1 to use the Short Barrel model and the Short Barrel for the CAR-4/M4A1 to use the AUG Short Barrel model. 
--Default = false
--NOTE: Slight clipping will occur if you use a suppressor w/ the Short Barrel and Geissele Rail
DMCWO.m4_barrel = false

--If set to true, visually breaks the AMCAR upon attaching the Exotique/VLTOR upper reciever, even more so if you dettach it. A bug I'm keeping in as a toggle at the request of friends during pre-release. If you toggled while it's broken/not broken, just reattach the Exotique/VLTOR upper. 
--Default = false
DMCWO.its_fucked = false

--if set to true, sets the default A2 upper on the AMCAR/M733 to the railed upper w/carry handle
--DMCWO.amcar_upper = WIP, not a priority
--}

--[M249]--{
--If set to true, sets the M249 short and long barrels to use the G3 barrel models to match the rest of the black barrel. 
--Default = false
DMCWO.m249_barrel = false
--}

--[MP7]--{
--If set to true, hides the collapsed stock on the SpecOps/MP7 so it looks like you're buying it. 
--Default = false
DMCWO.mp7_nostock = false

--If set to true, changes the stubby tan VFG on the MP7 to the black VFG. 
--Default = false
DMCWO.mp7_vfg = false
--}

--[M45]--{
--If set to true, hides the folded stock "attachment" so it looks like you're paying for custom work to have it removed. 
--Default = false
DMCWO.m45_nostock = false
--}

--[KSG]--{
--If set the true, changes the gadget location on the KSG to only ever be on the side of the pump and not in front of your optic if one is attached. 
--Default = true
DMCWO.ksg_gadget = true
--}

--[Judge]--{
--If set to true, set the pistol grip on the judge to that of the one on the Raging Bull. 
--Default = false
DMCWO.judge_grip = false
--}

--[M10]--{
--If set to true, hides the M10's default wire stock. 
--Default = false
DMCWO.hide_mac_wire = false
--}

--[Model 870]--{
--If set to 1, hides the R870 tube cap extension on the R870. 
--If set to 2, sets the R870 tube cap extension to the one used on the Loco. 
--Any other value uses the default R870 tube cap. 
--Default = "0"
DMCWO.remington_cap = 0

--If set to 1, hides the Loco tube cap extension on the Loco. 
--If set to 2, sets the Loco tube cap extension to the one used on the R870. 
--Any other value uses the default Loco tube cap. 
--Default = "0"
DMCWO.loco_cap = 0
--}

--[SG552]--{
--If set to true, changes the rear iron sight on the Commando 553/SG552 to be replaced with the Marksman rear pistol sight. 
--Default = false
DMCWO.sig_rear_iron = false

--If set to true, on the SG552, the respective "Standard" version of a part will have its model swapped with its "Enhanced" counterpart and vice versa.
--Default = false
--Keep in mind this won't make sense for concealment
DMCWO.sg552_stock = false
DMCWO.sg552_handguard = false
DMCWO.sg552_grip = false
--}

--[MK.17]--{
--if set to true, hides the AFG seen on the SCAR. 
--Default = false
DMCWO.scar_afg_hide = false
--}

--[M95]--{
--if set to true, hides the M95's bipod. 
--Default = false
DMCWO.barret_bipod = false
--}

--}

	
--Random messages
--Which line can you get in your log/console? :^)
DMCWO.Strings = {
"Jiisuri is is mai raifu~", 
"Don't get yourself in a pickle!", 
"Kawaii heister when?",
"\"My love for you is like a truck, Berserker\" \n\"Would you like some making fuck, Berserker\" \n\"My love for you is like a rock, Berserker\" \n\"Berserker\"",
"\"I WILL GIVE YOU MY ALL\"",
"Noep-roblems here!",
"\"Kono lolicon domome!\"",
"\"Filthy lolicon scum!\"",
"\"There are no buses in Gensokyo!\"", --https://www.youtube.com/watch?v=GNeyqFfXf7k
"Cirno must taste good...", --https://www.youtube.com/watch?v=JUBbigtfCWs
"\"PETTAN PETTAN TSURUPETTAN\"", --https://www.youtube.com/watch?v=hfUe2eckPFQ
"*tips fedora*",
"\"At this moment I am euphoric...\"",
"Guys, the thermal drill, go get it...",
"ONE",
"\"MOOOOM! GET THE CAMERAAAA!\"",
"Butts",
"\"But I poop from there!\"\n\"Not right now you don't!\"",
"My Uncle survived a mustard gas attack and pepper spray. He's quite the seasoned veteran.",
"DONUT STEEL",
">implying",
"pls",
"\"Do you like hurting other people?\"",
"\"Do you know what time it is?\"",
"\"IT'S TIME TO D-D-D-D\"\n\"DU-DU-DU-DUEL\"",
"Why is this here?",
"Is that a FAMAS?",
"Is that a Deagle?",
"Is that a M16?",
"\"WOMBO COMBO\"",
"\"STUPID FAGGOT LITTLE COCKSUCKER\"", --https://www.youtube.com/watch?v=nLmsVBgZiak
"\"Have you ever tried to fuck a box?\"", --https://www.youtube.com/watch?v=VXiavai0ZLU
"\"SUMONE JUMPDE FRUM DEE BEELDEENG!\"", --https://www.youtube.com/watch?v=GU3Gg696yrM
"ebin :DDD",
"\"Nice meme\"",
"\"CARLOS!!!\"",
"\"That ain't Falco!\"",
"\"What is a man?\"\n\"A miserable little pile of secrets...\"",
"\"The cake is a lie\"",
"You suck and we hate you \nLove, H&K",
"I'll Heckle your Koch",
"What a Koch sucker",
"\"Hot meme\" \n\"is cold\"",
"\"This one time at band camp...\"",
">tfw I'm stuck with a toaster laptop",
"\"I'm 12 and what is this?\"",
"\"AH NU, CHEEKI BREEKI IV DAMKE!!\"",
"\"What is love? Baby don't hurt me, don't hurt me, no more!v",
"Pre-B CZ75 when?",
"My friend in the army lost his left arm to an explosion. Thankfully he's all right now.",
"AA2 HGOTY, all year, every year",
"\"Lightning bolt, lightning bolt, lightning bolt!!\"",
"\"topkek\"",
"*Insert bad pun here*",
"\"ayy lmao\"",
"\"IMPREGNATE MY ASS!!!\"", --https://www.youtube.com/watch?v=XpeyDCsLarg
"\"GAY DICK SEX\"", 
"\"420 BLAZE IT\"", --http://420.moe/
"Would you Nep a Nep Nep? \nBecause I would...",
"\"2spooky4me\"",
";)",
":3c",
">tfw I can't have mai raifu in Canada",
"What're you doing reading this?",
"\"SILENCIO?\"",
"\"ECH\"",
"\"ORAORAORAORAORAORAORAORAORAORAORAORAORAORAORAORA\"",
"\"MUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDA\"",
"\"RERORERORERORERORERORERORERORERORERORERORERORERO\"",
"fugg da bolis :DDD",
"That cop was one swood guy!",
"\"YOOOOOOOOOOOOOOOOOOOOOOOO!\"", --https://www.youtube.com/watch?v=0T6go6EOuG4
"I'll Boku your Pico",
"\"It's all ogre for you\"",
"DMCWO.stfu = true",
"MUH STOPPAN POWAH",
"RIP IN PIECE",
"\"GO! GO! GO! GO! GO! GO! GALO SENGEN!\"", --https://www.youtube.com/watch?v=1EKTw50Uf8M
"<3",
"\"Ka ka~\"", --https://www.youtube.com/watch?v=nCnd2tmhnuw
"DMC's todo list for 20xx:\n-draw more\n-draw more porn\n-lrn2code\n-get a real PC",
"\"Baka baka, baka baka\"",
"Kek la Kek",
"\"NUUUDIST BEECHOO\"",
"\"Now its personel!\"",
"Callie is better",
"Aori is better",
"Marie is better",
"Hotaru is better",
"Why not both squid sisters?",
"\"Are you a kid?\"\n\"Or a squid?\"",
"\"YOU'RE A KID NOW, YOU'RE A SQUID NOW, YOU'RE A KID, YOU'RE A SQUID, YOU'RE A KID NOW\"",
"\"SPLATATATATATATATATATATATATATATATAS SPLATOON\"",
"I'd an Inkling...",
"Get your \"First Aid Kit\" here ~<3", -->tfw drawing lewd Kawaii pictures
"I'd Nonon's nonos",
"Based LazyOzzy",
"Based Seven",
"\"Dickbutt\"",
"\"What what, in the butt\"",
"\"Her name is Koko, she is loco, I said oh no!\"", --https://www.youtube.com/watch?v=IIn63BNIncE
"\"I have no need for filthy language and idle threats...\"",
"Anime is for losers!", -- ;)
"How long until this gets old?", -- Once
"\"Jonaaaah!\"",
"\"Weapon, I have it all!\"",
"I need to draw more often...",
"ISHYGDDT",
"\"Funco-chan!\"",
"[x]Touch fluffy tail",
"Kail: can you update dmcwo\nKail: thx\nRaifuism: no\nRaifuism: :^)\nKail: ill pay you\nRaifuism: pay me in :B1:s\nKail: ill pay you in sex\nRaifuism: again?", -- :^)
"\"You expected a cute girl? Too bad! It's just me, text!\"",
"\"SNAAAAAKE EEAAATERRRR!!!\"",
"The BUALLS",
"SAKO RK95 when?", --https://www.youtube.com/watch?v=Q-rEJys-Vnc
"\"git gud\"",
"\"Gimme da chocolate, Hisao\"",
"\"DOZER INCOMING\"",
"More lood Kawaii pictures when?",
"Why are fryfaced characters so good?",
"shekelfest 2015",
"You shit talking mai raifu, Slowpork?",
":^)",
"\n   ^\n  ^^^\n:^^^^^)",
"Why make lua scripts when you can draw porn?",
"What the fuck did you just fucking say about me, you little bitch?\nI'll have you know I graduated top of my class in the Navy Seals, and I've been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills.\nI am trained in gorilla warfare and I'm the top sniper in the entire US armed forces.\nYou are nothing to me but just another target.\nI will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words.\nYou think you can get away with saying that shit to me over the Internet?\nThink again, fucker.\nAs we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot.\nThe storm that wipes out the pathetic little thing you call your life.\nYou're fucking dead, kid.\nI can be anywhere, anytime, and I can kill you in over seven hundred ways, and that's just with my bare hands.\nNot only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit.\nIf only you could have known what unholy retribution your little \"clever\" comment was about to bring down upon you, maybe you would have held your fucking tongue.\nBut you couldn't, you didn't, and now you're paying the price, you goddamn idiot.\nI will shit fury all over you and you will drown in it.\nYou're fucking dead, kiddo.\n", --https://www.youtube.com/watch?v=jnp3AgXP0dU
"\"ITTY BITTY BABBY\"",
"\"ITTY BITTY BOAT\"",
"\"I DON'T BELIEVE IT\"",
"\"HABEEB IT\"",
}

------[[Script setup]]------
--[[POSTREQUIRE SCRIPTS]]
RegisterScript("lib/Lua/DMCWO/post/postrequire_attach.lua", 2, "lib/tweak_data/weaponfactorytweakdata")
RegisterScript("lib/Lua/DMCWO/post/postrequire_attach.lua", 2, "lib/tweak_data/weapontweakdata")
RegisterScript("lib/Lua/DMCWO/post/postrequire_attach.lua", 2, "lib/tweak_data/dlctweakdata")
RegisterScript("lib/Lua/DMCWO/post/postrequire_attach.lua", 2, "lib/tweak_data/lootdroptweakdata")

RegisterScript("lib/Lua/DMCWO/post/soundsfix.lua", 2, "lib/units/weapons/raycastweaponbase")

RegisterScript("lib/Lua/DMCWO/post/shotgat_physics.lua", 2, "lib/units/weapons/shotgun/newshotgunbase")
RegisterScript("lib/Lua/DMCWO/post/shotgat_physics.lua", 2, "lib/managers/gameplaycentralmanager")

RegisterScript("lib/Lua/DMCWO/post/gat_physics.lua", 2, "lib/units/weapons/newraycastweaponbase")
RegisterScript("lib/Lua/DMCWO/post/gat_physics.lua", 2, "lib/managers/blackmarketmanager")
RegisterScript("lib/Lua/DMCWO/post/gat_physics.lua", 2, "lib/tweak_data/blackmarkettweakdata")
RegisterScript("lib/Lua/DMCWO/post/gat_physics.lua", 2, "lib/managers/menu/blackmarketgui")

RegisterScript("lib/Lua/DMCWO/post/player.lua", 2, "lib/units/beings/player/playerdamage")
RegisterScript("lib/Lua/DMCWO/post/player.lua", 2, "lib/units/beings/player/states/playerstandard")

RegisterScript("lib/Lua/DMCWO/post/tact_reload.lua", 2, "lib/tweak_data/weapontweakdata")
RegisterScript("lib/Lua/DMCWO/post/tact_reload.lua", 2, "lib/units/weapons/raycastweaponbase")
RegisterScript("lib/Lua/DMCWO/post/tact_reload.lua", 2, "lib/units/weapons/shotgun/newshotgunbase")

RegisterScript("lib/Lua/DMCWO/post/realnames.lua", 2, "lib/managers/localizationmanager")

RegisterScript("lib/Lua/DMCWO/post/bmarketgui.lua", 2, "lib/managers/menu/blackmarketgui")

RegisterScript("lib/Lua/DMCWO/post/recoil_fix.lua", 2, "lib/units/cameras/fpcameraplayerbase")

RegisterScript("lib/Lua/DMCWO/post/burstfire.lua", 2, "lib/units/beings/player/states/playerstandard")
RegisterScript("lib/Lua/DMCWO/post/burstfire.lua", 2, "lib/units/weapons/newraycastweaponbase")
RegisterScript("lib/Lua/DMCWO/post/burstfire.lua", 2, "lib/units/weapons/akimboweaponbase")
RegisterScript("lib/Lua/DMCWO/post/burstfire.lua", 2, "lib/managers/hudmanagerpd2")
RegisterScript("lib/Lua/DMCWO/post/burstfire.lua", 2, "lib/managers/hud/hudteammate")

RegisterScript("lib/Lua/DMCWO/Extra/useable_drums.lua", 2, "lib/tweak_data/weaponfactorytweakdata")

--[[PERSIST SCRIPTS]]
AddPersistScript("RebalanceGen", "lib/Lua/DMCWO/persist/rebalance_general.lua")
AddPersistScript("RebalanceScript", "lib/Lua/DMCWO/persist/rebalance.lua")
AddPersistScript("RebalanceAtchScript", "lib/Lua/DMCWO/persist/rebalance_attach.lua")
