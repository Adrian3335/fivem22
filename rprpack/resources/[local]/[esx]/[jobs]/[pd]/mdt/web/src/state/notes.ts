import { atom, useAtom, useAtomValue, useSetAtom } from "jotai";

import { Annoucement } from "../types/annoucements";

const notes = atom<Annoucement[]>([])

export const useNotesState = () => useAtomValue(notes)
export const useNotes = () => useAtom(notes)
export const useSetNotes = () => useSetAtom(notes)