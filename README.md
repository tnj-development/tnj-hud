![Project Sloth GitHub Project PS-HUD Banner](https://user-images.githubusercontent.com/91661118/170896135-fead50a0-2a4b-432d-8469-038acfb4f2f3.png)

### ps-hud
Ultra customizable hud featuring a unique and robust settings menu. Change eveything about your experience!

![Project Sloth Buttons 2](https://user-images.githubusercontent.com/91661118/170895968-c4224105-5c87-4947-af94-8e8bd792f566.png)

### Dependancies 
* [ox_lib](https://github.com/overextended/ox_lib)
### Optional:
* [ps-buffs](https://github.com/Project-Sloth/ps-buffs)

### ⚠️Important:
- **Do not rename this resource from ps-hud or you will encounter issues.**
- Locale is now supported. Make sure that your qb-core is update. You can update it [here](https://github.com/qbcore-framework/qb-core).
- **This script is fully open source, it has no obfuscation.** Svelte compiled the js when it gets build and original source code is here [svelte-source](https://github.com/Project-Sloth/ps-hud/tree/main/svelte-source).
- **If the minimap is pulsating or flickering**, make sure if you are using custom maps that you ensure ps-hud BEFORE map resource or if another script use the `SetRadarZoom()` native for disable it there.

<br>
<br>

![Project Sloth GitHub Project PS-HUD Install Banner](https://user-images.githubusercontent.com/91661118/170896809-5c15da71-5dd7-4f46-85c5-892701b1eea8.png)


### Start installing now
We will now provide you with a step-by-step guide for the installation process. Shouldn't take too long and it shouldn't be too confusing either! 


### Step 1:
Go ahead and start by dragging and dropping ps-hud into your designated resources folder.

If you are still lost, Slothy has created a few GIF's to help guide you through all the installation steps.

![chrome_KpjdUnvhgV](https://user-images.githubusercontent.com/91661118/170898348-4d50573f-fd8e-447e-add1-9562a196c7ed.gif)

<br>
<br>

### Admin Only Setting:
If you don't want your community to be able to access the customizability options within the menu; make sure to change **Config.AdminOnly** to **true** instead of **false**. Keep in mind as well, while **true**, the changes you save will override for everyone on the server.

This configuration setting is found in **ps-hud/config.lua** as shown in the GIF below.

![chrome_ZwsidhP73y](https://user-images.githubusercontent.com/91661118/171066080-6bc11bb8-7cde-460b-8d73-bbc329644c83.gif)

<br>
<br>

### QB Install
- Step 1
    - Make sure Config.Framework = 'qb'
- Step 2
    - Head to the fxmanifest and make sure line 18 
        ``` 	--'@qbx_core/modules/playerdata.lua' ```
        <strong><big>IS</big></strong> commented out 

### QBox Install 
- Step 1
    - Make sure Config.Framework = 'qbx'
- Step 2
    -  - Head to the fxmanifest and make sure line 18 
        ``` '@qbx_core/modules/playerdata.lua' ```
        is <strong><big>NOT</big></strong> commented out 


![Project Sloth GitHub Project PS-HUD Features Banner](https://user-images.githubusercontent.com/91661118/170896822-4c6fcf43-94a3-4afd-b651-1eb76244fd8d.png)


#### Some features to mention within this ps-hud:
* Custom icon shapes
* Alter icon size, position and color
* Customize settings for individual icons
* Endless options for icon position and orientation
<br>
<br>

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
