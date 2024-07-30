import { atom, useAtom, useAtomValue } from "jotai";

import { Annoucement } from "../types/annoucements";

const annoucements = atom<Annoucement[]>([])

export const useAnnoucementsState = () => useAtomValue(annoucements)
export const useAnnoucements = () => useAtom(annoucements)