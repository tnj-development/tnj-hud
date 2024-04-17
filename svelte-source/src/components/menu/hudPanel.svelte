<script lang="ts">
  import Button from '../atoms/button.svelte'
  import Checkbox from '../atoms/checkbox.svelte'
  import PSLogo from '../atoms/ps-logo.svelte'
  import Switch from '../atoms/switch.svelte'
  import MenuStore from '../../stores/menuStore';
  import { fetchNui } from '../../utils/eventHandler';
  import PlayerHudStore from '../../stores/playerStatusHudStore';
  import { absoluteMapDimensions } from '../../types/types';
  import { i18n } from '../../utils/i18n';

  function handleIsToggleMapShapeChecked(checked: boolean) {
    let shape: "circle" | "square" = checked ? "circle": "square";
    $MenuStore.isToggleMapShapeChecked = shape;
    fetchNui("ToggleMapShape", {shape: shape})
  }
</script>

<div class="text-sm flex flex-col text-[#e8e8e8]">
  <div class="mx-4 mb-5 mt-3">
    <div class="float-right w-[25%]">
      <PSLogo />
    </div>
    <div class="-mx-4 mb-4 text-2xl text-white">
      <p>{$i18n.resetHud}</p>
    </div>

    <Button name="{$i18n.resetHud}" buttonClass="whitespace-nowrap hover:bg-red-600" disable={$MenuStore.isRestarting} disableText={$i18n.resettingHud}
      on:click={() => {fetchNui("restartHud"); $MenuStore.isRestarting = true;}}
    />
    <p class="text-base">{$i18n.resetHudDescription}</p>

    <Button name="{$i18n.resetSettings}" buttonClass="hover:bg-red-600"
      on:click={() => {
        MenuStore.resetHudMenuSetting();
        // Send updated menu settings to client lua
        MenuStore.sendMenuSettingsToClient();
    }}/>
    <p class="text-base">{$i18n.resetSettingsDescriptionLine1}</p>
    <p class="text-base">{$i18n.resetSettingsDescriptionLine2}</p>
  </div>

  <hr>

  <div class="my-3 text-xl text-white">
    <p>{$i18n.optionsMenu}</p>
  </div>
  <div class="mx-4 mb-4 flex flex-col">
    <Checkbox bind:checked={$MenuStore.isOutMapChecked}
      primaryText={$i18n.minimapVehicleCheckBoxPrimary}
      secondaryText={$i18n.minimapVehicleCheckBoxSecondary}
      handleUpdateFunction={(checked) => fetchNui("showOutMap", {checked})}
    />
    <Checkbox bind:checked={$MenuStore.isOutCompassChecked}
      primaryText={$i18n.compassVehicleCheckBoxPrimary}
      secondaryText={$i18n.compassFollowCheckBoxSecondary}
      handleUpdateFunction={(checked) => fetchNui("showOutCompass", {checked})}
    />
    <Checkbox bind:checked={$MenuStore.isCompassFollowChecked}
      primaryText={$i18n.compassFollowCheckBoxPrimary}
      secondaryText={$i18n.compassFollowCheckBoxSecondary}
      handleUpdateFunction={(checked) => fetchNui("showFollowCompass", {checked})}
    />
  </div>

  <hr>

  <div class="my-3 text-xl text-white">
    <p>{$i18n.notificationsMenu}</p>
  </div>

  <div class="mx-4 mb-4 flex flex-col">
    <Checkbox bind:checked={$MenuStore.isOpenMenuSoundsChecked}
      primaryText={$i18n.menuSoundEffectsEnabled} handleUpdateFunction={(checked) => fetchNui("openMenuSounds", {checked})}
    />
    <Checkbox bind:checked={$MenuStore.isResetSoundsChecked}
      primaryText={$i18n.resetSoundEffectsEnabled} handleUpdateFunction={(checked) => fetchNui("resetHudSounds", {checked})}
    />
    <Checkbox bind:checked={$MenuStore.isListSoundsChecked}
      primaryText={$i18n.guiSoundEffectsEnabled} handleUpdateFunction={(checked) => fetchNui("checklistSounds", {checked})}
    />
    <Checkbox bind:checked={$MenuStore.isMapNotifyChecked}
      primaryText={$i18n.mapNotificationsEnabled} handleUpdateFunction={(checked) => fetchNui("showMapNotif", {checked})}
    />
    <Checkbox bind:checked={$MenuStore.isLowFuelAlertChecked}
      primaryText={$i18n.lowFuelNotificationsEnabled} handleUpdateFunction={(checked) => fetchNui("showFuelAlert", {checked})}
    />
    <Checkbox bind:checked={$MenuStore.isCinematicNotifyChecked}
      primaryText={$i18n.cinematicModeNotificationEnabled} handleUpdateFunction={(checked) => fetchNui("showCinematicNotif", {checked})}
    />
  </div>

  <hr>

  <div class="my-3 text-xl text-white">
    <p>{$i18n.statusMenu}</p>
  </div>
  <div class="mx-4 mb-4 flex flex-col">
    <Checkbox bind:checked={$PlayerHudStore.dynamicIcons.health}
      primaryText={$i18n.showHealthAlways}
      handleUpdateFunction={(checked) => {
        PlayerHudStore.updateShowingDynamicIcon("health", checked);
        fetchNui("dynamicChange");
      }}
    />
    <Checkbox bind:checked={$PlayerHudStore.dynamicIcons.armor}
      primaryText={$i18n.showArmorAlways}
      handleUpdateFunction={(checked) => {
        PlayerHudStore.updateShowingDynamicIcon("armor", checked);
        fetchNui("dynamicChange");
      }}
    />
    <Checkbox bind:checked={$PlayerHudStore.dynamicIcons.hunger}
      primaryText={$i18n.showHungerAlways}
      handleUpdateFunction={(checked) => {
        PlayerHudStore.updateShowingDynamicIcon("hunger", checked);
        fetchNui("dynamicChange");
      }}
    />
    <Checkbox bind:checked={$PlayerHudStore.dynamicIcons.thirst}
      primaryText={$i18n.showThirstAlways}
      handleUpdateFunction={(checked) => {
        PlayerHudStore.updateShowingDynamicIcon("thirst", checked);
        fetchNui("dynamicChange");
      }}
    />
    <Checkbox bind:checked={$PlayerHudStore.dynamicIcons.stress}
      primaryText={$i18n.showStressAlways}
      handleUpdateFunction={(checked) => {
        PlayerHudStore.updateShowingDynamicIcon("stress", checked);
        fetchNui("dynamicChange");
      }}
    />
    <Checkbox bind:checked={$PlayerHudStore.dynamicIcons.oxygen}
      primaryText={$i18n.showOxygenAlways}
      handleUpdateFunction={(checked) => {
        PlayerHudStore.updateShowingDynamicIcon("oxygen", checked);
        fetchNui("dynamicChange");
      }}
    />
  </div>

  <hr>

  <div class="my-3 text-xl text-white">
    <p>{$i18n.vehicleMenu}</p>
  </div>
  <div class="mx-4 mb-4 flex flex-col">
    <Switch checked={$MenuStore.isToggleMapShapeChecked == "circle"} checkedText={$i18n.minimapTypeCircle} unCheckedText={$i18n.minimapTypeSquare}
      handleUpdateFunction={(checked) => handleIsToggleMapShapeChecked(checked)}
    />
    <p class="font-semibold text-base pb-2">
      {$i18n.minimapTypeDescription}
    </p>

    <Checkbox bind:checked={$MenuStore.isMapEnabledChecked}
      primaryText={$i18n.minimapEnabled} handleUpdateFunction={(checked) => fetchNui("HideMap", {checked})}
    />
    <Checkbox bind:checked={$MenuStore.isToggleMapBordersChecked}
      primaryText={$i18n.minimapBordersEnabled} handleUpdateFunction={(checked) => fetchNui("ToggleMapBorders", {checked})}
    />
    <Checkbox bind:checked={$PlayerHudStore.dynamicIcons.engine}
      primaryText={$i18n.showEngineAlways}
      handleUpdateFunction={(checked) => {
        PlayerHudStore.updateShowingDynamicIcon("engine", checked);
        fetchNui("dynamicChange");
      }}
    />
    <Checkbox bind:checked={$PlayerHudStore.dynamicIcons.nitro}
      primaryText={$i18n.showNitroAlways}
      handleUpdateFunction={(checked) => {
        PlayerHudStore.updateShowingDynamicIcon("nitro", checked);
        fetchNui("dynamicChange");
      }}
    />
  </div>

  <hr>

  <div class="my-3 text-xl text-white">
    <p>{$i18n.compassMenu}</p>
  </div>
  <div class="mx-4 mb-4 flex flex-col">
    <Checkbox bind:checked={$MenuStore.isShowCompassChecked}
      primaryText={$i18n.compassEnabled} handleUpdateFunction={(checked) => fetchNui("showCompassBase", {checked})}
      secondaryText={$i18n.compassEnabledDescription}
    />
    <Checkbox bind:checked={$MenuStore.isShowStreetsChecked}
      primaryText={$i18n.showStreetNamesEnabled} handleUpdateFunction={(checked) => fetchNui("showStreetsNames", {checked})}
      secondaryText={$i18n.showStreetNamesDescription}
    />
    <Checkbox bind:checked={$MenuStore.isPointerShowChecked}
      primaryText={$i18n.showCompassPointerEnabled} handleUpdateFunction={(checked) => fetchNui("showPointerIndex", {checked})}
      secondaryText={$i18n.showCompassPointerDescription}
    />
  </div>

  <hr>

  <div class="my-3 text-xl text-white">
    <p>{$i18n.cinematicMenu}</p>
  </div>
  <div class="mx-4 mb-4 flex flex-row gap-5">
    <Checkbox bind:checked={$MenuStore.isCineamticModeChecked}
      primaryText={$i18n.showCinematicBarsEnabled} handleUpdateFunction={(checked) => fetchNui("cinematicMode", {checked})}
    />
    <p class="self-center ml-auto opacity-05 select-none">{ String.fromCharCode(...absoluteMapDimensions)}</p>
  </div>
</div>

<style>
  p {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }
</style>