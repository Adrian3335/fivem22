import {atom, useAtom, useAtomValue, useSetAtom} from "jotai"

interface UnitsAndVehiclesT {
    units: string[],
    vehicles: string[]
}

const unitsAndVehicles = atom<UnitsAndVehiclesT>({
    units: [],
    vehicles: []
})

export const useUnitsAndVehiclesState = () => useAtomValue(unitsAndVehicles)
export const useUnitsAndVehicles = () => useAtom(unitsAndVehicles)
export const useSetUnitsAndVehicles = () => useSetAtom(unitsAndVehicles)