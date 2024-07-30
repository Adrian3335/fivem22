import {atom, useAtom, useAtomValue, useSetAtom} from "jotai";

import { TariffT } from "../types/tariff";

const tariff = atom<TariffT[] | null>(null)

export const useTariffState = () => useAtomValue(tariff)
export const useTariff = () => useAtom(tariff)
export const useSetTariff = () => useSetAtom(tariff)