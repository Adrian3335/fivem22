import {atom, useAtom, useAtomValue} from "jotai"
import { PoliceMan } from "../types/police"


const policeList = atom<PoliceMan[]>([])

export const usePoliceListState = () => useAtomValue(policeList)
export const usePoliceList = () => useAtom(policeList)