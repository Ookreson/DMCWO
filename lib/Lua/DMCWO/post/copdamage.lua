--[[
v1.42.3
This script is used in DMC's Weapon Overhaul, please make sure you have the most up to date version
]]

function CopDamage:_dismember_condition(attack_data)
	local dismember_victim = false
	local target_is_spook = false
	target_is_spook = attack_data.col_ray.unit and attack_data.col_ray.unit:base()._tweak_table == "spooc"
	local criminal_name = managers.criminals:local_character_name()
	local criminal_melee_weapon = managers.blackmarket:equipped_melee_weapon()
	local weapon_charged = false
	weapon_charged = attack_data.charge_lerp_value and attack_data.charge_lerp_value > 0.5
	if target_is_spook and weapon_charged --[[and criminal_name == "dragon"]] and criminal_melee_weapon == "sandsteel" then
		dismember_victim = true
	end
	return dismember_victim
end

function CopDamage:damage_bullet(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
		return "friendly_fire"
	end
	
	--
	local damage = attack_data.damage
	local unit_type = self._unit:base()._tweak_table
	local has_ap = attack_data.weapon_unit:base()._has_ap
	local has_hp = attack_data.weapon_unit:base()._has_hp
	--
	
	if self._has_plate and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_plate_name then
		local armor_pierce_roll = math.rand(1)
		local armor_pierce_value = 0
		if attack_data.attacker_unit == managers.player:player_unit() and not attack_data.weapon_unit:base().thrower_unit then
			armor_pierce_value = armor_pierce_value + attack_data.weapon_unit:base():armor_piercing_chance()
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("player", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_2", 0)
			if attack_data.weapon_unit:base():got_silencer() then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_silencer", 0)
			end
			local weapon_category = attack_data.weapon_unit:base():weapon_tweak_data().category
			if weapon_category == "saw" then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("saw", "armor_piercing_chance", 0)
			end
		elseif attack_data.attacker_unit:base() and attack_data.attacker_unit:base().sentry_gun then
			local owner = attack_data.attacker_unit:base():get_owner()
			if alive(owner) then
				if owner == managers.player:player_unit() then
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance", 0)
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance_2", 0)
				else
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance") or 0)
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance_2") or 0)
				end
			end
		end
		damage = damage * armor_pierce_value
		if armor_pierce_roll >= armor_pierce_value then
			return
		end
	end
	local result
	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	
	if unit_type == "tank" then 
		if has_ap then
			damage = damage * 1.20
		elseif has_hp then
			damage = damage * 0.6
		end
	elseif unit_type == "city_swat" then 
		if has_ap then
			damage = damage * 1.20
		elseif has_hp then
			damage = damage * 0.6
		end
	elseif unit_type == "fbi_heavy_swat" then 
		if has_ap and head then
			damage = damage * 1.20
		elseif has_hp and head then
			damage = damage * 0.6
		end
	end
	
	if self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET then
		damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET)
	end
	damage = damage * (self._marked_dmg_mul or 1)
	if self._unit:movement():cool() then
		damage = self._HEALTH_INIT
	end
	local headshot_multiplier = 1
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		if critical_hit then
			managers.hud:on_crit_confirmed()
			damage = crit_damage
		else
			managers.hud:on_hit_confirmed()
		end
		headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
		if tweak_data.character[self._unit:base()._tweak_table].priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end
		if head then
			managers.player:on_headshot_dealt()
		end
	end
	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	elseif head then
		if self._char_tweak.headshot_dmg_mul then
			damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			damage = self._health * 10
		end
	end
	local damage_percent = math.ceil(math.clamp(damage / self._HEALTH_INIT_PRECENT, 1, self._HEALTH_GRANULARITY))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	if damage >= self._health then
		if head and damage > math.random(10) then
			self:_spawn_head_gadget({
				position = attack_data.col_ray.body:position(),
				rotation = attack_data.col_ray.body:rotation(),
				dir = attack_data.col_ray.ray
			})
		end
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		self:die(attack_data.variant)
		self:chk_killshot(attack_data.attacker_unit, attack_data.variant)
	else
		attack_data.damage = damage
		local result_type = self:get_damage_type(damage_percent, "bullet")
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}
		if managers.groupai:state():all_criminals()[attack_data.attacker_unit:key()] then
			managers.statistics:killed_by_anyone(data)
		end
		if attack_data.attacker_unit == managers.player:player_unit() then
			self:_comment_death(attack_data.attacker_unit, self._unit:base()._tweak_table)
			self:_show_death_hint(self._unit:base()._tweak_table)
			local attacker_state = managers.player:current_state()
			data.attacker_state = attacker_state
			managers.statistics:killed(data)
			if attack_data.attacker_unit:character_damage():bleed_out() and not CopDamage.is_civilian(self._unit:base()._tweak_table) then
				local messiah_revive = false
				if managers.player:has_category_upgrade("player", "pistol_revive_from_bleed_out") and not data.weapon_unit:base().thrower_unit then
					local weapon_category = data.weapon_unit:base():weapon_tweak_data().category
					if (weapon_category == "pistol" or weapon_category == "akimbo") and attack_data.attacker_unit:character_damage():consume_messiah_charge() then
						messiah_revive = true
					end
				end
				if messiah_revive then
					attack_data.attacker_unit:character_damage():revive(true)
				end
			end
			self:_check_damage_achievements(attack_data, head)
			if not CopDamage.is_civilian(self._unit:base()._tweak_table) and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and not attack_data.weapon_unit:base().thrower_unit then
				local weapon_category = attack_data.weapon_unit:base():weapon_tweak_data().category
				if weapon_category == "shotgun" or weapon_category == "saw" then
					managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
				end
			end
			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end
		elseif attack_data.attacker_unit:in_slot(managers.slot:get_mask("criminals_no_deployables")) then
			self:_AI_comment_death(attack_data.attacker_unit, self._unit:base()._tweak_table)
		elseif attack_data.attacker_unit:base().sentry_gun and Network:is_server() then
			local server_info = attack_data.weapon_unit:base():server_information()
			if server_info and server_info.owner_peer_id ~= managers.network:session():local_peer():id() then
				local owner_peer = managers.network:session():peer(server_info.owner_peer_id)
				if owner_peer then
					owner_peer:send_queued_sync("sync_player_kill_statistic", data.name, data.head_shot and true or false, data.weapon_unit, data.variant)
				end
			else
				data.attacker_state = managers.player:current_state()
				managers.statistics:killed(data)
			end
		end
	end
	local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
	local attacker = attack_data.attacker_unit
	if attacker:id() == -1 then
		attacker = self._unit
	end
	if alive(attack_data.weapon_unit) and attack_data.weapon_unit:base() and attack_data.weapon_unit:base().add_damage_result then
		attack_data.weapon_unit:base():add_damage_result(self._unit, attacker, result.type == "death", damage_percent)
	end
	self:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height)
	self:_on_damage_received(attack_data)
	return result
end
