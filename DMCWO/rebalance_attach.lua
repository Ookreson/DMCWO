--[[
v1.0
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version by:
Checking the UC Thread: http://www.unknowncheats.me/forum/payday-2/118582-dmcs-weapon-overhaul.html

==OR==

Checking the Steam group: http://steamcommunity.com/groups/DMCWpnOverhaul
]]

if not RebalanceAtchScript then 

------------------[[OPTIONAL SHIT YOU CAN TOGGLE]]------------------
--Pick and choose what you want, mostly eveything here is aesthetic. Only a few may change gameplay
--Toggles will ony take effect after you go through a loading screen or reboot the game
--If you want the changes to take effect immediately, comment out "RebalanceAtchScript = true" near the end of this file and make the script load itself again (go through a loading screen, reboot the game), just be sure to uncomment "RebalanceAtchScript = true" when you're done otherwise you might get performance issues since the script will be running the whole time

--If set to true, changes the rear iron sight on the Commando 553/SG552 to be replaced with the Marksman rear pistol sight. 
--Default = false
local sig_rear_iron = false

--If set to true, when low power optics are attached to an AK type weapon, the gun is pulled up closer for optics to be in-line with the other guns. 
--Default = false
--NOTE: Higher powered optics like the Specter, ACOG and Leupold will always be held close to the player camera while ADS, regardless of this being true or false
local ak_optics = false

--If set to true, all occurences of the underfolding stock being default on AK type weapons is changed to the sidefolding stock and the sidefolding stock attachment is changed to the Underfolder. Makes more sense from a stability standpoint too
--Default = false
--NOTE: The AK74, Gold AKM and RPK are excluded from this
local ak_stock_switch = false

--If set to true, changes the upper receiver on the M16 and Para SMG/AR to the A2 upper receiver.
--Default = false
--NOTE: The empty reload for the Para SMG/AR is kinda broken when you use this (charging handle does not move). If I set it to move it looks even worse due to the timing being really off
local a2_upper = false

--Makes it so the front post gas block for the AMCAR/M733, AMR/M16 and Para/Olympic stay even when an optic is attached (with the exception of the Theia/Leupold scope) and IRL, actually be able to function (removing the gas block prevents the bolt from cycling and would pretty much turn the gun into a bolt action rifle). 
--Default = true
local ar_front_post = true

--If set to true, visually breaks the AMCAR upon attaching the Exotique/VLTOR upper reciever, even more so if you dettach it. A bug I'm keeping in as a toggle at the request of friends. If you toggled while it's broken/not broken state, just reattach the Exotique/VLTOR upper. 
--Default = false
local its_fucked = false

--If set to true, sets the Long Barrel for the CAR-4/M4A1 to use the medium barrel (default barrel normally), the default Medium Barrel for the CAR-4/M4A1 to use the Short Barrel model and the Short Barrel for the CAR-4/M4A1 to use the AUG Short Barrel model. 
--Default = false
--NOTE: Slight clipping will occur if you use a suppressor w/ the Short Barrel and Geissele Rail
local m4_barrel = false

--if set to true, sets the default A2 upper on the AMCAR/M733 to the railed upper w/carry handle
--local amcar_upper = WIP, not a priority

--If set to true, sets the M249 short and long barrels to use the G3 barrel models to match the rest of the black barrel. 
--Default = false
local m249_barrel = false

--If set to true, hides the collapsed stock on the SpecOps/MP7 so it looks like you're buying it. 
--Default = false
local mp7_nostock = false

--If set to true, changes the stubby tan VFG on the MP7 to the black VFG. 
--Default = false
--NOTE: I can't do this with the TP9 as the VFG on that is baked to the model
local mp7_vfg = false

--If set to true, hides the folded stock "attachment" so it looks like you're paying for custom work to have it removed. 
--Default = false
local m45_nostock = false

--If set the true, changes the gadget location on the KSG to only ever be on the side of the pump and not in front of your optic if one is attached. 
--Default = true
local ksg_gadget = true

--If set to true, set the pistol grip on the judge to that of the one on the Raging Bull. 
--Default = false
local judge_grip = false

--If set to true, hides the M10's default wire stock. 
--Default = false
local hide_mac_wire = false

--If set to 1, hides the R870 tube cap extension on the R870. 
--If set to 2, sets the R870 tube cap extension to the one used on the Loco. 
--Any other value uses the default R870 tube cap. 
--Default = "0"
local remington_cap = 0

--If set to 1, hides the Loco tube cap extension on the Loco. 
--If set to 2, sets the Loco tube cap extension to the one used on the R870. 
--Any other value uses the default Loco tube cap. 
--Default = "0"
local loco_cap = 0

--If set to true, on the SG552, the respective "Standard" version of a part will have its model swapped with its "Enhanced" counterpart and vice versa. 
--Default is false for all three
--Keep in mind this won't make sense for concealment
local sg552_stock = false
local sg552_handguard = false
local sg552_grip = false

--if set to true, hides the AFG seen on the SCAR. 
--Default = false
local scar_afg_hide = false

--if set to true, hides the M95's bipod. 
--Default = false
local barret_bipod = false

--If set to true, hides rifle muzzle brakes for all guns that can accept them (ARs, LMGs, SMGs). 
--Default = false
local hide_brakes = false

--If set to true, hides shotgun muzzle brakes for all shotguns that can accept them. 
--Default = false
local hide_sg_brakes = false

--If set to true, hides the Flish Hider attachment for all pistols that can accept it. 
--Default = false
local hide_pis_flash = false

--If set to true, enables the ELCAN Specter to use it's BUIS on the top of the optic. 
--Default = false
--NOTE: Enabling this will remove the 45 degree irons if they're attached, disallow it from being attached and will take the place as the first gadget you switch to with the laser/flashlight gadget becoming the second and/or third gadget you switch to
--NOTE 2: You'll also get a floating 45 degree angle gadget in the main menu and mod screen, it's a side effect of having the BUIS actually work
local elcan_buis = false

--if set to true, changes the free 000 Buck to Birdshot. 
--Default = false
--NOTE: This fires 50 rays (30 for the Judge) out at a time, you may get performance issues if you play on a computer worse than my toaster with SquareOne's instant bullet impact fix
--NOTE 2: Cops WILL fly if killed using this
local sho_bird = false

--if set to true, swaps the Magpul BUIS/Flip-up sights with the default ones from the KSG
--NOTE: May be slightly misaligned, not a priority of mine to fix it.
local buis_swap = false

if not tweak_data then return end

--Creating and/or clearing some override tables
tweak_data.weapon.factory.wpn_fps_shot_huntsman.override = {}
tweak_data.weapon.factory.wpn_fps_sho_spas12.override = {}
tweak_data.weapon.factory.wpn_fps_smg_mp7.override = {}
tweak_data.weapon.factory.wpn_fps_shot_r870.override = {}

------------------[[TOGGLEABLE STUFF (Don't touch the stuff below, use the toggles above this line if you want to change things)]]------------------
--Code is also set up to be retroactive and revert itself if you commented out "RebalanceAtchScript = true" near the end of this file
--sig_rear_iron and ak_optics are in [[OPTICS]] section
--{
if hide_pis_flash == true then
	tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
end

if buis_swap == true then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_front.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_front"
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_rear.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_rear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_rear.name_id = "dd_rear"
else
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_front.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_mbus/wpn_fps_upg_o_mbus_front"
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_rear.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_mbus/wpn_fps_upg_o_mbus_rear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_rear.name_id = "bm_wp_upg_o_mbus_rear"
end

if elcan_buis == true then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.adds = { "wpn_fps_extra_zoom" }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight","wpn_fps_upg_o_45iron" }
else
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.adds = { }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
end

if judge_grip == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_g_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_g_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_g_standard"
else 
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_g_standard.unit = "units/pd2_million/weapons/wpn_fps_pis_judge_pts/wpn_fps_pis_judge_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_g_standard.third_unit = "units/pd2_million/weapons/wpn_third_pis_judge_pts/wpn_third_pis_judge_g_standard"
end

if hide_mac_wire == true then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_s_fold"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_s_fold"
end

if barret_bipod == true then
	tweak_data.weapon.factory.parts.wpn_fps_snp_m95_bipod.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_snp_m95_bipod.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_data.weapon.factory.parts.wpn_fps_snp_m95_bipod.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_bipod"
	tweak_data.weapon.factory.parts.wpn_fps_snp_m95_bipod.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_third_snp_m95_bipod"
end

if hide_sg_brakes == true then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_shark/wpn_fps_upg_ns_shot_shark"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_shark/wpn_third_upg_ns_shot_shark"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_shot_ns_king"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_shot_ns_king"
end

if hide_brakes == true then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_tank.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_tank.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_vg38.override = {
			wpn_fps_lmg_mg42_n42 = {
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			},
		wpn_fps_upg_ns_ass_smg_firepig = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			},
		wpn_fps_upg_ns_ass_smg_tank = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			},
		wpn_fps_upg_ns_ass_smg_stubby = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			},
		wpn_fps_upg_ass_ns_jprifles = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			},
		wpn_fps_upg_ass_ns_linear = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			},
		wpn_fps_upg_ass_ns_surefire = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			},
		}	
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg34.override = {
		wpn_fps_lmg_mg42_n42 = {
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			},
		wpn_fps_upg_ns_ass_smg_firepig = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			},
		wpn_fps_upg_ns_ass_smg_tank = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			},
		wpn_fps_upg_ns_ass_smg_stubby = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			},
		wpn_fps_upg_ass_ns_jprifles = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			},
		wpn_fps_upg_ass_ns_linear = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			},
		wpn_fps_upg_ass_ns_surefire = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			},
		}	
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg42.override = {		
		wpn_fps_upg_ns_ass_smg_firepig = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n42",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_42",
			},
		wpn_fps_upg_ns_ass_smg_tank = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n42",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_42",
			},
		wpn_fps_upg_ns_ass_smg_stubby = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n42",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_42",
			},
		wpn_fps_upg_ass_ns_jprifles = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n42",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_42",
			},
		wpn_fps_upg_ass_ns_linear = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n42",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_42",
			},
		wpn_fps_upg_ass_ns_surefire = { 
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n42",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_42",
			},
		}
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel.override = {
			wpn_fps_upg_ns_ass_smg_firepig = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ns_ass_smg_tank = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ns_ass_smg_stubby = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ass_ns_jprifles = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ass_ns_linear = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ass_ns_surefire = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		}	
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_long.override = {
			wpn_fps_upg_ns_ass_smg_firepig = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ns_ass_smg_tank = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ns_ass_smg_stubby = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ass_ns_jprifles = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ass_ns_linear = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		wpn_fps_upg_ass_ns_surefire = { 
			unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard",
			third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard",
			},
		}
	tweak_data.weapon.factory.wpn_fps_ass_scar.override = {
		wpn_fps_upg_m4_g_hgrip_vanilla = { 
			unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard",
			third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard",
			},
		wpn_fps_upg_ns_ass_smg_firepig = { 
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard",
			third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard",
			},
		wpn_fps_upg_ns_ass_smg_tank = { 
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard",
			third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard",
			},
		wpn_fps_upg_ns_ass_smg_stubby = { 
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard",
			third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard",
			},
		wpn_fps_upg_ass_ns_jprifles = { 
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard",
			third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard",
			},
		wpn_fps_upg_ass_ns_linear = { 
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard",
			third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard",
			},
		wpn_fps_upg_ass_ns_surefire = { 
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard",
			third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard",
			},
		}
else
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_tank.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_tank.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg42.override = {}
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_vg38.override = {
			wpn_fps_lmg_mg42_n42 = {
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n38",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_n38"
			}
		}	
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg34.override = {
		wpn_fps_lmg_mg42_n42 = {
			unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n34",
			third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_34"
			}
		}
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel.override = {}
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_long.override = {}
	tweak_data.weapon.factory.wpn_fps_ass_scar.override = {
		wpn_fps_upg_m4_g_hgrip_vanilla = { 
			unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard",
			third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard",
			},
		}
end

if scar_afg_hide == true then
	tweak_data.weapon.factory.wpn_fps_ass_scar.override.wpn_fps_upg_vg_ass_smg_afg = { 
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
		third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
	}
else
	tweak_data.weapon.factory.wpn_fps_ass_scar.override.wpn_fps_upg_vg_ass_smg_afg = {}
end

if mp7_vfg == true then
	tweak_data.weapon.factory.wpn_fps_smg_mp7.override.wpn_fps_upg_vg_ass_smg_stubby = { 
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip",
		third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	}
else
	tweak_data.weapon.factory.wpn_fps_smg_mp7.override.wpn_fps_upg_vg_ass_smg_stubby = {}
end

if sg552_handguard == true then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
else
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard_green"
end

if sg552_stock == true then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard"
else
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard_green"
end

if sg552_grip == true then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard"
else
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard_green"
end

if remington_cap == 1 then
	tweak_data.weapon.factory.wpn_fps_shot_r870.override.wpn_fps_shot_r870_m_extended = {
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy",
		third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy" 
	}
elseif remington_cap == 2 then
	tweak_data.weapon.factory.wpn_fps_shot_r870.override.wpn_fps_shot_r870_m_extended = {
		unit = "units/payday2/weapons/wpn_fps_shot_shorty_pts/wpn_fps_shot_shorty_m_extended_short",
		third_unit = "units/payday2/weapons/wpn_third_shot_shorty_pts/wpn_third_shot_shorty_m_extended_short"
	}
else
	tweak_data.weapon.factory.wpn_fps_shot_r870.override.wpn_fps_shot_r870_m_extended = {}
end

if loco_cap == 1 then
	tweak_data.weapon.factory.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_m_extended = {
		unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy", 
		third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy" 
	}
	
elseif loco_cap == 2 then
	tweak_data.weapon.factory.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_m_extended = {
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_m_extended",
		third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_m_extended" 
	}
else
	tweak_data.weapon.factory.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_m_extended = {}
end

if mp7_nostock == true then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_s_standard.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_s_standard.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_s_standard.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_s_standard.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_s_standard"
end

if m45_nostock == true then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_s_folded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_s_folded"
end

if m4_barrel == true then
	tweak_data.weapon.factory.wpn_fps_ass_m4.override = { 
		wpn_fps_m4_uupg_b_long = {
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium",
		},
		wpn_fps_m4_upper_reciever_round = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round",
		},
		wpn_fps_m4_upper_reciever_round_vanilla = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
		},
		wpn_fps_m4_uupg_draghandle = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
		},
		wpn_fps_m4_uupg_draghandle_vanilla = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
		},
	} 
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_medium_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_medium_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_short.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_long"
else
	tweak_data.weapon.factory.wpn_fps_ass_m4.override = {
		wpn_fps_m4_upper_reciever_round = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round",
		},
		wpn_fps_m4_upper_reciever_round_vanilla = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
		},
		wpn_fps_m4_uupg_draghandle = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
		},
		wpn_fps_m4_uupg_draghandle_vanilla = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
		},
	}
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_medium_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_medium_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_short.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short"
end

--[[ WIP
if amcar_upper == true then
tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_body_upperreciever.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_body_upperreciever.adds = {"wpn_fps_ass_m16_o_handle_sight", "wpn_fps_m4_uupg_draghandle"}
tweak_data.weapon.factory.wpn_fps_ass_amcar.override = {
wpn_fps_m4_uupg_draghandle = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle"},
wpn_fps_m4_upper_reciever_round = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"},
wpn_fps_amcar_uupg_body_upperreciever = { unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
										  adds = {"wpn_fps_ass_m16_o_handle_sight", "wpn_fps_m4_uupg_draghandle"},
										},
}
else
tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_body_upperreciever.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"
tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_body_upperreciever.adds = {}
end
]]

if a2_upper == true then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"	
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_body_upperreciever"	
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_body_upperreciever"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_body_upperreciever"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_draghandle.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_draghandle.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_draghandle_vanilla.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_draghandle_vanilla.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_m16_o_handle_sight.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_m16_o_handle_sight.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
else
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_draghandle.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_draghandle.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_draghandle_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_draghandle_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle"
	tweak_data.weapon.factory.parts.wpn_fps_ass_m16_o_handle_sight.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight"
	tweak_data.weapon.factory.parts.wpn_fps_ass_m16_o_handle_sight.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight"
end

if m249_barrel == true then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_long.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_short.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_short"
else
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_long.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_long.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_short.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_short.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_b_short"
end


if its_fucked == true and ar_front_post == true then
	tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {}
	
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds = { 
		wpn_fps_m4_upper_reciever_edge = {},
		wpn_fps_m4_lower_reciever = {},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
	}
elseif its_fucked == true and ar_front_post == false then	
	tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {}
	
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds = { 
		wpn_fps_m4_upper_reciever_edge = {},
		wpn_fps_m4_lower_reciever = {},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
	}		
elseif its_fucked == false and ar_front_post == true then
	tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {
	"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_upper_reciever_round_vanilla"
	}
	
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds = { 
		wpn_fps_m4_upper_reciever_edge ={"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_m4_lower_reciever ={"wpn_fps_amcar_uupg_body_upperreciever"},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
	}
elseif its_fucked == false and ar_front_post == false then
	tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {
	"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_upper_reciever_round_vanilla"
	}
	
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds = { 
		wpn_fps_m4_upper_reciever_edge ={"wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_o_handle_sight"},
		wpn_fps_m4_lower_reciever ={"wpn_fps_amcar_uupg_body_upperreciever"},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round", "wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext"},
	}
end

if ar_front_post == true then
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds = { 
		wpn_fps_m4_lower_reciever ={"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_o_handle_sight","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_specter = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_docter = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_eotech = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_cmore = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_acog = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_cs = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_reflex = {"wpn_fps_ass_m16_os_frontsight","wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		--wpn_fps_m16_fg_railed = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
		--wpn_fps_m16_fg_standard = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
	}	
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds = { 
		wpn_fps_m4_lower_reciever ={"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle_vanilla"},
		wpn_fps_upg_o_specter = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_docter = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cmore = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_acog = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_cs = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_reflex = {"wpn_fps_ass_m16_os_frontsight"},
		wpn_fps_upg_o_leupold = {"wpn_fps_ass_m16_os_frontsight"},
	}
else
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds = { 
		wpn_fps_m4_lower_reciever ={"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_ass_m16_o_handle_sight","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		wpn_fps_upg_o_leupold = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle"},
		--wpn_fps_m16_fg_railed = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
		--wpn_fps_m16_fg_standard = {"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle","wpn_fps_ass_m16_o_handle_sight"},
	}		
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds = { 
		wpn_fps_m4_lower_reciever ={"wpn_fps_m4_upper_reciever_round","wpn_fps_m4_uupg_draghandle_vanilla"},
		wpn_fps_upg_o_specter = {},
		wpn_fps_upg_o_aimpoint = {},
		wpn_fps_upg_o_aimpoint_2 = {},
		wpn_fps_upg_o_docter = {},
		wpn_fps_upg_o_eotech = {},
		wpn_fps_upg_o_t1micro = {},
		wpn_fps_upg_o_cmore = {},
		wpn_fps_upg_o_acog = {},
		wpn_fps_upg_o_eotech_xps = {},
		wpn_fps_upg_o_rx01 = {},
		wpn_fps_upg_o_rx30 = {},
		wpn_fps_upg_o_cs = {},
		wpn_fps_upg_o_reflex = {},
		wpn_fps_upg_o_leupold = {},
	}	
end

if ksg_gadget == true then
	tweak_data.weapon.factory.wpn_fps_sho_ksg.override = {}
else
	tweak_data.weapon.factory.wpn_fps_sho_ksg.override = {
		wpn_fps_upg_o_specter = { 
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_aimpoint = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_aimpoint_2 = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_docter = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_eotech = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_t1micro = {
			override = {
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"},
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
			
		wpn_fps_upg_o_cmore = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_acog = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_cs = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_eotech_xps = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_reflex = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_rx01 = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_upg_o_rx30 = {
			override = { 
				wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_2"}, 
				wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_2"} 
			},
			forbids = { "wpn_fps_addon_ris" } },
		
		wpn_fps_ak_extra_ris = {a_obj = "a_fl_90"},
		
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			forbids = { "wpn_fps_addon_ris" },
			adds = { "wpn_fps_ak_extra_ris" } 
		}
	}
end

--}


------------------[[DON'T TOUCH THE SHIZZLE BELOW, DAWG]]------------------

------------------[[MUZZLE BRAKES]]------------------{
--Fire Breather
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.stats = { value = 5, suppression = -5, recoil = 1, concealment = -2 } 
--Tank Compensator
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_tank.stats = { value = 4, suppression = -2, recoil = 3, concealment = -1 } 
--Stubby
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.stats = { value = 3, suppression = 2, recoil = 4 }
--Competitor's Compensator
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.stats = { suppression = 0, concealment = -2, spread = 2, recoil = -2}
--Funnel of Fun
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.stats = { suppression = -3, spread = -1, concealment = -2, recoil = 6 }
--TACTICOOL
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.stats = { spread = 1, recoil = 0, concealment = -2 }

--Shark Teeth (Shotguns)
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.stats = { value = 5, suppression = -4, recoil = 4, concealment = -2 }
--King's Crown (Shotguns)
tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.stats = { suppression = -1, spread = 1, concealment = -2 }

--La Femme Compensator (Deagle)
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_co_short.stats = { value = 6, recoil = 2, spread_moving = -1, concealment = -1, suppression = -5 }
--OGREKILL Compensator (Deagle)
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_co_long.stats = { value = 8, recoil = 4, spread_moving = -2, concealment = -2, spread = 0, suppression = -1 }

--Ventilated Compensator (Glocks)
tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
--Velocity Compensator (Glocks)
tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 1 }

--Ventilated Compensator (P226)
tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
--Velocity Compensator (P226)
tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 1 }

--Ventilated Compensator (USP)
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_1.stats = { value = 4, suppression = -2, recoil = 2, concealment = -1 }
--Velocity Compensator (USP)
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_2.stats = { value = 5, suppression = -1, concealment = -1, spread = 1 }

--Professional Compensator (92FS)
tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.stats = { value = 3, suppression = -5, spread_moving = 2, concealment = -2, recoil = 2 }
--Competitor Compensator (92FS)
tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.stats = { value = 4, spread = 1, spread_moving = 1, concealment = -2 }

--Flash Hider (Pistols)
tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.stats = { value = 5, suppression = 2,  recoil = 1}

--Punisher Compensator (1911)
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_1.stats = { value = 5, suppression = -2, recoil = 2, concealment = -1}
--Aggressor Compensator (1911)
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.stats = {value = 2, suppression = -1, concealment = -1, spread = 1 }

--Tenderizer
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_meatgrinder.stats = {value = 7, recoil = 4, spread = -1, concealment = -1, suppression = -4}
--IPSC Compensator
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.stats = {value = 4, recoil = -2, spread = 2, concealment = -1}

------------------[[SUPPRESSORS]]------------------
--Low Profile
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.stats = { value = 3, suppression = 100, alert_size = 12, damage = -1, recoil = 0, spread_moving = -1, concealment = 0 }
--Medium
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.stats = { value = 2, suppression = 100, alert_size = 12, damage = -1, recoil = 2, spread_moving = -2, concealment = -2, spread = 0}
--The Bigger the Better
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.stats = { value = 5, suppression = 100, alert_size = 12, damage = -1, recoil = 4, spread_moving = -3, concealment = -3, spread = 1}

--Size Doesn't Matter
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.stats = { value = 3, suppression = 100, alert_size = 12, damage = -1, recoil = 0, spread_moving = -1, concealment = 0 }
--Standard Issue
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium.stats = { value = 1, suppression = 100, alert_size = 12, damage = -1, recoil = 2, spread_moving = -2, concealment = -2, spread = 0  }
--Monolith
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large.stats = { value = 5, suppression = 100, alert_size = 12, damage = -1, recoil = 3, spread_moving = -2, concealment = -3, spread = 1 }
--Asepsis
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = 0, spread_moving = -2, concealment = -2 }

tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = 1, spread_moving = -2, concealment = -1, damage = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.perks = { "silencer" }

tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.stats = { value = 1, suppression = 100, alert_size = 12, spread = 1, recoil = 0, spread_moving = -2, concealment = -2, damage = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.perks = { "silencer" }

--Shotgun Suppressor
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_thick.stats = { value = 7, suppression = 100, alert_size = 12, damage = -2, recoil = 1, spread_moving = -2, concealment = -2 }


--MSR Suppressor (TITAN QD)
tweak_data.weapon.factory.parts.wpn_fps_snp_msr_ns_suppressor.stats = { value = 5, suppression = 100, alert_size = 12, spread = 1, recoil = 1, spread_moving = -2, concealment = -2, damage = -1}

--MP7 Suppressor
tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_b_suppressed.stats = { value = 4, spread = 2, suppression = 100, alert_size = 12, damage = -1, recoil = -1, spread_moving = -2, concealment = -2 }

--Skorpion Suppressor
tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_b_suppressed.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = 0, spread_moving = -2, concealment = -2 }

--Uzi Suppressor
tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_b_suppressed.stats = { value = 1, suppression = 100, alert_size = 12, spread = 0, recoil = 0, spread_moving = -2, concealment = -2 }

--C96 DL-44 Muzzle
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_nozzle.stats = {
			value = 1,
			recoil = 3,
			spread = -1,
			concealment = -1
		}
--}


------------------[[BARRELS]]------------------{
--AK Slavic Dragon (AK74, AKM)
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_b_draco.stats = { recoil = 0, damage = -1, concealment = 1, spread = -1, suppression = -2}

--AR Medium Barrel (Para SMG)
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_medium.stats = { value = 1, damage = 2, spread = 1, concealment = -1 }

--AR Short Barrel (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_short.stats = { value = 5, damage = -1, spread = -1, recoil = 0, spread_moving = -2, concealment = 2, suppression = -2 }
--AR Long Barrel (CAR-4, AMR-16)
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_long.stats = { value = 4, damage = 2, spread = 1, recoil = 0, concealment = -2, suppression = 0 }

--Intergrated Suppressor (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_sd.stats = { value = 6, suppression = 100, alert_size = 12, spread = 0, damage = -1, recoil = 6, spread_moving = 1, concealment = 1 }

--SG552 Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_ass_s552_b_long.stats = { value = 6, spread = 1, damage = 2, spread_moving = -4, concealment = -4, recoil = 0 }

--Road Warrior/Sawn-off (Mosconi)
tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_b_short.stats = { value = 10, recoil = 0, spread = -6, spread_moving = 3, concealment = 10, suppression = -1 }
tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_b_short.stance_mod = { wpn_fps_shot_huntsman = {rotation = Rotation(0,0.5,0) } }

--SCAR Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_ass_scar_b_long.stats = { value = 4, spread = 1, spread_moving = -3, concealment = -3, damage = 2, recoil = 0, suppression = 0}
--SCAR Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_ass_scar_b_short.stats = { value = 3, damage = -1, suppression = -3, spread = -1, spread_moving = 3, concealment = 3 , recoil = 0}

--HK21 Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_b_long.stats = { value = 4, spread = 1, recoil = 0, damage = 2, spread_moving = -2, concealment = -2, suppression = 0 }

--M249 Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_long.stats = { value = 4, damage = 2, spread = 1, recoil = 0, concealment = -2, suppression = 0 }

--Deagle Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_long.stats = { value = 7, spread_moving = -3, spread = 2, damage = 0, concealment = -3, recoil = 0, suppression = -0  }

--Raging Bull Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.stats = { value = 5, recoil = 0, spread = 3, spread_moving = -3, concealment = -3, damage = 0, suppression = -1 }
--Raging Bull Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.stats = { value = 3, recoil = -1, spread_moving = 3, spread = -3, concealment = 3, damage = -0, suppression = -5 }
--Raging Bull Aggressor
tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.stats = { value = 3, recoil = 1, damage = 0, spread = 1, spread_moving = -3, concealment = -3, suppression = -2 }
--Raging Bull Vented
tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.stats = { value = 4, recoil = 3, damage = 0, spread = 0, spread_moving = 1, suppression = -3, concealment = -3 }

--P90 Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_long.stats = { value = 8, spread = 1, spread_moving = -3, damage = 2, recoil = 0, concealment = -2 }

--AUG Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_aug_b_long.stats = { value = 7, spread_moving = -2, spread = 1, recoil = 0, concealment = -3, damage = 2 }
--AUG Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_aug_b_short.stats = { value = 5, spread_moving = 3, spread = -1, recoil = 0, concealment = 2, damage = -1, suppression = -2 }

--M45 Short barrel 
tweak_data.weapon.factory.parts.wpn_fps_smg_m45_b_small.stats = { value = 2, spread = -1, concealment = 3, damage = -1, suppression = -1 }

--MSR Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_snp_msr_b_long.stats = { value = 10, spread = 1, concealment = -3, damage = 2}

--R93 Short Barrel 
tweak_data.weapon.factory.parts.wpn_fps_snp_r93_b_short.stats = { value = 1, spread = -1, recoil = 0, spread_moving = 3, concealment = 3, damage = -4, suppression = -2 }
--R93 Suppressed Barrel
tweak_data.weapon.factory.parts.wpn_fps_snp_r93_b_suppressed.stats = { value = 4, suppression = 100, alert_size = 12, spread = 0, damage = -10, recoil = 1, spread_moving = 1, concealment = -1 }
		
--M95 Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_snp_m95_barrel_long.stats = { value = 2, spread = 0, concealment = -1, suppression = 0, recoil = 1, damage = 40, spread_moving = -2, total_ammo_mod = -31}
--M95 Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_snp_m95_barrel_short.stats = { value = 2, spread = -2, concealment = 8, damage = 0, suppression = -5 }
--M95 Suppressed Barrel
tweak_data.weapon.factory.parts.wpn_fps_snp_m95_barrel_suppressed.stats = { value = 2, recoil = 3, concealment = 2, damage = -10, suppression = 100 }

--M1014 Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_long.stats = { value = 8, recoil = 0, spread = 1, concealment = -2, extra_ammo = 2 }
--M1014 Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_short.stats = { value = 5, recoil = 0, spread = -2, concealment = 6, extra_ammo = -1 }

--KSG Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_long.stats = { value = 7, recoil = 0, spread = 1, concealment = -2, extra_ammo = 2 }
tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_long.override = {
			wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"},
			wpn_fps_upg_o_mbus_front = {a_obj = "a_o_f_2"}
		}
--KSG Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.stats = { value = 5, recoil = 0, spread = -2, concealment = 4, damage = 0, extra_ammo = -2 }

--Striker Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_sho_striker_b_long.stats = { value = 3, recoil = 0, spread = 1, concealment = -2 }
--Striker Suppressed Barrel
tweak_data.weapon.factory.parts.wpn_fps_sho_striker_b_suppressed.stats = { value = 5, suppression = 100, alert_size = 12, damage = -2, recoil = 1, spread_moving = 1, concealment = -2 }

--G3 Assault Barrel
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_short.stats = {value = 2,recoil = -0,spread = -1,concealment = 4,damage = -1}

--G3 PSG-1 Barrel
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.override = {}
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.adds = {}
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.forbids = {"wpn_fps_ammo_type"}
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.stats = {value = 2,recoil = -3,spread = 1,concealment = -2,damage = 10,total_ammo_mod = -25}

--FAMAS Long
tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_long.stats = {value = 2,recoil = 2,spread = 0,concealment = -1,damage = 2}
--FAMAS Short	
tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.stats = {value = 2,recoil = -0,spread = -1,concealment = 2,damage = -1}
--FAMAS Sniper	
tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_sniper.stats = {value = 2,recoil = -2,spread = 1,concealment = -2,damage = 2}
	--FAMAS Supp.	
tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_suppressed.stats = {value = 2,recoil = 0,spread = 1,concealment = -1,damage = -1}
	
--TEC-9 Barrel Extension
tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_ns_ext.forbids = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	}
tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_ns_ext.stats = {value = 5,spread = 1,recoil = 1,concealment = -3,damage = 0}
	
--TEC-9 AB-10 Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_b_standard.stats = {value = 3,recoil = -1,concealment = 1}

--MG42 MG34 Barrel
tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg34.stats = {value = 1,	recoil = -2,spread = 2}
--MG42 DLT-19 Barrel
tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_vg38.stats = {
	value = 4,
	suppression = 100,
	alert_size = 12,
	recoil = 4,
}

--C96 Carbine Barrel
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_b_long.stats = {value = 1,damage = 2,recoil = -2,spread = 2,concealment = -3,total_ammo_mod = -12}
		
--Mosin Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_standard.stats = {value = 1,spread = 1,recoil = 1,concealment = -2}		
--Mosin Supp. Barrel
tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_sniper.stats = {value = 6,suppression = 100,alert_size = 12,damage = -4,recoil = 2,spread = 0,spread_moving = -1,concealment = -2}

--Sterling Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_long.stats = {
	value = 1,
	recoil = 0,
	spread = 1,
	damage = 2,
	concealment = -2
}
--Sterling Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_short.stats = {
	value = 1,
	spread = -1,
	damage = -1,
	concealment = 1
}
--Sterling Suppressed Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_suppressed.stats = {
	value = 4,
	suppression = 100,
	alert_size = 12,
	damage = 0,
	recoil = 2,
	spread_moving = 0,
	concealment = -2
}
--Sterling E11 Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_e11.stats = {
	value = 4,
	spread = -1,
	suppression = 100,
	alert_size = 12,
	damage = 0,
	recoil = 4,
	spread_moving = 0,
	concealment = -1
}

--Thompson Long
tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_long.stats = {
	value = 4,
	spread = 1,
	concealment = -3
}
--Thompson Short
tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_short.stats = {
	value = 2,
	spread = -1,
	concealment = 3
}
		
--}
	

------------------[[Slides]]------------------{
--1911 Longslide
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.stats = { value = 2, damage = 0, spread_moving = -2, spread = 2, recoil = 0, concealment = -2, suppression = -0 }
--1911 Vented
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_vented.stats = { value = 1, recoil = 3, spread_moving = 2, suppression = -2}

--P226 Two Tone
tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.stats = { value = 4, suppression = -0, recoil = 2, spread_moving = 1 }
--P226 Long Slide
tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.stats = { value = 6, damage = 0, spread = 1, concealment = -3, spread_moving = -3 }

--92FS Brigadier Slide
tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_sl_brigadier.stats = { value = 1, spread = 0, recoil = 1, spread_moving = -2 }

--USP Expert
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_expert.stats = { value = 2, concealment = -1, recoil = 2 }
--USP Match
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_match.stats = { value = 2, spread = 1, concealment = -1, damage = 0 }

--G22 Long Slide
tweak_data.weapon.factory.parts.wpn_fps_pis_g22c_b_long.stats = { value = 6, damage = 0, spread = 1, recoil = 1, suppression = 0, spread_moving = -3 }

--PPKS Slide
tweak_data.weapon.factory.parts.wpn_fps_pis_ppk_b_long.stats = { value = 3, damage = 0, spread = 1, spread_moving = -2, concealment = -2 }

tweak_data.weapon.factory.parts.wpn_fps_pis_g26_b_custom.stats = { value = 4, recoil = 0, spread = 1, concealment = -1, damage = 0 }
--}


------------------[[Custom]]------------------{
--Single
tweak_data.weapon.factory.parts.wpn_fps_upg_i_singlefire.stats = { value = 5, spread = 2, recoil = -4 }
--Full-Auto
tweak_data.weapon.factory.parts.wpn_fps_upg_i_autofire.stats = { value = 8, spread = -1, recoil = 4 }

--Bayonet
tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_ns_bayonet.stats = {
			value = 1,
			spread = -1,
			suppression = -2,
			concealment = -2,
			min_damage = 10,
			max_damage = 10,
			min_damage_effect = 1.75,
			max_damage_effect = 1.75,
			range = 100,
		}
--}




------------------[[Handguards]]------------------{
--Aftermarket (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.stats = { value = 5, concealment = 1, recoil = 2 }
--Competition (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.stats = { spread = 1, recoil = -1, concealment = 2 }
--Gazelle (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.stats = { spread = -1, recoil = 5, concealment = -2 }

--AK Wood Rail
tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.stats = { value = 3, spread_moving = -1, spread = 0, recoil = 2 }
--AK Rail
tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.stats = { value = 5, spread_moving = -2, recoil = 0, spread = 1, concealment = -1 }
--AK War Proven
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_tapco.stats = { value = 5, concealment = 3}
--AK Light Weight
tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.stats = { value = 5, concealment = -2, recoil = -2, spread = 2 }

--G36c Handguard and Barrel
tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.stats = { value = 4, spread_moving = 2, spread = -1, damage = -1, concealment = 2 }
tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.forbids = { "wpn_fps_addon_ris", "wpn_fps_ass_g36_b_long" } 
--G36k Railed Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.stats = { value = 5, spread_moving = -2, recoil = 2, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.forbids = { "wpn_fps_addon_ris" }

--Karbin Ceres (AK5)
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_ak5c.stats = { value = 7, recoil = 3, spread = 0, spread_moving = -2, concealment = -2 }
--Belgian Heat (AK5)
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_fnc.stats = { value = 10, spread = 1, recoil = -1, concealment = 1}

--MP5k
tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.stats = { value = 4, spread_moving = 3, recoil = -2, concealment = 3, damage = -1, spread = -1 , suppression = -5}
--MP5 Railed
tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.stats = { value =  5,  spread_moving = -2, recoil = 3, concealment = -3 }
--MP5SD
tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5sd.stats = { value = 10, spread_moving = 1, suppression = 12, alert_size = 12, damage = -1, recoil = 3, concealment = 1 }
tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5sd.sound_switch = { suppressed = "suppressed_b" }

--HK21 Short Handguard
tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_fg_short.stats = { value = 6, spread = -1, damage = -1, spread_moving = 2, concealment = 3, recoil = 0, suppression = -1 }

--M249 MK.46 Rail
tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_mk46.stats = { value = 6, recoil = 2, spread_moving = 2, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_mk46.forbids = { "wpn_fps_addon_ris" }

--RPK Black Handguard
tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_fg_standard.stats = { value = 5, spread = 0, recoil = 1, spread_moving = 2, concealment = 1 }
tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_fg_standard.adds = {}
tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_fg_standard.forbids = {}

--AUG A3 Handguard
tweak_data.weapon.factory.parts.wpn_fps_aug_fg_a3.stats = { value = 7, recoil = 1, spread_moving = -2, concealment = -2, spread = -0 }

--SG552 Green Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.stats = { value = 1, spread = 1, concealment = -4 }
--SG552 Railed Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_railed.stats = { value = 7, spread_moving = -2, recoil = 2, concealment = -2 }

--M16 Railed Handguard
tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.stats = { value = 7, spread_moving = -2, recoil = 2, concealment = -2, spread = -1 }
--M16A2 Handguard
tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.stats = { value = 10, spread_moving = 1, spread = 1, concealment = 2, recoil = -1 }

--Saiga Railed Handguard
tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_lowerrail.stats = { value = 5, recoil = 2, spread_moving = -2, concealment = -2 }

--FAL Wooden Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.stats = { value = 3, spread = 0, recoil = 4, concealment = -2 }
--FAL DSA SA58 Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.stats = { value = 3, damage = -10, spread = -1, recoil = 0, concealment = 6, suppression = -2, total_ammo_mod = 34 }
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.forbids = { "wpn_fps_addon_ris" }
--FAL Romat Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_03.stats = { value = 3, damage = 0, spread = 1, recoil = -0, concealment = -1 }
--FAL DSA Freefloat Barrel Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.stats = { value = 3, damage = 0, spread = 2, recoil = -2, concealment = -2 }

--R870 Wood Pump (VANITY)
tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_wood.stats = { value = 2}

--AKMSU Railed Handguard
tweak_data.weapon.factory.parts.wpn_fps_smg_akmsu_fg_rail.stats = { value = 5, spread_moving = -2, recoil = 1, concealment = -2 }

--G3 PSG-1 Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.stats = { value = 2, recoil = 2, spread = 0, concealment = -1 }
--G3 Railed Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.stats = { value = 2, recoil = 3, spread = 0, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.forbids = { "wpn_fps_addon_ris" } 
--G3 Wood Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.stats = { value = 2, recoil = 4, spread = -1, concealment = 2 }
--G3 Plastic Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.stats = { value = 2, recoil = -2, spread = 0, concealment = 4 }

--Galil FAB Defence Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.stats = { value = 2, recoil = 3, spread = 0, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.stance_mod = {}
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.override = {}
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.forbids = {}

--Galil MAR Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.stats = { value = 2, recoil = -1, spread = -1, concealment = 4, damage = -14, suppression = -3, total_ammo_mod = 33}
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.override = {}
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.forbids = {}
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.stance_mod = {}
--Galil SAR Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.stats = { value = 2, recoil = 1, spread = 0, concealment = 1, damage = -0, suppression = -1 }
--Galil Galatz Handguard
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.stats = { value = 2, recoil = -0, spread = 1, concealment = -2, damage = 0}

--FAB Defence UZI Tri-rail
tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_fg_rail.stats = { value = 2, recoil = 2, spread = 0, concealment = -2}
tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_fg_rail.forbids = { "wpn_fps_addon_ris", "wpn_fps_shot_r870_gadget_rail" }
--}

	
------------------[[RECIEVERS]]------------------{
--AR VLTOR Upper (VANITY)
tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.stats = { value = 3, recoil = 0 }
--SG552 Black Reciever
tweak_data.weapon.factory.parts.wpn_fps_ass_s552_body_standard_black.stats = { value = 7, recoil = 0, concealment = 4 }

--Shell Rack (Loco, 870)
tweak_data.weapon.factory.parts.wpn_fps_shot_r870_body_rack.stats ={ value = 3, spread_moving = -1, concealment = -2, suppression = -0, recoil = 0, total_ammo_mod = 10 }
--}


------------------[[BODIES & EXTRA SHIT]]------------------{
--Mk.14 (M308)
tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_ebr.stats = { value = 6, spread_moving = 3, recoil = -2, concealment = 2,	spread = 2 }
--JAE-100 (M308)
tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_jae.stats = { value = 10, spread_moving = -2, recoil = 4, concealment = -2, spread = -1 }

--Raging Bull Smooth Cylinder
tweak_data.weapon.factory.parts.wpn_fps_pis_rage_body_smooth.stats = { value = 6, recoil = 1, concealment = 1 }

--SCAR Rail Extension
tweak_data.weapon.factory.parts.wpn_fps_ass_scar_fg_railext.stats = { value = 4, recoil = 1, spread_moving = -1, concealment = -1, spread = -0}

--MSR Aluminium Body
tweak_data.weapon.factory.parts.wpn_fps_snp_msr_body_msr.stats = { value = 10, spread_moving = -2, recoil = -2, concealment = 5}

tweak_data.weapon.factory.parts.wpn_fps_snp_r93_body_wood.stats = { value = 7, concealment = -3, recoil = 5}

tweak_data.weapon.factory.parts.wpn_fps_pis_g26_body_custom.stats = {
	value = 7,
	recoil = 2,
	concealment = -1
}
		
tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_body_ris.stats = {
	value = 5,
	recoil = 1,
	spread_moving = -2,
	concealment = -2
}
--}
		
		
------------------[[PISTOL GRIPS]]------------------{
--Ergo Grip (Non-AK Rifles)
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_ergo.stats = { value = 2, spread_moving = 2, spread = 2, recoil = -2}
--Pro Grip (Non-AK Rifles)
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.stats = { value = 6, spread = 1, recoil = 2, spread_moving = -2, concealment = -1 }
--Rubber Grip (Non-AK Rifles)
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.stats = { value = 2, spread_moving = 2, recoil = 4, spread = 0 }
--Straight Grip
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.stats = { value = 2, spread_moving = 2, concealment = 2, spread = 1 }


--AK Rubber Grip
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.stats = { value = 2, spread_moving = -2, recoil = 1, concealment = 2 }
--AK Plastic Grip
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.stats = { value = 2, spread_moving = 2, spread = 1,  recoil = -1}
--AK Wood Grip
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.stats = { value = 2, spread_moving = 1, recoil = 2, concealment = -1 }

--SG552 Green Grip
tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard_green.stats = { value = 4, recoil = 1, concealment = -2 }

--Ergo Grip (HK21)
tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_g_ergo.stats = { value = 3, recoil = 2, spread_moving = 2, concealment = -1 }

--Ergo Grip (Deagle)
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_ergo.stats = { value = 6, spread_moving = 2, recoil = 2, concealment = -1 }
--Bling Grip (Deagle)
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_bling.stats = { value = 10, spread_moving = -2, spread = 1, concealment = 1, recoil = -2 }

--Bling Grip (1911)
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_ergo.stats = { value = 10, spread = 0, recoil = 2 }
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_bling.stats = { value = 10, spread = 1, recoil = -1 }

--PPK Grip
tweak_data.weapon.factory.parts.wpn_fps_pis_ppk_g_laser.stats = { value = 1, spread = 1 }

tweak_data.weapon.factory.parts.wpn_fps_ass_fal_g_01.stats = { value = 2, recoil = 2, spread_moving = 1, concealment = 2 }

--G3 Retro Grip
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_retro.stats = { 
	value = 2,
	recoil = 2,
	spread = 0,
	concealment = 0
}
--G3 PSG-1 Grip
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_sniper.stats = { 
	value = 2,
	recoil = 1,
	spread = 1,
	concealment = -1
}
	
--Famas G2 Grip
tweak_data.weapon.factory.parts.wpn_fps_ass_famas_g_retro.stats = { 
	value = 2,
	recoil = 1,
	spread = 0,
	concealment = -1
}
	
--Galil Galatz Grip
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_g_sniper.stats = { 
	value = 2,
	recoil = 2,
	spread = 1,
	concealment = -1
}
	
--Skorpion Wood Grip	
tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_wood.stats = {
	value = 1,
	recoil = 1,
	spread = 1,
	recoil = 1,
	concealment = -1
}
--Skorpion Ergo Grip	
tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_ergo.stats = {
	value = 1,
	spread = 1,
	spread = 0,
	recoil = 3,
	concealment = 1
}

tweak_data.weapon.factory.parts.wpn_fps_pis_g26_g_gripforce.stats = {
	value = 7,
	recoil = 3,
	spread = 0,
	concealment = -1
}

--}


------------------[[STOCKS]]------------------{
--Caesar (AK5)
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5c.stats = { value = 7, recoil = 2, concealment = 2}
--Bertil (AK5)
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.stats = { value = 5, recoil = 0, spread = 1, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.stance_mod = {}

--Standard
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_standard.stats = { value = 1, spread_moving = -1, concealment = -1, recoil = 1 }

--870 No Stock
tweak_data.weapon.factory.parts.wpn_fps_shot_r870_s_nostock_big.stats = { value = 4, spread_moving = 1, recoil = -1, concealment = 1 }

--Tactical Stock
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_pts.stats = { value = 3, spread = 0, spread_moving = 1, recoil = 1, concealment = -1 }

--Wide (AMCAR, CAR-4, AMR-16, Para SMG, M249,Pump Shotguns, AKs)
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.stats = { value = 5, recoil = 0, concealment = 1, spread_moving = 2, spread = 0}
--War-Torn (AMCAR, CAR-4, AMR-16, Para SMG, M249,Pump Shotguns, AKs)
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.stats = { value = 5, spread = 1, recoil = -2, concealment = -3}
--M4 Folding
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_s_fold.stats = { value = 5, recoil = -3, concealment = 3}

--AK PSL stock
tweak_data.weapon.factory.parts.wpn_upg_ak_s_psl.stats = { value = 6, spread = 1, spread_moving = -3, recoil = 2, concealment = -3 }

--M249 Solid Stock
tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_s_solid.stats = { value = 3, recoil = 2, spread_moving = -2, concealment = -2 }

--RPK Synthetic Stock
tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_s_standard.stats = { value = 3, recoil = 1, concealment = 1 }

--Gangster Special (Mosconi)
tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_s_short.stats = { value = 10, recoil = -8, spread = 0, spread_moving = 3, concealment = 10 }

--Tactical Shorty (Loco)
tweak_data.weapon.factory.parts.wpn_fps_shot_shorty_s_nostock_short.stats = { value = 4, spread_moving = 2, recoil = -3, concealment = 3 }
--Standard (Loco)
tweak_data.weapon.factory.parts.wpn_fps_shot_r870_s_solid.stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -1 }

--MP9 Stock
tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_skel.stats = { value = 5, recoil = 3, spread_moving = -3, concealment = -3, spread = 1 }

--MP5 Retractable Stock
tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_adjust.stats = { value = 3, spread_moving = 1, concealment = 3, recoil = -1 }
--MP5 No Stock
tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring.stats = { value = 3, spread_moving = 4, recoil = -5, concealment = 4 }

--R870 Top Folding Stock
tweak_data.weapon.factory.parts.wpn_fps_shot_r870_s_folding.stats = { value = 9, spread_moving = 1, recoil = -1, concealment = 1 }

--SG552 Green Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_s552_s_standard_green.stats = { value = 4, recoil = 2, concealment = -2, spread = 0 }

--SCAR Sniper Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.stats = { value = 4, recoil = 3, spread_moving = -3, concealment = -3 }

--G36 Solid Stock 
tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.stats = { value = 4, spread_moving = 2, concealment = 2, recoil = 2 }
--G36 SL8 Stock 
tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.stats = { value = 9, recoil = 1, spread_moving = -3, concealment = -3, spread = 1 }

--MP7 Extended stock
tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_s_long.stats = { value = 1, recoil = 2, spread_moving = -1, concealment = -2, spread = 1 }

--FAL Folding Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.stats = { value = 3, spread = 0, recoil = -1, concealment = 5 }
--FAL Magpul Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.stats = { value = 3, spread = 1, recoil = 1, concealment = -2 }
--FAL Wooden Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.stats = { value = 3, spread = 0, recoil = 3, concealment = 0 }

--M1014 Solid Stock
tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_solid.stats = { value = 5, recoil = 2, concealment = -2 }

--G3 PSG-1 Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_sniper.stats = {value = 2,recoil = 0,spread = 1,concealment = -1}
--G3 Wood Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_wood.stats = {value = 2,recoil = 2,spread = -0,concealment = -1}
	
--Galil FAB Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.stats = {value = 2,recoil = -3,spread = -0,concealment = 3}
--Galil Light Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_light.stats = {value = 2,recoil = -2,spread = -0,concealment = 2}
--Galil Plastic Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.stats = {value = 2,recoil = 1,spread = 0,concealment = 1}
--Galil Skeletal Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_skeletal.stats = {value = 2,recoil = -0,spread = 1,concealment = 1}
--Galil Sniper Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.stats = {value = 2,recoil = 1,spread = 2,concealment = -2}
--Galil Wood Stock
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.stats = {value = 2,recoil = 2,spread = 0,concealment = -2}
	
--Uzi Synthetic Stock 
tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.stats = {value = 1,spread = 1,recoil = 2,concealment = -2}		
--Uzi Wood Stock 
tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.stats = {value = 1,spread = 0,recoil = 4,concealment = -2}

--Skorpion No Stock
tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_s_unfolded.stats = {value = 3,recoil = 3,spread = 1,concealment = -2}

--C96 Stock
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_s_solid.stats = {value = 1,recoil = 2,concealment = -3}

--Mosin Black Stock
tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_body_black.stats = {value = 1,recoil = 0,concealment = 3}

--Sterling Solid Stock
tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_solid.stats = {value = 1,spread = 0,recoil = 2,concealment = -2}



--}
	
	
------------------[[GADGETS]]------------------{
--TLR1
tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_tlr1.stats = { value = 2, recoil = 1, concealment = -1 }
--Pistol Laser
tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_laser.stats = { value = 5, recoil = 1, concealment = -1 }
--X400V
tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_x400v.stats = { value = 5, recoil = 2, spread = 0, concealment = -2 }


--PEQ-5
tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.stats = { value = 5, recoil = 1, concealment = -1 }
--Surefire
tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.stats = { value = 3, recoil = 1, concealment = -1 }
--PEQ-15
tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_peq15.stats = { value = 5, recoil = 2, concealment = -2 }
--}


------------------[[OPTICS]]------------------{

tweak_data.weapon.factory.parts.wpn_fps_ass_s552_o_flipup.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_o_flipup"
	
local pivot_shoulder_translation = Vector3(10.6642, 22.0789, -3.95194)
local pivot_shoulder_rotation = Rotation(0.106285, 0.18453, 0.630167)
local pivot_head_translation = Vector3(0, 19, 0)
local pivot_head_rotation = Rotation(0, 0, 0)
tweak_data.player.stances.s552.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
tweak_data.player.stances.s552.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

--ELCAN BUIS
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod = {} 
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,2.75,-0.45 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-2.6,-0.1 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-2.5,-0.05 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-2.5,-0.01 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,1,-3 ) + Vector3( 0,-10,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-5,-3.3 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-4.5,-3.3 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,7.25,-3.0 ) + Vector3( 0,-10,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,2,-3.45 ),rotation = Rotation( 0,-0.2,0) }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-2.5,-2.7 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-0.5,-3 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-9.75,-2.97 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-17,-3.8 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-4,-3.4 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-2,-2.8 ),rotation = Rotation( 0,-0.35,0) }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-19.25,-3 ) + Vector3( 0,0,-3.15) }
			
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-10.25,-2.4 ),rotation = Rotation( 0,0.5,0)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-12.5,-4 ) + Vector3( 0,0,-3.15)  }
		
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-3.75,-2.77 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-1,-0.25 ) + Vector3( 0,0,-3.15)  }
			
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-10,-3.25 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,2.25,-3.55 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,2,-3.1 ) + Vector3( -0.06,-10,-3.15)  }
	
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-20,-4.6 ) + Vector3( 0,0,-3.15)  }
	
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }

tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -13.5, -3.55) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -9.5, -3.8) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -2, -3.8) + Vector3( 0,0,-3.15)  }
	
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,4.5,-3.5 ) + Vector3( 0,0,-3.15)  }

tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -2.55, -3.2) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -6.75, -2.7) + Vector3( 0,0,-3.15)  }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -3.5, -1.3) + Vector3( 0,0,-3.15)  }

tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-20,-5.3 ) + Vector3( 0,0,-3.15)  }

tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-7,-6.25 ) + Vector3( 0,0,-3.15) }
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-9.3,-3.28 ) + Vector3( 0,0,-3.15) }	
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-9.6,-3.2 ) + Vector3( 0,0,-3.15) }			



--EOTech (Base)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-28,-4.6 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 ),rotation = Rotation( 0,-0.2,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 )}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-6,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-6,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-6,-3 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ),rotation = Rotation( 0,0.5,0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-0.25,-3.0 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 ),rotation = Rotation( 0,-0.35,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 )}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 ) }
			
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 ) }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -17.8, -3.55) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -14.2, -3.8) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -7, -3.8) }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-3,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -7.1, -1.3) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 )}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-14,-3.48 )}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 )}	

	
--Aimpoint PRO (+2)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-26,-4.6 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 ) + Vector3(0, 2, 0),rotation = Rotation( 0,-0.2,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 ) + Vector3(0, 2, 0)}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-6,-3 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-6,-3 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-6,-3 ) + Vector3(0, 2, 0) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.	wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ) + Vector3(0, 2, 0),rotation = Rotation( 0,0.5,0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-0.25,-3.0 ) + Vector3(0, 2, 0) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 ) + Vector3(0, 2, 0),rotation = Rotation( 0,-0.35,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 ) + Vector3(0, 2, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 ) + Vector3(0, 2, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 ) + Vector3(0, 2, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 ) + Vector3(0, 2, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 ) + Vector3(0, 2, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 ) + Vector3(0, 2, 0)}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 ) + Vector3(0, 2, 0) }
			
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 ) + Vector3(0, 2, 0) }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -17.8, -3.55) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2) + Vector3(0, 2, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -14.2, -3.8) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -7, -3.8) + Vector3(0, 2, 0) }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-3,-3 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7) + Vector3(0, 2, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -7.1, -1.3) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9) + Vector3(0, 2, 0) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 ) + Vector3(0, 2, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 ) + Vector3(0, 2, 0)}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-14,-3.48 ) + Vector3(0, 2, 0)}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 ) + Vector3(0, 2, 0)}	


--Specter Sight (+4)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-26,-4.6 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 ) + Vector3(0, 4, 0) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 ) + Vector3(0, 4, 0),rotation = Rotation( 0,-0.2,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 ) + Vector3(0, 4, 0)}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-23.85,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-23.85,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-23.85,-3 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ) + Vector3(0, 4, 0),rotation = Rotation( 0,0.5,0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-18,-3.0 )}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 ) + Vector3(0, 4, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 ) + Vector3(0, 4, 0),rotation = Rotation( 0,-0.35,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 ) + Vector3(0, 4, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 ) + Vector3(0, 4, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 ) + Vector3(0, 4, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 ) + Vector3(0, 4, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 ) + Vector3(0, 4, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 ) + Vector3(0, 4, 0)}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 ) + Vector3(0, 4, 0) }
			
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 ) }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -17.8, -3.55) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2)  + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -14.2, -3.8) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -7, -3.8) + Vector3(0, 4, 0) }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-20.5,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -7.1, -1.3) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9) + Vector3(0, 4, 0) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 ) + Vector3(0, 4, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 ) + Vector3(0, 4, 0)}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-14,-3.48 ) + Vector3(0, 4, 0)}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 ) + Vector3(0, 4, 0)}	
	
	
--ACOG (+6)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-34,-4.7 ) + Vector3(0, 1, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_rage = { translation = Vector3( -0.05,-26,-4.6 ) + Vector3(0, 1.1, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.05,-27,-5.3 ) + Vector3(0, 1.1, 0)  }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.3,-0.45 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-0.05 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-3.45 ) + Vector3(0, 6, 0) ,rotation = Rotation( 0,-0.2,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-2.7 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-6.25 ) + Vector3(0, 6, 0) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-22,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-22,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-22,-3 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-0.1 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-2.9 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ) + Vector3(0, 6, 0) ,rotation = Rotation( 0,0.5,0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-0.1 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-16,-3.0 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-17.75,-4 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-9.25,-3.4 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-2.7 ) + Vector3(0, 6, 0) ,rotation = Rotation( 0,-0.35,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-3 ) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-5.15 ) + Vector3(0, 6, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-5.05 ) + Vector3(0, 6, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-5 ) + Vector3(0, 6, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-3.59 ) + Vector3(0, 6, 0)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-4.15 ) + Vector3(0, 6, 0)}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-14.7,-2.97 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-2.77 ) + Vector3(0, 6, 0)  }
			
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0,-13.5,-3.25 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.03,-2.4,-3.55 ) + Vector3(0, 6, 0)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-18,-3.1 ) }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -17.8, -3.55) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -4.2) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -14.2, -3.8) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -7, -3.8) + Vector3(0, 6, 0) }

tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-18.7,-3 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-3.3 ) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-3.3 ) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -3.2) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -2.7) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -7.1, -1.3) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -3.9) + Vector3(0, 6, 0) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-22.4,-3.8 ) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-0.25 ) + Vector3(0, 6, 0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-3.5 ) + Vector3(0, 6, 0)}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-14,-3.48 ) + Vector3(0, 6, 0)}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-14.3,-3.2 ) + Vector3(0, 6, 0)}	

																		
--45 degree irons
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_m95 = {translation = Vector3(-0.275, 10, -14.75),rotation = Rotation(-0.1, 0, -45)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_msr = {translation = Vector3(-0.9, 8, -12.8),rotation = Rotation(0, 0, -45)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_mosin = {translation = Vector3(-2.44, -2, -12.6),rotation = Rotation(0, 0, -45)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_r93 = {translation = Vector3(-2.4, 8, -13.8),rotation = Rotation(0, 0, -45)}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_hk21 = {translation = Vector3(-0.625, 0, -13.75),rotation = Rotation(-2, 3, -45)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_m249 = {translation = Vector3(-0.65, 0, -13.25),rotation = Rotation(-1.3, 2, -45)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_lmg_rpk = {translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45)}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m4 = { translation = Vector3(-2.8, 10, -10.4),rotation = Rotation(0.85, -1, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_amcar = { translation = Vector3(-2.8, 5, -10.4),rotation = Rotation(0.2, 0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m16 = { translation = Vector3(-2.8, 5, -10.4),rotation = Rotation(0.2, 0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_olympic = { translation = Vector3(-2.8, 5, -10.4),rotation = Rotation(0.2, 0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_74 = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3(-1.4, 8, -12.9),rotation = Rotation(0.9, -1, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_aug = { translation = Vector3(-3.65, 5, -13.2),rotation = Rotation(0.4, -0.4, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g36 = { translation = Vector3(-0.7, 5, -12),rotation = Rotation( 0.45, -0.5, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_p90 = { translation = Vector3(-0.6, 5, -12.5),rotation = Rotation( -0.7, 0.2, -45)  }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m14 = { translation = Vector3(-2.2, 0, -13.9),rotation = Rotation(0.3 ,0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3(-4.6, 5, -14.4),rotation = Rotation( 0.35, -0.3, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3(-2.15, 5, -12.75),rotation = Rotation(0.5, -0.5, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3(-1.4, 0, -11),rotation = Rotation( 0, -0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3(-2.9, 5, -15.4),rotation = Rotation( 0, -0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3(-2.625, 5, -13.5),rotation = Rotation( 0.125, -0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_uzi = { translation = Vector3(-2.4, 5, -15.2),rotation = Rotation( 0.15, -0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_sterling = { translation = Vector3(-4.9, 5, -11.6),rotation = Rotation( 0.0, -0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( -2.5,-2,-12.5 ),rotation = Rotation( 0.0, -0, -45) }
			
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.2, 0, -12.6),rotation = Rotation(-0.05 ,0.35, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_m45 = { translation = Vector3(-4.1, 0, -14.65),rotation = Rotation(0.15, -0.1, -45) }
		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3(-3.9, 5, -13.4),rotation = Rotation( 0.5, -0.5, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_scar = { translation = Vector3(-1.65, 8, -9.9),rotation = Rotation(0.5, -0.5, -45) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_fal = { translation = Vector3(-2.45, 10, -13.4),rotation = Rotation(0.7 ,-0.75, -45) }
			
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_saiga = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_r870 = { translation = Vector3(-2.55, 10, -13.5),rotation = Rotation(0.5 ,-0.25, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_shot_serbu = { translation = Vector3(-2.55, 10, -13.5),rotation = Rotation(0.5 ,-0.25, -45) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_ben = { translation = Vector3(-3.3, 10, -13.5),rotation = Rotation(0.75 ,-0.75, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_striker = { translation = Vector3(-2.6, 10, -12.9),rotation = Rotation(0.5 ,-0.3, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(-2.4, 10, -11.4),rotation = Rotation(0.1 ,-0.3, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-2.35, 10, -14),rotation = Rotation(0.8 ,-0.8, -45) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_famas = { translation = Vector3(2.4, 2, -17),rotation = Rotation(-0.625, 2.2, -45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( -0.7,5,-12.4 ),rotation = Rotation(0.75 ,-0.7, -45)}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_galil = { translation = Vector3( -2.1,5,-13.2 ),rotation = Rotation(0.275 ,-0., -45)}


--Leupold
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -23, -4.68)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -34, -4.4)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0.005, -30, -4.63)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0.0, -51.8, -5.125)}
		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-19,-1.4) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-23.1,-0.95 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-23,-0.95 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-23,-0.95 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.02,-43,-3.87 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_akm = { translation = Vector3( -0.015,-43,-3.88 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_akmsu = {  translation = Vector3( -0.022,-38,-3.85 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.005,-19,-4.515) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-22.5,-3.61 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( -0.01,-20.5,-3.81 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0.03,-30.75,-3.87 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_m14 = { translation = Vector3(-0.02, -39, -4.7) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( -0.005,-25,-4.325 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( -0.005,-23,-3.63 ),rotation = Rotation( 0,-0.35,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( -0.01,-38.25,-3.865 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_scorpion= { translation = Vector3( 0.001,-32.7,-6.04 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0.005,-27.9,-5.852 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0.003,-27.2,-5.94 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0.001,-38.8,-4.46 )}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0.001,-44,-5.057 )}
			
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.0525,-31.25,-3.65 ),rotation = Rotation( 0,0.95,0) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( -0.005,-33.5,-4.775 ) }
		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-24.75,-3.67 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_scar = { translation = Vector3(0.025, -22, -1.15) }
			
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_hk21 = { translation = Vector3( 0.02,-30,-4.16 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_m249 = { translation = Vector3( -0.04,-18,-4.45 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.03,-40,-3.99 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( -0.015,-43,-3.88 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_fal = { translation = Vector3( -0.02,-16,-4.36 )}
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( -0.022,-41,-3.875 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-27,-4.125) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-26.5,-4.115) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0.025, -22.55, -4.065) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -26.75, -3.615) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -23.5, -2.175) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.155, -20.5, -4.79) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_deagle = { translation = Vector3( 0,-54.4,-5.59 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_rage = {  translation = Vector3( -0.05,-47.4,-5.48 ) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_pis_judge  = { translation = Vector3( -0.03,-47.4,-6.23 ) }
	
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-28.4,-7.1 )}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-29.1,-4.375 )}		
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-30,-4.06 )}

		
--Schmidt & Bender 1-8x24 PM Short Dot (default sniper attachment)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_shortdot.stats = { value = 1, zoom = 8}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -20.25, -4.575)}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0.0225, -31.25, -4.3525) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0.0, -49.25, -5.025) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0.01, -27.5, -4.53) }
	
--C96 Scope (same as above but shrunken)
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_sight.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_fps_upg_o_shortdot"
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_sight.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_third_upg_o_shortdot"
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_sight.stats = { value = 1, zoom = 8, recoil = 2, concealment = -2}
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_sight.stance_mod = {
	wpn_fps_pis_c96 = {translation = Vector3(-3.41, -38.5, 0.93)},
	--wpn_fps_pis_c96 = {translation = Vector3(-3.41, -18.5, 0.93)},
	
	wpn_fps_ass_m4 = { translation = Vector3( 0,-14,-1.305) },
	wpn_fps_ass_amcar = { translation = Vector3( 0.0025,-18.1, -0.85 ) },
	wpn_fps_ass_m16 = { translation = Vector3( 0.0025,-18, -0.85 ) },
	wpn_fps_smg_olympic = { translation = Vector3( 0.0025,-18, -0.85 ) },
	wpn_fps_ass_74 = { translation = Vector3( -0.02,-38,-3.77 ) },
	wpn_fps_ass_akm = { translation = Vector3( -0.015,-38,-3.78 ) },
		
	wpn_fps_smg_akmsu = {  translation = Vector3( -0.022,-32,-3.75 ) },
	wpn_fps_ass_ak5 = { translation = Vector3( -0.005,-14,-4.375) },
	wpn_fps_ass_aug = { translation = Vector3( 0,-17.5,-3.51 ) },
	wpn_fps_ass_g36 = { translation = Vector3( -0.01,-16,-3.71 ) },
	wpn_fps_smg_p90 = { translation = Vector3( 0.03,-24.75,-3.77 ) },
	wpn_fps_ass_m14 = { translation = Vector3(-0.02, -33, -4.6) },
	wpn_fps_smg_mp9 = { translation = Vector3( -0.005,-20,-4.225 ) },
	wpn_fps_smg_mp5 = { translation = Vector3( -0.005,-17,-3.53 ),rotation = Rotation( 0,-0.35,0) },
	wpn_fps_smg_mac10 = { translation = Vector3( -0.01,-32.25,-3.765 )},
	wpn_fps_smg_scorpion= { translation = Vector3( 0.001,-27.5,-5.94 )},
	wpn_fps_smg_tec9 = { translation = Vector3( 0.001,-22.9,-5.745 )},
	wpn_fps_smg_uzi = { translation = Vector3( 0.001,-22.2,-5.835 )},
	wpn_fps_smg_sterling = { translation = Vector3( 0.001,-34.9,-4.35 )},
	wpn_fps_smg_thompson = { translation = Vector3( 0.001,-39,-4.95 )},
			
	wpn_fps_ass_s552 = { translation = Vector3( -0.0525,-26,-3.49),rotation = Rotation( 0,0.95,0) },
	wpn_fps_smg_m45 = { translation = Vector3( -0.005,-27.5,-4.675 ) },
		
	wpn_fps_smg_mp7 = { translation = Vector3( 0,-18.75,-3.57 ) },
	wpn_fps_ass_scar = { translation = Vector3(0.025, -17, -1.05) },
			
	wpn_fps_lmg_hk21 = { translation = Vector3( 0.02,-24.5,-4.05 ) },
	wpn_fps_lmg_m249 = { translation = Vector3( -0.04,-13,-4.33 ) },
	wpn_fps_lmg_rpk = { translation = Vector3( 0.03,-35,-3.87 ) },
	
	wpn_fps_ass_akm_gold = { translation = Vector3( -0.015,-38,-3.78 ) },
	
	wpn_fps_ass_fal = { translation = Vector3( -0.02,-11,-4.26 )},
	
	wpn_fps_shot_saiga = { translation = Vector3( -0.022,-35,-3.775 ) },
	wpn_fps_shot_r870 = { translation = Vector3( 0,-22,-4.015) },
	wpn_fps_shot_serbu = { translation = Vector3( 0,-21.5,-4.015) },
	
	wpn_fps_sho_ben = { translation = Vector3(0.025, -16.55, -3.965) },
	wpn_fps_sho_striker = { translation = Vector3(0, -20.75, -3.515) },
	wpn_fps_sho_ksg = { translation = Vector3(0, -17.5, -2.075) },
	wpn_fps_sho_spas12 = { translation = Vector3(-0.1575, -16.75, -4.685) },
	
	wpn_fps_ass_famas = { translation = Vector3( 0,-23.6,-7 )},		
	wpn_fps_ass_g3 = { translation = Vector3( 0,-25.8,-4.2625 )},		
	wpn_fps_ass_galil = { translation = Vector3( 0,-25.,-3.962 )},
	
	wpn_fps_pis_deagle = { translation = Vector3( 0,-49.4,-5.47 ) },
	wpn_fps_pis_rage = {  translation = Vector3( -0.055,-41.4,-5.387 ) },
	wpn_fps_pis_judge  = { translation = Vector3( -0.03,-42.4,-6.13 ) },
	}
		
	
if sig_rear_iron == true then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_o_flipup.unit = "units/payday2/weapons/wpn_fps_upg_o_marksmansight/wpn_upg_o_marksmansight_rear"

	pivot_shoulder_translation = Vector3(10.6642, 22.0789, -3.95194)
	pivot_shoulder_rotation = Rotation(0.106285, 0.18453, 0.630167)
	pivot_head_translation = Vector3(-0.085, 19, 0.6)
	pivot_head_rotation = Rotation(-0.1, -0.65, 0)
	tweak_data.player.stances.s552.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances.s552.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--EOTech
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-15.4,-3.1 ), rotation = Rotation( 0,0.95,0) }
	--Aimpoint
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-15.4,-3.1 ) + Vector3(0, 2, 0), rotation = Rotation( 0,0.95,0) }
	--Specter Sight (ELCAN Specter DR) (+4)
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-10.25,-2.4 ) + Vector3(0, 4, 0), rotation = Rotation( 0,0.5,0) }
	--ACOG 
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-15.25,-3.1 ) + Vector3(0, 6, 0), rotation = Rotation( 0,0.95,0) }
	--45 degree irons
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.1, 0, -13.4),rotation = Rotation(-0.5, 1, -45) }
	--Extra Zoom
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-10.25,-3.1 ) + Vector3( 0,0,-3.15), rotation = Rotation( 0,0.95,0) }
	--Shortdot
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( 0.0,-26,-3.87 ),rotation = Rotation( 0,0.95,0) }
else
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_o_flipup.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_o_flipup"

	pivot_shoulder_translation = Vector3(10.6642, 22.0789, -3.95194)
	pivot_shoulder_rotation = Rotation(0.106285, 0.18453, 0.630167)
	pivot_head_translation = Vector3(0, 19, 0)
	pivot_head_rotation = Rotation(0, 0, 0)
	tweak_data.player.stances.s552.steelsight.shoulders.translation =  pivot_head_translation - pivot_shoulder_translation:rotate_with( pivot_shoulder_rotation:inverse() ):rotate_with( pivot_head_rotation )
	tweak_data.player.stances.s552.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	--EOTech
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-15.4,-2.4 ), rotation = Rotation( 0,0.5,0) }
	--Aimpoint
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.05,-15.4,-2.4 ) + Vector3(0, 2, 0), rotation = Rotation( 0,0.5,0) }
	--Specter Sight (ELCAN Specter DR) (+4)
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.01,-10.25,-3.1 ) + Vector3(0, 4, 0), rotation = Rotation( 0,0.95,0) }
	--ACOG 
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-15.25,-2.4 ) + Vector3(0, 6, 0), rotation = Rotation( 0,0.5,0) }
	--45 degree irons
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.2, 0, -12.6),rotation = Rotation(-0.05 ,0.35, -45) }
	--Extra Zoom
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-10.25,-2.4 ),rotation = Rotation( 0,0.5,0) }
	--Shortdot
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.0525,-26,-3.49),rotation = Rotation( 0,0.95,0) }
	
end
	
if ak_optics == true then
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.025,-23,-3 ) + Vector3( 0,0,-3.15) }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-23,-3 ) + Vector3( 0,0,-3.15) }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-20,-3 ) + Vector3( 0,0,-3.15) }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-15.25,-3.0 ) + Vector3( 0,0,-3.15) }	
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-20,-3.1 ) + Vector3( -0.06,0,-3.15) }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-23,-3 ) + Vector3( 0,0,-3.15) }
	
	--Aimpoint PRO (+4)
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.025,-27.75,-2.95 ) + Vector3( 0, 2, 0 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-27.85,-3 ) + Vector3( 0, 2, 0 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-24.6,-3 ) + Vector3( 0, 2, 0 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-22.2,-3.0 ) + Vector3( 0, 2, 0 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-23.8,-3.1 ) + Vector3( 0, 2, 0 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-27.85,-3 ) + Vector3( 0, 2, 0 )}

	--EOTech (base)
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_74 = { translation = Vector3( -0.025,-27.75,-2.95 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-27.85,-3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-24.6,-3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-22.2,-3.0 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-23.8,-3.1 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-27.85,-3 ) }
else
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,1,-3 ) + Vector3( 0,-10,-3.15)  }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,7.25,-3.0 ) + Vector3( 0,-10,-3.15)  }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,2,-3.1 ) + Vector3( -0.06,-10,-3.15)  }
	tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-1,-3 ) + Vector3( 0,-10,-3.15)  }
	
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-1,-3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-1,-3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,1,-3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,7.25,-3.0 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,2,-3.1 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-1,-3 ) }

	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0,-6,-3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0,-6,-3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-3,-3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-0.25,-3.0 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_lmg_rpk = { translation = Vector3( 0.02,-2,-3.1 ) }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0,-6,-3 ) }
end

--Specter Sight (ELCAN Specter DR)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stats = { value = 8, zoom = 6, recoil = 1, spread_moving = -3, concealment = -3 }

--Military Red Dot (Aimpoint PRO)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stats = { value = 8, zoom = 3, recoil = 0, spread_moving = -3, concealment = -3 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }

--EOTech
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.stats = { value = 3, zoom = 2, recoil = 0, spread_moving = -2, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--ACOG
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stats = { value = 6, zoom = 6, recoil = 1, spread_moving = -1, concealment = -3 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }

--Military Red Dot CCE (Aimpoint PRO)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.stats = { value = 1, zoom = 3, recoil = 0, spread_moving = -3, concealment = -3 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--EOTech XPS
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stats = { value = 5, zoom = 2, recoil = 0, spread_moving = -3, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }

--Aimpoint CS
tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.stats = { value = 5, zoom = 3, recoil = 0, spread_moving = -3, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--RX01
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.stats = { value = 5, zoom = 1, recoil = 0, spread_moving = -3, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod )

--Docter
tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.stats = { value = 5, zoom = 1, recoil = 0, spread_moving = -1, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod )

--Micro T1
tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.stats = { value = 3, zoom = 1, recoil = 0, spread_moving = -1, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stance_mod )

--CMORE
tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.stats = { value = 5, zoom = 1, recoil = 0, spread_moving = -1, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--RX30
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.stats = { value = 5, zoom = 2, recoil = 0, spread_moving = -3, concealment = -2 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

--Reflex
tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.stats = { value = 5, zoom = 1, recoil = 0, spread_moving = -3, concealment = -1 }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight" }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.stance_mod = deep_clone( tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stance_mod )

tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_iron_sight.stats = { recoil = -1,	concealment = 2 }

--Marksman Sights (Pistols)
tweak_data.weapon.factory.parts.wpn_upg_o_marksmansight_rear.stats = { value = 1, recoil = 0, zoom = 0}

--RMR Red Dot (Pistols)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stats = { value = 1, concealment = -1, recoil = 0, zoom = 1}

tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_1911 = { translation = Vector3(0, -12, -0.45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_beretta = { translation = Vector3(0, -7, -0.34) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_deagle = { translation = Vector3(0, -7, -0.6) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g17 = { translation = Vector3(0, -8, -0.75) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g18c = { translation = Vector3(0, -8, -0.45) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_usp = { translation = Vector3(0, -10, -0.1) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_ppk = { translation = Vector3(0, -7, -1) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_p226 = { translation = Vector3(0, -8, -0.6) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g22c = { translation = Vector3(0, -8, -0.2) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_g26 = { translation = Vector3(0, -8, -0.55) }
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_c96 = { translation = Vector3(0, -1, -1.1) }
		

--Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS (Theia)
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stats = {value = 8, zoom = 10, recoil = 3, spread_moving = -3, concealment = -3}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up", "wpn_fps_ass_m16_o_handle_sight", "wpn_fps_ass_m16_os_frontsight" }




--45 deg. irons
tweak_data.weapon.factory.parts.wpn_fps_upg_o_45iron.stats = {value = 1, gadget_zoom = 1}

tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_rear.stance_mod = {
	wpn_fps_sho_striker = { translation = Vector3(0, -6.75, -2.7), rotation = Rotation(0,0.3,0)  },
	wpn_fps_sho_ksg = { translation = Vector3(0, -3.5, -1.3), rotation = Rotation(0,0.3,0) },		
	wpn_fps_shot_saiga = { translation = Vector3(0, -3.5, -3), rotation = Rotation(0,0.3,0) },	
	wpn_fps_smg_p90 = { translation = Vector3(0, -3.5, -3), rotation = Rotation(0,0.3,0) },	
	wpn_fps_ass_aug = { translation = Vector3(0, -3.5, -2.7), rotation = Rotation(0,0.3,0) }		
	}

if sig_rear_iron == true then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.02,-31.25,-3.975 ),rotation = Rotation( 0,0.95,0) }
else
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.0525,-31.25,-3.65 ),rotation = Rotation( 0,0.95,0) }
end
			
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_45iron/wpn_fps_upg_o_45iron"
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.type = "gadget"
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.sub_type = "second_sight"
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.a_obj = "ayy_lmao"
tweak_data.weapon.factory.parts.wpn_fps_extra_zoom.stats = {value = 1, gadget_zoom = 1}
--}		
			
			
------------------[[MAGAZINES]]------------------{
--30 rounder (AMCAR, AMR-16, Para SMG)
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.stats = { value = 1, concealment = -1, extra_ammo = 10}

--20 rounder (CAR-4, AK5)
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.stats = { value = 2, concealment = 1, extra_ammo = -10 }

--Beta C Mag
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_drum.stats = { value = 9, extra_ammo = 70, recoil = 1, concealment = -5 }

--STANAG Quad Stack 
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.stats = { value = 1, concealment = -2, recoil = 0, spread = 0, extra_ammo = 30 }

--AK Quad Stack 
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_m_quad.stats = { value = 1, concealment = -3, recoil = 0, spread = 0, extra_ammo = 30 }

--PMAG
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.stats = { value = 3, extra_ammo = 1}

--FAL 30 Round Mag
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_m_01.stats = { value = 3, extra_ammo = 10, concealment = -2 }

--R870 Tube extension
tweak_data.weapon.factory.parts.wpn_fps_shot_r870_m_extended.stats = { value = 6, concealment = -1, spread_moving = -1, extra_ammo = 2 }

--Loco Tube extension
tweak_data.weapon.factory.parts.wpn_fps_shot_shorty_m_extended_short.stats = { value = 1, extra_ammo = 1 }
tweak_data.weapon.factory.parts.wpn_fps_shot_shorty_m_extended_short.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"
tweak_data.weapon.factory.parts.wpn_fps_shot_shorty_m_extended_short.third_unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_b_dummy"

--Saiga 20 Round Drum (can't be attached via the mod menu)
tweak_data.weapon.factory.parts.wpn_upg_saiga_m_20rnd.stats = { value = 1, extra_ammo = 12 }

--MP7 40 rounder
tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_m_extended.stats = {  value = 1, concealment = -3, extra_ammo = 20 }

--MP5 GSG-5 Mag (can't be attached via the mod menu)
tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_drum.stats = { value = 1, extra_ammo = 80, damage = -2, recoil = 3 }

--MP9 30 rounder
tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_m_extended.stats = { value = 4, concealment = -2, extra_ammo = 10 }

--M10 30 rounder
tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_m_extended.stats = { value = 2, spread_moving = -2, recoil = 0, concealment = -2, extra_ammo = 10 }

--1911 12 rounder
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_extended.stats = { value = 3, spread_moving = -2, concealment = -1, extra_ammo = 4 }

--USP 20 rounder
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_m_extended.stats = { value = 2, spread_moving = -1, concealment = -1, extra_ammo = 8 }

--Glock 33 rounder
tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats = { value = 6, spread_moving = -3, extra_ammo = 16, concealment = -2 }

--P226 22 rounder
tweak_data.weapon.factory.parts.wpn_fps_pis_p226_m_extended.stats = { value = 1, extra_ammo = 9, spread_moving = -2 }

--Beretta 30 rounder 
tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_m_extended.stats = { value = 2, spread_moving = -2, concealment = -2, extra_ammo = 15 }

--M45 50 rounder
tweak_data.weapon.factory.parts.wpn_fps_smg_m45_m_extended.stats = { value = 4, concealment = -2, extra_ammo = 14, recoil = 2 }

--Skorpion Dual Mags
tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_m_extended.stats = { value = 1, concealment = -3, recoil = 2, total_ammo_mod = 50}

--TEC-9 50rnd Mag
tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_m_extended.stats = { value = 4, extra_ammo = 18, recoil = 0, concealment = -2}

--G26 Stippled Mag
tweak_data.weapon.factory.parts.wpn_fps_pis_g26_m_contour.stats = { value = 6, recoil = 1, spread = 0, concealment = -1, damage = 0	}

--AK Drum Mag
tweak_data.weapon.factory.parts.wpn_upg_ak_m_drum.stats = { value = 5, concealment = -4, extra_ammo = 45	}

--Sterling 34rnd Mag
tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_m_long.stats = {
			value = 1,
			extra_ammo = 14,
			concealment = -2
		}
--Sterling 10rnd Mag
tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_m_short.stats = {
			value = 1,
			extra_ammo = -10,
			concealment = 2
		}
--C96 20rnd Mag
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_m_extended.stats = {
			value = 1,
			concealment = -2,
			extra_ammo = 10
		}

--}


------------------[[SHOTGUN AMMO]]------------------{

tweak_data.weapon.factory.parts.wpn_fps_upg_a_slug.stats = { value = 5, total_ammo_mod = -20, damage = 4, spread = 7, moving_spread = 2, recoil = -6 }
tweak_data.weapon.factory.parts.wpn_fps_upg_a_slug.custom_stats = { damage_far_mul = 3, rays = 1, armor_piercing_add = 1, can_shoot_through_enemy = true, can_shoot_through_shield = true, can_shoot_through_wall = true, ammo_pickup_min_mul = 0.9, ammo_pickup_max_mul = 0.95, damage_near_mul = 0.0 }

tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom.stats = { value = 5, total_ammo_mod = 0, damage = 8, spread = -1, recoil = -3 }
tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom.custom_stats = { rays = 6, ammo_pickup_min_mul = 0.95, ammo_pickup_max_mul = 1, damage_far_mul = 0.75}

tweak_data.weapon.factory.parts.wpn_fps_upg_a_explosive.stats ={ value = 5, total_ammo_mod = -39, damage = 0, spread = 2, moving_spread = 3, suppression = -110, recoil = -4 }
tweak_data.weapon.factory.parts.wpn_fps_upg_a_explosive.custom_stats = { ignore_statistic = true, rays = 1, damage_far_mul = 2.5, bullet_class = "InstantExplosiveBulletBase", ammo_pickup_min_mul = 0.85, ammo_pickup_max_mul = 0.9 }

tweak_data.weapon.factory.parts.wpn_fps_upg_a_piercing.stats = { value = 5, damage = -4, spread = 2, recoil = 2 }
tweak_data.weapon.factory.parts.wpn_fps_upg_a_piercing.custom_stats = { rays = 15, damage_far_mul = 1.6, armor_piercing_add = 1, ammo_pickup_min_mul = 1.0, ammo_pickup_max_mul = 1.025 }


if sho_bird == true then
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.stats = { value = 5, damage = -10, spread = -2, recoil = 6, total_ammo_mod = 10 }
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.name_id = "bm_wp_upg_a_bird"
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.desc_id = "bm_wp_upg_a_bird_desc"
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.custom_stats = { rays = 50, damage_far_mul = 0.9, ammo_pickup_min_mul = 1.025, ammo_pickup_max_mul = 1.05}
	
	tweak_data.weapon.factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_piercing = { custom_stats = { rays = 10, damage_far_mul = 1.6, armor_piercing_add = 1, ammo_pickup_min_mul = 1.0, ammo_pickup_max_mul = 1.025}}
	tweak_data.weapon.factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom = { custom_stats = { rays = 4, ammo_pickup_min_mul = 0.95, ammo_pickup_max_mul = 1, damage_far_mul = 0.75}}
	tweak_data.weapon.factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom_free = { custom_stats = { rays = 30, ammo_pickup_min_mul = 1.025, ammo_pickup_max_mul = 1.05, damage_far_mul = 0.9}}
else
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.stats = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom.stats)
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.name_id = "bm_wp_upg_a_custom"
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.desc_id = "bm_wp_upg_a_custom_desc"
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.custom_stats = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom.custom_stats)
	
	tweak_data.weapon.factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_piercing = { custom_stats = { rays = 10, damage_far_mul = 1.6, armor_piercing_add = 1, ammo_pickup_min_mul = 1.0, ammo_pickup_max_mul = 1.025}}
	tweak_data.weapon.factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom = { custom_stats = { rays = 4, ammo_pickup_min_mul = 0.95, ammo_pickup_max_mul = 1, damage_far_mul = 0.75}}
	tweak_data.weapon.factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom_free = { custom_stats = { rays = 4, ammo_pickup_min_mul = 0.95, ammo_pickup_max_mul = 1, damage_far_mul = 0.75}}
end

tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -39, damage = 2, spread = 2, moving_spread = 3, suppression = -110, recoil = -4 }}

tweak_data.weapon.factory.wpn_fps_shot_serbu.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -39, damage = -10, spread = 2, moving_spread = 3, suppression = -110, recoil = -4 }}

tweak_data.weapon.factory.wpn_fps_shot_r870.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -39, damage = -10, spread = 2, moving_spread = 3, suppression = -110, recoil = -4 }}

tweak_data.weapon.factory.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -39, damage = -16, spread = 2, moving_spread = 3, suppression = -110, recoil = -4 }}

tweak_data.weapon.factory.wpn_fps_sho_ksg.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -39, damage = -6, spread = 2, moving_spread = 3, suppression = -110, recoil = -4 }}

tweak_data.weapon.factory.wpn_fps_sho_spas12.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -39, damage = -6, spread = 2, moving_spread = 3, suppression = -110, recoil = -4 }}

tweak_data.weapon.factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_explosive = { stats = { value = 5, total_ammo_mod = -39, damage = -8, spread = 2, moving_spread = 3, suppression = -110, recoil = -4 }}
--}
		

------------------[[GUN FIXES]]------------------{

tweak_data.weapon.factory.wpn_fps_pis_c96.override.wpn_fps_pis_c96_sight = {
	unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_pis_c96_pts/wpn_fps_pis_c96_sight",
	third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_pis_c96_pts/wpn_third_pis_c96_sight",
}

tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_standard.override = {
	wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"},
	wpn_fps_upg_o_mbus_front = {a_obj = "a_o_f_2"}
}


		
--sets optics to the default optic postion on a gun on some of the AK type guns/mods for consistencies sake
tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_standard.override = {}
tweak_data.weapon.factory.parts.wpn_fps_smg_akmsu_fg_standard.override = {}

--Fixes Glock 18 slide not moving while aiming
tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_b_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
tweak_data.weapon.factory.parts.wpn_fps_pis_g26_b_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
tweak_data.weapon.factory.parts.wpn_fps_pis_g26_b_custom.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
--Fixed the 1911 irons not moving while aiming
tweak_data.weapon.factory.wpn_fps_pis_1911.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
--Fixes the Galil charging handle not moving while shooting
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_body_standard.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
tweak_data.weapon.factory.wpn_fps_ass_galil.animations = {reload = "reload", fire = "recoil", fire_steelsight = "recoil"}
tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_body_standard.animations = {reload = "reload", reload_not_empty = "reload_not_empty", fire = "recoil", fire_steelsight = "recoil"}

--Adds the optic mounts to guns that need them for the "new" attachments
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_lock.forbids = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_leupold",
	"wpn_fps_pis_c96_sight",
	}


tweak_data.weapon.factory.wpn_fps_pis_deagle.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
tweak_data.weapon.factory.wpn_fps_pis_deagle.adds.wpn_fps_pis_c96_sight = {"wpn_fps_pis_rage_o_adapter"}

tweak_data.weapon.factory.wpn_fps_pis_deagle.override.wpn_fps_upg_o_leupold = {a_obj = "a_quite"}
tweak_data.weapon.factory.wpn_fps_pis_deagle.override.wpn_fps_pis_c96_sight = {a_obj = "a_quite"}
	
tweak_data.weapon.factory.wpn_fps_x_deagle.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
tweak_data.weapon.factory.wpn_fps_x_deagle.adds.wpn_fps_pis_c96_sight = {"wpn_fps_pis_rage_o_adapter"}

tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_long.forbids = {
	"wpn_fps_pis_deagle_co_long",
	"wpn_fps_pis_deagle_co_short",
	"wpn_fps_upg_ns_pis_meatgrinder",
	"wpn_fps_upg_ns_pis_ipsccomp"
}
	

tweak_data.weapon.factory.wpn_fps_pis_rage.adds.wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"}
tweak_data.weapon.factory.wpn_fps_pis_rage.adds.wpn_fps_pis_c96_sight = {"wpn_fps_pis_rage_o_adapter"}

		
tweak_data.weapon.factory.parts.wpn_fps_pis_rage_lock.forbids = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_leupold",
}
	
tweak_data.weapon.factory.wpn_fps_pis_judge.adds = {
	wpn_fps_upg_fl_ass_laser = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_fl_ass_peq15 = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_fl_ass_smg_sho_peqbox = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_fl_ass_smg_sho_surefire = {"wpn_fps_pis_judge_fl_adapter"},
	wpn_fps_upg_o_specter = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_aimpoint = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_docter = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_eotech = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_t1micro = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_cmore = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_acog = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_cs = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_eotech_xps = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_reflex = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_rx01 = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_rx30 = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_upg_o_leupold = {"wpn_fps_pis_rage_o_adapter"},
	wpn_fps_pis_c96_sight = {"wpn_fps_pis_rage_o_adapter"}
}	
	
	
		
--Adds rails for the extra optics when needed
tweak_data.weapon.factory.wpn_fps_smg_akmsu.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_smg_akmsu.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_smg_akmsu.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" }

tweak_data.weapon.factory.wpn_fps_ass_akm.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_ass_akm.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_ass_akm.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" }

tweak_data.weapon.factory.wpn_fps_ass_akm_gold.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_ass_akm_gold.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_ass_akm_gold.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" }

tweak_data.weapon.factory.wpn_fps_shot_saiga.adds = { 
	wpn_fps_smg_akmsu_body_lowerreceiver = { "wpn_upg_ak_g_standard" }
}

tweak_data.weapon.factory.wpn_fps_ass_74.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_ass_74.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_ass_74.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" }
tweak_data.weapon.factory.wpn_fps_ass_74.adds.wpn_fps_ass_ak_body_lowerreceiver = { "wpn_upg_ak_g_standard" }
	
tweak_data.weapon.factory.wpn_fps_ass_ak5.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_ak5_body_rail" }
tweak_data.weapon.factory.wpn_fps_ass_ak5.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_ak5_body_rail" }
tweak_data.weapon.factory.wpn_fps_ass_ak5.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ass_ak5_body_rail" }

tweak_data.weapon.factory.wpn_fps_sho_spas12.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_sho_spas12.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_sho_spas12.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_data.weapon.factory.wpn_fps_shot_r870.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_shot_r870.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_shot_r870.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }
	
tweak_data.weapon.factory.wpn_fps_shot_serbu.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_shot_serbu.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_shot_serbu.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_data.weapon.factory.wpn_fps_lmg_hk21.adds = { 
	wpn_fps_upg_o_specter = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_aimpoint = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_docter = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_eotech = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_t1micro = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_cmore = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_acog = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_cs = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_eotech_xps = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_reflex = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_rx01 = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_rx30 = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_45iron = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_upg_o_leupold = { "wpn_fps_ass_g3_body_rail" },
	wpn_fps_pis_c96_sight = { "wpn_fps_ass_g3_body_rail" },
}
	
tweak_data.weapon.factory.wpn_fps_ass_g3.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_g3_body_rail" }
tweak_data.weapon.factory.wpn_fps_ass_g3.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_g3_body_rail" }
tweak_data.weapon.factory.wpn_fps_ass_g3.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ass_g3_body_rail" }

tweak_data.weapon.factory.wpn_fps_lmg_rpk.adds = { 
	wpn_fps_upg_o_specter = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_aimpoint = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_docter = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_eotech = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_t1micro = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_cmore = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_acog = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_cs = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_eotech_xps = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_reflex = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_rx01 = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_rx30 = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" },
	wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" },
	wpn_fps_pis_c96_sight = { "wpn_fps_ak_extra_ris" },
	wpn_fps_lmg_rpk_fg_standard = { "wpn_fps_upg_vg_ass_smg_verticalgrip"},
}

tweak_data.weapon.factory.wpn_fps_smg_mac10.adds.wpn_fps_upg_o_45iron = { "wpn_fps_smg_mac10_body_ris_special" }
tweak_data.weapon.factory.wpn_fps_smg_mac10.adds.wpn_fps_upg_o_leupold = { "wpn_fps_smg_mac10_body_ris_special" }
tweak_data.weapon.factory.wpn_fps_smg_mac10.adds.wpn_fps_pis_c96_sight = { "wpn_fps_smg_mac10_body_ris_special" }

tweak_data.weapon.factory.wpn_fps_smg_thompson.adds.wpn_fps_upg_o_45iron = { "wpn_fps_smg_thompson_o_adapter" }
tweak_data.weapon.factory.wpn_fps_smg_thompson.adds.wpn_fps_upg_o_leupold = { "wpn_fps_smg_thompson_o_adapter" }
tweak_data.weapon.factory.wpn_fps_smg_thompson.adds.wpn_fps_pis_c96_sight = { "wpn_fps_smg_thompson_o_adapter" }

tweak_data.weapon.factory.wpn_fps_ass_famas.adds.wpn_fps_upg_o_45iron = { "wpn_fps_ass_famas_o_adapter" }
tweak_data.weapon.factory.wpn_fps_ass_famas.adds.wpn_fps_upg_o_leupold = { "wpn_fps_ass_famas_o_adapter" }
tweak_data.weapon.factory.wpn_fps_ass_famas.adds.wpn_fps_pis_c96_sight = { "wpn_fps_ass_famas_o_adapter" }

tweak_data.weapon.factory.wpn_fps_ass_galil.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_ass_galil.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_ass_galil.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_data.weapon.factory.wpn_fps_smg_m45.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_smg_m45.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_smg_m45.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }


tweak_data.weapon.factory.wpn_fps_smg_uzi.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_smg_uzi.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_smg_uzi.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_data.weapon.factory.wpn_fps_smg_tec9.adds.wpn_fps_upg_o_45iron = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_smg_tec9.adds.wpn_fps_upg_o_leupold = { "wpn_fps_shot_r870_ris_special" }
tweak_data.weapon.factory.wpn_fps_smg_tec9.adds.wpn_fps_pis_c96_sight = { "wpn_fps_shot_r870_ris_special" }

tweak_data.weapon.factory.wpn_fps_smg_scorpion.adds.wpn_fps_upg_o_45iron = {"wpn_fps_smg_scorpion_extra_rail"}
tweak_data.weapon.factory.wpn_fps_smg_scorpion.adds.wpn_fps_upg_o_leupold = {"wpn_fps_smg_scorpion_extra_rail"}
tweak_data.weapon.factory.wpn_fps_smg_scorpion.adds.wpn_fps_pis_c96_sight = {"wpn_fps_smg_scorpion_extra_rail"}

tweak_data.weapon.factory.wpn_fps_snp_mosin.adds.wpn_fps_upg_o_leupold = {"wpn_fps_snp_mosin_rail"}

tweak_data.weapon.factory.wpn_fps_smg_sterling.adds.wpn_fps_upg_o_45iron = {"wpn_fps_smg_sterling_o_adapter"}
tweak_data.weapon.factory.wpn_fps_smg_sterling.adds.wpn_fps_pis_c96_sight = {"wpn_fps_smg_sterling_o_adapter"}
tweak_data.weapon.factory.wpn_fps_smg_sterling.adds.wpn_fps_upg_o_leupold = {"wpn_fps_smg_sterling_o_adapter"}

--Removes the gadget rail for some guns and attachments that aren't already covered above (mostly default attachments that have no stats)
tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_k.forbids = { "wpn_fps_addon_ris" } 
tweak_data.weapon.factory.parts.wpn_fps_sho_striker_body_standard.forbids = { "wpn_fps_addon_ris" } 
tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_body_mp9.forbids = { "wpn_fps_addon_ris" } 
tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_body_standard.forbids = { "wpn_fps_addon_ris" } 
tweak_data.weapon.factory.parts.wpn_fps_ass_scar_body_standard.forbids = { "wpn_fps_addon_ris" } 
tweak_data.weapon.factory.parts.wpn_fps_smg_p90_body_p90.forbids = { "wpn_fps_addon_ris" }
tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_b_standard.forbids = { "wpn_fps_addon_ris" } 

tweak_data.weapon.factory.wpn_fps_ass_ak5.override  = {
	wpn_fps_m4_uupg_b_short = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium"},
 }

--AR overrides
tweak_data.weapon.factory.wpn_fps_smg_olympic.override = { 
	wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11}},
	wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40 }},
	wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -5 }},
	wpn_fps_shot_r870_s_solid = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
		stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
	},
}
tweak_data.weapon.factory.wpn_fps_ass_amcar.override = { 
	wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11}},
	wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40 }},
	wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -5 }},
	wpn_fps_shot_r870_s_solid = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
		stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
	},
	wpn_fps_smg_olympic_fg_railed = { 
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail",
			forbids = {}
	},
}
tweak_data.weapon.factory.wpn_fps_ass_m4.override = { 
	wpn_fps_shot_r870_s_solid = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
		stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
	},
	wpn_fps_m16_fg_railed = {
		stats = { value = 7, spread_moving = -2, recoil = 3, concealment = -2, spread = -0 }
	},
}	
tweak_data.weapon.factory.wpn_fps_ass_m16.override = { 
	wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 11}},
	wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 40 }},
	wpn_fps_upg_m4_m_drum = {stats = { value = 9, extra_ammo = 80, recoil = 1, concealment = -5 }}
}

--AK overrides

tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_fps_ass_akm_body_upperreceiver_vanilla = { unit = "units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_body_upperreceiver" }
tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_or", }
tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }
tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_fps_lmg_rpk_s_standard = {
	stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
}
tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_fps_shot_r870_s_solid = { 
	unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
	third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
	stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
}

tweak_data.weapon.factory.wpn_fps_smg_akmsu.override = {
	wpn_fps_shot_r870_s_solid = { 
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
		third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
		stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
	}
}
tweak_data.weapon.factory.wpn_fps_ass_akm.override = {
	wpn_fps_shot_r870_s_solid = { 
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
		third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
		stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
	},
}
tweak_data.weapon.factory.wpn_fps_ass_74.override = { 
	wpn_fps_shot_r870_s_solid = { 
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
		third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
		stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
	},
}	
tweak_data.weapon.factory.wpn_fps_ass_akm_gold.override = { 
	wpn_fps_shot_r870_s_solid = { 
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood",
		third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood",
		stats = { value = 2, spread_moving = -2, recoil = 2, concealment = -2 }
	},
}
if ak_stock_switch == true then
	tweak_data.weapon.factory.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
	tweak_data.weapon.factory.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
	tweak_data.weapon.factory.wpn_fps_ass_akm.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
	tweak_data.weapon.factory.wpn_fps_ass_akm.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }	
	tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
	tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
else
	tweak_data.weapon.factory.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
	tweak_data.weapon.factory.wpn_fps_smg_akmsu.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
	tweak_data.weapon.factory.wpn_fps_ass_akm.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
	tweak_data.weapon.factory.wpn_fps_ass_akm.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }	
	tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_upg_ak_s_folding_vanilla = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding" }
	tweak_data.weapon.factory.wpn_fps_shot_saiga.override.wpn_upg_ak_s_skfoldable = { unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable" }
end


--Glock overrides
tweak_data.weapon.factory.wpn_fps_pis_g22c.override = {
	wpn_fps_upg_o_rmr = {parent = "slide"},
	wpn_fps_pis_g18c_m_mag_33rnd = {stats = { value = 6, spread_moving = -3, extra_ammo = 7, concealment = -2}}
}

tweak_data.weapon.factory.wpn_fps_pis_g26.override = {
	wpn_fps_upg_o_rmr = {parent = "slide"},
	wpn_fps_pis_g18c_m_mag_33rnd = {stats = { value = 6, spread_moving = -3, extra_ammo = 23, concealment = -2}}
}

tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override = { 
	wpn_fps_m4_upper_reciever_round = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round",
	},
	wpn_fps_m4_upper_reciever_round_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_m4_uupg_draghandle = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_m4_uupg_draghandle_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_ass_m16_o_handle_sight = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
	},
}
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override
tweak_data.weapon.factory.parts.wpn_fps_upg_o_leupold.override = tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.override

tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.forbids = { "wpn_fps_m4_upper_reciever_round" }
tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.adds = { "wpn_fps_m4_uupg_draghandle" }
tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.override = { 
	wpn_fps_amcar_uupg_body_upperreciever = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_upper_reciever_round = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_upper_reciever_round_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
	},
	wpn_fps_m4_uupg_draghandle = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_m4_uupg_draghandle_vanilla = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle",
	},
	wpn_fps_ass_m16_o_handle_sight = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
	},
}


tweak_data.weapon.factory.wpn_fps_sho_striker.override = {
	wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_o_r"},
	wpn_upg_o_marksmansight_front = {a_obj = "a_o_f"}
}
tweak_data.weapon.factory.wpn_fps_sho_striker.override.wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_o_r"}
tweak_data.weapon.factory.wpn_fps_sho_striker.override.wpn_upg_o_marksmansight_front = {a_obj = "a_o_f"}

tweak_data.weapon.factory.wpn_fps_ass_aug.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_or", }
tweak_data.weapon.factory.wpn_fps_ass_aug.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }

tweak_data.weapon.factory.wpn_fps_ass_aug.override.wpn_fps_upg_o_mbus_rear = { a_obj = "a_or", }
tweak_data.weapon.factory.wpn_fps_ass_aug.override.wpn_fps_upg_o_mbus_front = { a_obj = "a_of", }
--}

RebalanceAtchScript = true
io.write("rebalance_attach.lua is working", "\n")

end