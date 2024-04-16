<script lang="ts">
  import ColorPicker from '../atoms/colorPicker.svelte';
  import NumberInput from '../atoms/numberInput.svelte';
  import Panel from '../atoms/panel.svelte';
  import Select from '../atoms/select.svelte';
  import Switch from '../atoms/switch.svelte';
  import { shapes, iconNamesKind, iconNames } from '../../types/types';
  import ColorEffectStore from '../../stores/colorEffectStore';
  import PlayerHudUIStore from '../../stores/playerStatusHudStore';
  import { i18n } from '../../utils/i18n';

  export let group: string = "";

  let iconIndex: number = 0;
  let iconColors: Array<string> = [
    "#FFFFFF", "rgb(33, 171, 97)", "#326dbf", "#dd6e14", "#1a7cad", "rgb(220, 6, 6)",
    "rgb(138, 168, 189)", "rgb(255, 72, 133)", "rgb(185, 255, 40)", "#3FA554",
    "rgb(182, 72, 255)", "rgb(255, 72, 133)", "#D64763", "rgb(0, 0, 0)"
  ];
  let singleIconName: iconNamesKind = "voice";
  let stageIndex: number = 0;
  let colorArray: Array<any> = $ColorEffectStore.icons[singleIconName].colorEffects;
  let colorStatesArray: Array<string> = colorArray.map(x => x.name);
  let currentState: string = colorStatesArray[stageIndex];

  $: $ColorEffectStore.globalColorSettings.editSingleIconStage = stageIndex;
  $: $ColorEffectStore.globalColorSettings.editSingleIconName = singleIconName;

  $: {
    colorArray = $ColorEffectStore.icons[singleIconName].colorEffects;
    colorStatesArray = colorArray.map(x => x.name);
  }

</script>

<Panel name={$i18n.singleStatusIconSettings} icon={$PlayerHudUIStore.icons[singleIconName].icon} color={iconColors[iconIndex]} bind:group>
  <div class="flex flex-row mb-8 mt-4">
    <div class="flex-1">
      <div class="max-w-50 ml-8">
        <p class="text-lg text-center mb-2">{$i18n.iconStatusToEdit}</p>
        <Select valuesArray={iconNames} value={singleIconName}
          handleSelectFunction={(shapeName) => {
            singleIconName = shapeName;
            iconIndex = iconNames.findIndex((element) => element == shapeName);
            stageIndex = 0;
          }}
        />
      </div>
    </div>
    <div class="w-50">
      <p class="text-lg text-center mb-2">{$i18n.iconShape}</p>
      <Select valuesArray={shapes} bind:value={$PlayerHudUIStore.icons[singleIconName].shape}
        handleSelectFunction={(shapeName) => {
          PlayerHudUIStore.updateIconShape(singleIconName, shapeName);
          ColorEffectStore.updateIconShapeEditableColor(singleIconName, shapeName);
        }}
      />
    </div>
    <div class="flex-1"></div>
  </div>

  <div class="mx-8">
    <p class="text-xl font-bold">{$i18n.singleIconSizeAndPositionSection}</p>
    <hr class="mb-6">
  </div>

  <div class="mx-4 grid grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-6 items-end">
    <div>
      <p class="text-base text-center mb-2">{$i18n.widthSize}</p>
      <NumberInput min={1} max={200} bind:value={$PlayerHudUIStore.icons[singleIconName].width}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "width", val)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.heightSize}</p>
      <NumberInput min={1} max={200} bind:value={$PlayerHudUIStore.icons[singleIconName].height}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "height", val)}
      />
    </div>

    {#if $PlayerHudUIStore.icons[singleIconName].ringSize != null}
      <div>
        <p class="text-base text-center mb-2">{$i18n.ringSize}</p>
        <NumberInput min={1} max={25} bind:value={$PlayerHudUIStore.icons[singleIconName].ringSize} step={0.5}
          handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "ringSize", val)}
        />
      </div>
    {/if}

    {#if $PlayerHudUIStore.icons[singleIconName].displayOutline != null }
      <div>
        <p class="text-base text-center mb-2">{$i18n.showProgressOutline}</p>
        <Switch center={true} bind:checked={$PlayerHudUIStore.icons[singleIconName].displayOutline}
          handleUpdateFunction={(checked) => PlayerHudUIStore.updateIconSetting(singleIconName, "displayOutline", checked)}/>
      </div>
    {/if}

    <div>
      <p class="text-base text-center mb-2">{$i18n.xAxisPosition}</p>
      <NumberInput min={-20} max={20} bind:value={$PlayerHudUIStore.icons[singleIconName].translateX} step={0.25}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "translateX", val)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.yAxisPosition}</p>
      <NumberInput min={-20} max={20} bind:value={$PlayerHudUIStore.icons[singleIconName].translateY} step={0.25}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "translateY", val)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.rotation}</p>
      <NumberInput min={0} max={360} bind:value={$PlayerHudUIStore.icons[singleIconName].rotateDegree}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "rotateDegree", val)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconXAxisPosition}</p>
      <NumberInput min={-10} max={10} bind:value={$PlayerHudUIStore.icons[singleIconName].iconTranslateX} step={0.01}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "iconTranslateX", val)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconYAxisPosition}</p>
      <NumberInput min={-10} max={10} bind:value={$PlayerHudUIStore.icons[singleIconName].iconTranslateY} step={0.01}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "iconTranslateY", val)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconSize}</p>
      <NumberInput min={0} max={3} bind:value={$PlayerHudUIStore.icons[singleIconName].iconScaling} step={0.01}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "iconScaling", val)}
      />
    </div>

    {#if $PlayerHudUIStore.icons[singleIconName].xAxisRound != null}
    <div>
      <p class="text-base text-center mb-2">{$i18n.xAxisCurve}</p>
      <NumberInput min={0} max={100} bind:value={$PlayerHudUIStore.icons[singleIconName].xAxisRound}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "xAxisRound", val)}
      />
    </div>
    {/if}

    {#if $PlayerHudUIStore.icons[singleIconName].yAxisRound != null}
    <div>
      <p class="text-base text-center mb-2">{$i18n.yAxisCurve}</p>
      <NumberInput min={0} max={100} bind:value={$PlayerHudUIStore.icons[singleIconName].yAxisRound}
        handleUpdateFunction={(val) => PlayerHudUIStore.updateIconSetting(singleIconName, "yAxisRound", val)}
      />
    </div>
    {/if}
  </div>

  <!-- Colors Section -->
  <div class="mx-8 mt-8">
    <p class="text-xl font-bold">{$i18n.singleIconColorSection}</p>
    <hr>
  </div>

  {#if colorArray.length > 1}
    <div class="flex flex-row justify-center mt-4">
      <div class="w-50">
        <p class="text-lg text-center mb-2">{$i18n.iconState}</p>
        <Select valuesArray={colorStatesArray} bind:value={currentState} bind:selectedIndex={stageIndex}/>
      </div>
    </div>
  {/if}

  <div class="mx-4 mt-6 mb-10 grid grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-6">

    <div class="flex flex-col mx-auto">
      <p class="text-base text-center mb-2">{$i18n.progressColor}</p>
      <ColorPicker colorString={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].progressColor}
        updateFunction={(hexColor) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "progressColor", hexColor)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.progressContrast}</p>
      <NumberInput min={0} max={300} bind:value={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].progressContrast}
        handleUpdateFunction={(contrastAmount) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "progressContrast", contrastAmount)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.progressShadow}</p>
      <NumberInput min={0} max={20} bind:value={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].progressDropShadowAmount}
        handleUpdateFunction={(dropAmount) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "progressDropShadowAmount", dropAmount)}
      />
    </div>

    <div class="flex flex-col mx-auto">
      <p class="text-base text-center mb-2">{$i18n.iconColor}</p>
        <ColorPicker colorString={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].iconColor}
          updateFunction={(hexColor) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "iconColor", hexColor)}
        />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconContrast}</p>
      <NumberInput min={0} max={300} bind:value={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].iconContrast}
        handleUpdateFunction={(contrastAmount) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "iconContrast", contrastAmount)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.iconShadow}</p>
      <NumberInput min={0} max={20} bind:value={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].iconDropShadowAmount}
        handleUpdateFunction={(dropAmount) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "iconDropShadowAmount", dropAmount)}
      />
    </div>

    <div class="flex flex-col mx-auto">
      <p class="text-base text-center mb-2">{$i18n.outlineColor}</p>
      <ColorPicker colorString={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].outlineColor}
        updateFunction={(hexColor) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "outlineColor", hexColor)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.outlineContrast}</p>
      <NumberInput min={0} max={300} bind:value={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].outlineContrast}
        handleUpdateFunction={(contrastAmount) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "outlineContrast", contrastAmount)}
      />
    </div>
    <div>
      <p class="text-base text-center mb-2">{$i18n.outlineShadow}</p>
      <NumberInput min={0} max={20} bind:value={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].outlineDropShadowAmount}
        handleUpdateFunction={(dropAmount) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "outlineDropShadowAmount", dropAmount)}
      />
    </div>

    {#if $ColorEffectStore.icons[singleIconName].editableColors.innerColor}
      <div class="flex flex-col mx-auto">
        <p class="text-base text-center mb-2">{$i18n.innerColor}</p>
          <ColorPicker colorString={$ColorEffectStore.icons[singleIconName].colorEffects[stageIndex].innerColor}
            updateFunction={(hexColor) => ColorEffectStore.updateColorSetting(singleIconName, stageIndex, "innerColor", hexColor)}
          />
      </div>
    {/if}
  </div>
</Panel>
<hr>