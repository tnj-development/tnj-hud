import { onMount, onDestroy } from "svelte";
import { get } from "svelte/store";
import CompassHudStore from "../stores/compassHudStore";
import MenuStore from "../stores/menuStore";
import MoneyHudStore from "../stores/moneyHudStore";
import PlayerHudStore from "../stores/playerStatusHudStore";
import ExternalStatusStore from "../stores/externalStatusStore";
import LayoutStore from "../stores/layoutStore";
import VehicleHudStore from "../stores/vehicleHudStore";
import ColorEffectStore from "../stores/colorEffectStore";
import ProfileStore from "../stores/profileStore";
import { initI18n } from './i18n';
import {
  colorStoreLocalStorageName,
  playerStoreLocalStorageName,
  layoutStoreLocalStorageName,
  profileLocalStorageName,
} from "../types/types";

interface nuiMessage {
  data: {
    action: string;
    topic?: string;
    [key: string]: any;
  };
}

export function EventHandler() {
  function mainEvent(event: nuiMessage) {
    switch (event.data.action) {
      case "baseplate":
        switch (event.data.topic) {
          case "compassupdate":
            CompassHudStore.receiveCompassMessage(event.data as any);
            break;
          case "opencompass":
            CompassHudStore.receiveCompassOpenMessage(event.data as any);
            break;
          case "closecompass":
            CompassHudStore.receiveCompassCloseMessage(event.data as any);
            break;
        }
        break;
      case "car":
        switch (event.data.topic) {
          case "display":
            VehicleHudStore.receiveShowMessage(event.data as any);
            break;
          case "status":
            VehicleHudStore.receiveUpdateMessage(event.data as any);
            break;
        }
        break;
      case "externalstatus":
        switch (event.data.topic) {
          case "buff":
            ExternalStatusStore.receiveBuffStatusMessage(event.data as any);
            break;
          case "enhancement":
            ExternalStatusStore.receiveEnhancementStatusMessage(
              event.data as any
            );
            break;
        }
        break;
      case "hudtick":
        switch (event.data.topic) {
          case "display":
            PlayerHudStore.receiveShowMessage(event.data as any);
            break;
          case "status":
            PlayerHudStore.receiveStatusUpdateMessage(event.data as any);
            break;
          default:
            PlayerHudStore.receiveStatusUpdateMessage(event.data as any);
            break;
        }
        break;
      case "menu":
        switch (event.data.topic) {
          case "adminonly":
            MenuStore.receiveAdminMessage(event.data as any);
            break;
          case "restart":
            MenuStore.receiveRestartMessage();
            break;
        }
        break;
      case "open":
        MenuStore.receiveMessage();
        break;
      case "show":
        MoneyHudStore.receiveShowAccountsMessage(event.data as any);
        break;
      case "showconstant":
        MoneyHudStore.receiveShowConstantMessage(event.data as any);
        break;
      case "update":
        CompassHudStore.receiveHeadingMessage(event.data as any);
        break;
      case "updatemoney":
        MoneyHudStore.receiveUpdateMessage(event.data as any);
        break;
      case "updateUISettings":
        if (!event.data.icons || !event.data.layout || !event.data.colors) {
          return;
        }
        PlayerHudStore.receiveUIUpdateMessage(event.data.icons);
        LayoutStore.receiveUIUpdateMessage(event.data.layout);
        ColorEffectStore.receiveUIUpdateMessage(event.data.colors);
        break;
      case "setLang":
        initI18n(event.data.lang);
        break;
    }
  }

  onMount(() => window.addEventListener("message", mainEvent));
  onDestroy(() => window.removeEventListener("message", mainEvent));
}

export async function fetchNui(eventName: string, data: unknown = {}) {
  const options = {
    method: "post",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify(data),
  };

  const resourceName = "ps-hud";

  try {
    const resp = await fetch(`https://${resourceName}/${eventName}`, options);
    return await resp.json();
  } catch (err) {}
}

function serializeIconData(iconData) {
  let result = {};
  for (const [key, value] of Object.entries(iconData)) {
    let newObject = (({ icon, isShowing, name, progressValue, ...o }) => o)(
      value as any
    );
    result[key] = newObject;
  }
  return result;
}

function serializeColorData(colorData) {
  let result = {};
  for (const [key, value] of Object.entries(colorData)) {
    let newObject = (({ currentEffect, editableColors, ...o }) => o)(
      value as any
    );
    result[key] = newObject;
  }
  return result;
}

export function saveUIDataToServer() {
  const playerStatusIcondata = get(PlayerHudStore);
  const colorData = get(ColorEffectStore);
  const layoutdata = get(LayoutStore);
  const serializedIconData = serializeIconData(playerStatusIcondata.icons);
  const serializedColorData = serializeColorData(colorData.icons);
  const sendData = {
    icons: serializedIconData,
    layout: layoutdata,
    colors: serializedColorData,
  };

  fetchNui("saveUISettings", sendData);
}

export async function saveUIDataToLocalStorage() {
  const playerStatusIcondata = get(PlayerHudStore);
  const colorData = get(ColorEffectStore);
  const layoutData = get(LayoutStore);
  const profileData = get(ProfileStore);

  localStorage.setItem(
    colorStoreLocalStorageName,
    JSON.stringify({
      ...colorData.icons,
      globalColorSettings: colorData.globalColorSettings,
    })
  );

  localStorage.setItem(
    playerStoreLocalStorageName,
    JSON.stringify({
      ...playerStatusIcondata.icons,
      globalIconSettings: playerStatusIcondata.globalIconSettings,
      dynamicIcons: playerStatusIcondata.dynamicIcons,
    })
  );

  localStorage.setItem(layoutStoreLocalStorageName, JSON.stringify(layoutData));

  localStorage.setItem(
    profileLocalStorageName,
    JSON.stringify({ profiles: profileData })
  );
}
