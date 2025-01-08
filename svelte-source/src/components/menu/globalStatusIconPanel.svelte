<script lang="ts">
  import ColorPicker from '../atoms/colorPicker.svelte';
  import NumberInput from '../atoms/numberInput.svelte';
  import Panel from '../atoms/panel.svelte';
  import Select from '../atoms/select.svelte';
  import Switch from '../atoms/switch.svelte';
  import { shapes } from '../../types/types';
  import { faGlobe } from '@fortawesome/free-solid-svg-icons';
  import ColorEffectStore from '../../stores/colorEffectStore';
  import PlayerHudUIStore from '../../stores/playerStatusHudStore';
  import { i18n } from '../../utils/i18n';

  export let group: string = "";
</script>


<Panel name={$i18n.globalStatusIconsSettings} icon={faGlobe} color={"white"} bind:group>
  <div class="flex justify-center mb-8">
    <div class="w-50">
      <p class="text-lg text-center mb-2">Icon Shape</p>
      <Select valuesArray={shapes} value={$PlayerHudUIStore.globalIconSettings.shape}
        handleSelectFunction={(shapeName) => {
          PlayerHudUIStore.updateAllShapes(shapeName);
          ColorEffectStore.updateAllIconShapeEditableColor(shapeName);
        }}
      />
    </div>
  </div>

  <div class="mx-8">
    <p class="text-xl font-bold">{$i18n.globalSizeAndPositionSection}</p>
    <hr class="mb-6">
  </div>

  <div class="mx-4 grid grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-6 items-end">
    <div>
      <p class="text-base text-center mb-2">{$i18n.widthSize}</p>
      <NumberInput min={1} max={200} bind:value={$PlayerHudUIStore.globalIconSettings.width}
        handleUpdateFunction={PlayerHudUIStore.updateAllWidth}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.heightSize}</p>
      <NumberInput min={1} max={200} bind:value={$PlayerHudUIStore.globalIconSettings.height}
        handleUpdateFunction={PlayerHudUIStore.updateAllHeight}
      />
    </div>

    {#if $PlayerHudUIStore.globalIconSettings.ringSize != null}
      <div>
        <p class="text-base text-center mb-2">{$i18n.ringSize}</p>
        <NumberInput min={1} max={25} bind:value={$PlayerHudUIStore.globalIconSettings.ringSize} step={0.5}
          handleUpdateFunction={PlayerHudUIStore.updateAllRingSize}
        />
      </div>
    {/if}

    {#if $PlayerHudUIStore.globalIconSettings.displayOutline != null }
      <div>
        <p class="text-base text-center mb-2">{$i18n.showProgressOutline}</p>
        <Switch center={true} bind:checked={$PlayerHudUIStore.globalIconSettings.displayOutline}
          handleUpdateFunction={(checked) => PlayerHudUIStore.updateAllDisplayOutline(checked)}/>
      </div>
    {/if}

    <div>
      <p class="text-base text-center mb-2">{$i18n.xAxisPosition}</p>
      <NumberInput min={-20} max={20} bind:value={$PlayerHudUIStore.globalIconSettings.translateX} step={0.25}
        handleUpdateFunction={PlayerHudUIStore.updateAllTranslateX}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.yAxisPosition}</p>
      <NumberInput min={-20} max={20} bind:value={$PlayerHudUIStore.globalIconSettings.translateY} step={0.25}
        handleUpdateFunction={PlayerHudUIStore.updateAllTranslateY}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.rotation}</p>
      <NumberInput min={0} max={360} bind:value={$PlayerHudUIStore.globalIconSettings.rotateDegree}
        handleUpdateFunction={PlayerHudUIStore.updateAllRotateDegree}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconXAxisPosition}</p>
      <NumberInput min={-10} max={10} bind:value={$PlayerHudUIStore.globalIconSettings.iconTranslateX} step={0.01}
        handleUpdateFunction={PlayerHudUIStore.updateAllTranslateIconX}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconYAxisPosition}</p>
      <NumberInput min={-10} max={10} bind:value={$PlayerHudUIStore.globalIconSettings.iconTranslateY} step={0.01}
        handleUpdateFunction={PlayerHudUIStore.updateAllTranslateIconY}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconSize}</p>
      <NumberInput min={0} max={3} bind:value={$PlayerHudUIStore.globalIconSettings.iconScaling} step={0.01}
        handleUpdateFunction={PlayerHudUIStore.updateAllIconScale}
      />
    </div>

    {#if $PlayerHudUIStore.globalIconSettings.xAxisRound != null}
    <div>
      <p class="text-base text-center mb-2">{$i18n.xAxisCurve}</p>
      <NumberInput min={0} max={100} bind:value={$PlayerHudUIStore.globalIconSettings.xAxisRound}
        handleUpdateFunction={PlayerHudUIStore.updateAllRoundXAxis}
      />
    </div>
    {/if}

    {#if $PlayerHudUIStore.globalIconSettings.yAxisRound != null}
    <div>
      <p class="text-base text-center mb-2">{$i18n.yAxisCurve}</p>
      <NumberInput min={0} max={100} bind:value={$PlayerHudUIStore.globalIconSettings.yAxisRound}
        handleUpdateFunction={PlayerHudUIStore.updateAllRoundYAxis}
      />
    </div>
    {/if}
  </div>

  <!-- Colors Section -->
  <div class="mx-8 mt-8">
    <p class="text-xl font-bold">{$i18n.globalColorSection}</p>
    <hr>
  </div>

  <div class="mx-4 mt-6 mb-10 grid grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-6">
    <div class="flex flex-col mx-auto">
      <p class="text-base text-center mb-2">{$i18n.progressColor}</p>
      <ColorPicker colorString={$ColorEffectStore.globalColorSettings.progressColor}
        updateFunction={(hexColor) => ColorEffectStore.updateAllDefaultEffectColorSetting("progressColor", hexColor)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.progressContrast}</p>
      <NumberInput min={0} max={300} bind:value={$ColorEffectStore.globalColorSettings.progressContrast}
        handleUpdateFunction={(contrastAmount) => ColorEffectStore.updateAllDefaultEffectColorSetting("progressContrast", contrastAmount)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.progressShadow}</p>
      <NumberInput min={0} max={20} bind:value={$ColorEffectStore.globalColorSettings.progressDropShadowAmount}
        handleUpdateFunction={(dropAmount) => ColorEffectStore.updateAllDefaultEffectColorSetting("progressDropShadowAmount", dropAmount)}
      />
    </div>

    <div class="flex flex-col mx-auto">
      <p class="text-base text-center mb-2">{$i18n.iconColor}</p>
        <ColorPicker colorString={$ColorEffectStore.globalColorSettings.iconColor}
          updateFunction={(hexColor) => ColorEffectStore.updateAllDefaultEffectColorSetting("iconColor", hexColor)}
        />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconContrast}</p>
      <NumberInput min={0} max={300} bind:value={$ColorEffectStore.globalColorSettings.iconContrast}
        handleUpdateFunction={(contrastAmount) => ColorEffectStore.updateAllDefaultEffectColorSetting("iconContrast", contrastAmount)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconShadow}</p>
      <NumberInput min={0} max={20} bind:value={$ColorEffectStore.globalColorSettings.iconDropShadowAmount}
        handleUpdateFunction={(dropAmount) => ColorEffectStore.updateAllDefaultEffectColorSetting("iconDropShadowAmount", dropAmount)}
      />
    </div>

    <div class="flex flex-col mx-auto">
      <p class="text-base text-center mb-2">{$i18n.outlineColor}</p>
      <ColorPicker colorString={$ColorEffectStore.globalColorSettings.outlineColor}
        updateFunction={(hexColor) => ColorEffectStore.updateAllDefaultEffectColorSetting("outlineColor", hexColor)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.outlineContrast}</p>
      <NumberInput min={0} max={300} bind:value={$ColorEffectStore.globalColorSettings.outlineContrast}
        handleUpdateFunction={(contrastAmount) => ColorEffectStore.updateAllDefaultEffectColorSetting("outlineContrast", contrastAmount)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.outlineShadow}</p>
      <NumberInput min={0} max={20} bind:value={$ColorEffectStore.globalColorSettings.outlineDropShadowAmount}
        handleUpdateFunction={(dropAmount) => ColorEffectStore.updateAllDefaultEffectColorSetting("outlineDropShadowAmount", dropAmount)}
      />
    </div>

    {#if $ColorEffectStore.globalColorSettings.editableColors.innerColor}
      <div class="flex flex-col mx-auto">
        <p class="text-base text-center mb-2">{$i18n.innerColor}</p>
          <ColorPicker colorString={$ColorEffectStore.globalColorSettings.innerColor}
            updateFunction={(hexColor) => ColorEffectStore.updateAllDefaultEffectColorSetting("innerColor", hexColor)}
          />
      </div>
    {/if}
  </div>
</Panel>
<hr>