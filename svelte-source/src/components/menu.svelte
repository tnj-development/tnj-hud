<script lang="ts">
  import { draggable } from '@neodrag/svelte';
  import { faSliders, faCircleNotch } from '@fortawesome/free-solid-svg-icons'
  import Fa from 'svelte-fa'
  import { i18n } from '../utils/i18n';

  import MenuStore from '../stores/menuStore';

  import HudPanel from './menu/hudPanel.svelte';
  import StatusIconsPanel from './menu/statusIconsPanel.svelte';

  let menuHandle;
  const screenWidth: number = screen.width;
  const screenHeight: number = screen.height;

  let tabArray: Array<{name: string, icon: any, content: any, adminOnly: boolean}> = [
    { name: $i18n.hudSettings, icon: faSliders,     content: HudPanel, adminOnly: false },
    { name: $i18n.statusIcons, icon: faCircleNotch, content: StatusIconsPanel, adminOnly: true },
  ];
  let activeTab: {name: string, icon: any, content: any} = tabArray[0];

  function handleTabClick(index: number) {
    activeTab = tabArray[index];
  }
</script>

<section style="display: {$MenuStore.show ? 'flex' : 'none'};" class="w-[60vw] h-[60vh] flex-col bg-[#171717] rounded-t-2xl shadow-lg text-white"
  use:draggable={{ handle: menuHandle, bounds: 'body', gpuAcceleration: false, defaultPosition: {x: screenWidth/5, y:screenHeight/5} }}>

  <div class="drag-bar bg-dark-900 rounded-t-2xl" bind:this={menuHandle}>
    <svg role="img" aria-label="drag handle" viewBox="0 0 24 24" height=24 width=24 class="mx-auto">
      <path
        fill="white"
        d="M3,15V13H5V15H3M3,11V9H5V11H3M7,15V13H9V15H7M7,11V9H9V11H7M11,15V13H13V15H11M11,11V9H13V11H11M15,15V13H17V15H15M15,11V9H17V11H15M19,15V13H21V15H19M19,11V9H21V11H19Z"
      />
    </svg>
  </div>
  <div class="flex font-semibold" style="height: calc(100% - 24px);">
    <div class="flex flex-col w-1/6 bg-[#1e1e1e]">
      <!-- Tab item List -->
      {#each tabArray as tab, i}
        {#if !tab.adminOnly || !$MenuStore.adminOnly || ($MenuStore.adminOnly && $MenuStore.isAdmin) }
          <div class="bg-[#171717] px-4 py-4 flex flex-row gap-3 cursor-pointer select-none" on:click={() => handleTabClick(i)}>
            <Fa icon={tab.icon} translateY={0.27}/>
            <span>{tab.name}</span>
          </div>
        {/if}
      {/each}
    </div>
    <!-- Tab Window List -->
    {#each tabArray as tab}
      {#if !tab.adminOnly || !$MenuStore.adminOnly || ($MenuStore.adminOnly && $MenuStore.isAdmin) }
        <div style="display: {activeTab.name == tab.name ? 'flex' : 'none'};" class="flex-col w-5/6 px-5 overflow-y-scroll bg-[#171717]">
          <svelte:component this={tab.content}/>
        </div>
      {/if}
    {/each}
  </div>
</section>

<style>
  .drag-bar {
    user-select: none;
    cursor: grab;
	}
  .drag-bar:active {
    cursor: grabbing;
  }
	.drag-bar svg {
		opacity: 0.2;
		transition: opacity 0.2s;
	}
	.drag-bar:hover svg {
		opacity: 1;
	}
</style>