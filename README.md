![Project Sloth GitHub Project PS-HUD Banner](https://user-images.githubusercontent.com/91661118/170896135-fead50a0-2a4b-432d-8469-038acfb4f2f3.png)

### ps-hud
Ultra customizable hud featuring a unique and robust settings menu. Change eveything about your experience!

![Project Sloth Buttons 2](https://user-images.githubusercontent.com/91661118/170895968-c4224105-5c87-4947-af94-8e8bd792f566.png)
### **Dependencies**
- [ox_lib](https://github.com/overextended/ox_lib)

### **Optional**
- [ps-buffs](https://github.com/Project-Sloth/ps-buffs)

---


## ⚠️ **Important Information**
- **Do not rename the resource from `ps-hud`, or issues may occur.**
- Locale is supported. Ensure your `qb-core` is up to date: [Update qb-core](https://github.com/qbcore-framework/qb-core).
- **This script is fully open source** with no obfuscation. Svelte compiles the JS during the build. The original source code is available [here](https://github.com/Project-Sloth/ps-hud/tree/main/svelte-source).
- **Minimap Flickering:** If the minimap pulsates or flickers, ensure that `ps-hud` is started **before** the map resource or adjust any scripts using `SetRadarZoom()`.

---

![Project Sloth GitHub Project PS-HUD Install Banner](https://user-images.githubusercontent.com/91661118/170896809-5c15da71-5dd7-4f46-85c5-892701b1eea8.png)

## **Installation Guide**
Follow these steps for a seamless installation:

### **Step 1: Add to Your Resources**
Drag and drop the `ps-hud` folder into your designated resources folder.

💡 Need extra help? Watch this GIF for guidance:  
![Installation GIF](https://user-images.githubusercontent.com/91661118/170898348-4d50573f-fd8e-447e-add1-9562a196c7ed.gif)

---

### **Admin-Only Setting**  
To restrict access to customization options, set **`Config.AdminOnly = true`**. While enabled, admin-saved settings override those of other players.  

Modify this in `ps-hud/config.lua` as shown:  
![Admin Setting GIF](https://user-images.githubusercontent.com/91661118/171066080-6bc11bb8-7cde-460b-8d73-bbc329644c83.gif)

---

## Framework-Specific Setup

### **QB-Core**
1. **Set Framework**:  
    `Config.Framework = 'qb'` in the configuration file.
2. **Update fxmanifest**:  
   Comment out line 18:  
   ```lua
		-- '@qbx_core/modules/playerdata.lua'
	```
3. **Prevent Spawn In Health Regen**:
	- if you use qb-ambulancejob head to client/job.lua
		- look around line 107 for this event
			```lua
				RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
					exports.spawnmanager:setAutoSpawn(false)
					local ped = PlayerPedId()
					local player = PlayerId()
					CreateThread(function()
						Wait(5000)
						SetEntityMaxHealth(ped, 200)
						SetEntityHealth(ped, 200)
						SetPlayerHealthRechargeMultiplier(player, 0.0)
						SetPlayerHealthRechargeLimit(player, 0.0)
					end)
					CreateThread(function()
						Wait(1000)
						QBCore.Functions.GetPlayerData(function(PlayerData)
							PlayerJob = PlayerData.job
							onDuty = PlayerData.job.onduty
							SetPedArmour(PlayerPedId(), PlayerData.metadata['armor'])
							if (not PlayerData.metadata['inlaststand'] and PlayerData.metadata['isdead']) then
								deathTime = Config.ReviveInterval
								OnDeath()
								DeathTimer()
							elseif (PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead']) then
								SetLaststand(true)
							else
								TriggerServerEvent('hospital:server:SetDeathStatus', false)
								TriggerServerEvent('hospital:server:SetLaststandStatus', false)
							end
							if PlayerJob.name == 'ambulance' and onDuty then
								TriggerServerEvent('hospital:server:AddDoctor', PlayerJob.name)
							end
						end)
					end)
				end)
			```
			and we are just going to comment out these 
			```lua
				SetEntityHealth(ped, 200)
				SetPlayerHealthRechargeMultiplier(player, 0.0)
				SetPlayerHealthRechargeLimit(player, 0.0)
			```
			
### **QBox Install**  
1. **Set the Framework**:  
   Ensure `Config.Framework = 'qbx'` in the configuration file.  
2. **Update fxmanifest**:  
   Verify that line 18 is **not commented out**:  
   ```lua
	'@qbx_core/modules/playerdata.lua'
   ```
<br>

#
 
![Project Sloth GitHub Project PS-HUD Features Banner](https://user-images.githubusercontent.com/91661118/170896822-4c6fcf43-94a3-4afd-b651-1eb76244fd8d.png)


#### Some features to mention within this ps-hud:
* Custom icon shapes
* Alter icon size, position and color
* Customize settings for individual icons
* Endless options for icon position and orientation
<br>
# 

![Project Sloth GitHub Project PS-HUD Showcase Banner](https://user-images.githubusercontent.com/91661118/170896830-39245350-47c3-4b42-93d0-ac0ca35c3711.png)

### Time to show you what it looks like!
Here's a few showcased examples while using ps-hud.

#### Design mode and shapes:
https://user-images.githubusercontent.com/89323760/170896585-3f4a7e47-7589-4b55-98a2-0fedb81b4e15.mp4

#### Icon state and color:
https://user-images.githubusercontent.com/89323760/170898487-f86c7495-8fe2-4bcc-a539-c44e22f40c4b.mp4

#### Icon size and position:
https://user-images.githubusercontent.com/89323760/170896588-78bd864d-f88a-44a0-82cd-f654a35d89db.mp4

#### Change progress color:
https://user-images.githubusercontent.com/89323760/170896589-e23f95cc-875a-4bb2-8673-39a36234f7bb.mp4

#### Individually edit icons:
https://user-images.githubusercontent.com/89323760/170896590-0a9af313-19c3-4981-b9c5-a9b682a465f3.mp4

#### Icon layout and spacing:
https://user-images.githubusercontent.com/89323760/170898540-5e3abd16-38bb-45d6-840e-5a2619c2076b.mp4

### Credits:
Inspiration and some code snippets from [Svelte & Lua Boilerplate](https://github.com/project-error/svelte-lua-boilerplate) by [Project Error](https://github.com/project-error)

### Unsupported [ESX Version](https://github.com/reyyghi/ps-hud) made by [reyyghi](https://github.com/reyyghi)

#### Copyright © 2022 Project Sloth.
