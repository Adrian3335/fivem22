import { atom, useAtom, useAtomValue, useSetAtom } from "jotai";

import PlayerData from "../types/playerData";

const playerData = atom<PlayerData | null>(null)

export const usePlayerDataState = () => useAtomValue(playerData)
export const usePlayerData = () => useAtom(playerData)
export const useSetPlayerData = () => useSetAtom(playerData)