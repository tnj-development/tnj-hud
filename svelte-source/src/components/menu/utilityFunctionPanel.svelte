<script lang="ts">
  import Button from '../atoms/button.svelte';
  import Panel from '../atoms/panel.svelte';
  import { faScrewdriverWrench } from '@fortawesome/free-solid-svg-icons';
  import ColorEffectStore from '../../stores/colorEffectStore';
  import { i18n } from '../../utils/i18n';

  export let group: string = "";
</script>


<Panel name={$i18n.utilityFunctions} icon={faScrewdriverWrench} color={"white"} bind:group>
  <div class="flex flex-row mx-4">
    <Button name={$i18n.copyProgressColorsToIconsColors} buttonClass={"h-15 w-55"}
      on:click={() => {ColorEffectStore.updateIconColorToProgressColor()}}
    />
  </div>
</Panel>
<hr>