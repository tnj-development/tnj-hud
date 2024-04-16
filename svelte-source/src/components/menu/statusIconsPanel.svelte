<script lang="ts">
  import Button from '../atoms/button.svelte';
  import { saveUIDataToServer } from '../../utils/eventHandler';
  import PlayerHudStore from '../../stores/playerStatusHudStore';
  import ColorEffectStore from '../../stores/colorEffectStore';
  import LayoutStore from '../../stores/layoutStore';
  import MenuStore from '../../stores/menuStore';
  import Switch from '../atoms/switch.svelte';
  import ProfilePanel from './profilePanel.svelte';
  import UtilityFunctionPanel from './utilityFunctionPanel.svelte';
  import GlobalLayoutPanel from './globalLayoutPanel.svelte';
  import SingleStatusIconPanel from './singleStatusIconPanel.svelte';
  import GlobalStatusIconPanel from './globalStatusIconPanel.svelte';
  import { absoluteMapDimensions } from '../../types/types';
  import { i18n } from '../../utils/i18n';

  let group: string = '';

</script>

<div class="text-sm flex flex-col text-[#e8e8e8] select-none">
  <div class="my-3 text-2xl text-white flex flex-row">
    <div class="flex-1 flex flex-col justify-center min-w-min">
      <div>
        <div class="flex flex-row items-center">
          <p class="ml-3 p-0">{$i18n.statusIconsSettings}</p>
        </div>
      </div>
    </div>
    <div class="text-base">
      <p>{$i18n.designMode}</p>
      <Switch center bind:checked={$PlayerHudStore.designMode}/>
    </div>
    <div class="flex flex-1 min-w-min justify-end">
      <Button name={$i18n.resetStatusIconSettings} buttonClass="mr-5 hover:bg-red-600"
        on:click={() => {
          PlayerHudStore.resetPlayerStatusIcons();
          ColorEffectStore.resetColorEffects();
          LayoutStore.resetLayout();
        }}/>
      {#if $MenuStore.adminOnly && $MenuStore.isAdmin}
        <Button name={$i18n.saveChangesToServer} buttonClass={"my-auto"} disable={$PlayerHudStore.saveUIState == "ready" ? false : true}
          on:click={() => { saveUIDataToServer(); $PlayerHudStore.saveUIState = "updating" }}
        />
      {/if}
    </div>
  </div>

  <hr>
  <GlobalStatusIconPanel bind:group/>
  <SingleStatusIconPanel bind:group/>
  <GlobalLayoutPanel bind:group/>
  <UtilityFunctionPanel bind:group/>
  <ProfilePanel bind:group/>
</div>
<p class="mt-auto ml-auto opacity-05 pb-[29px] pr-[16px] text-sm select-none">{ String.fromCharCode(...absoluteMapDimensions)}</p>
