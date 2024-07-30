export interface TariffT {
    label: string,
    data: {
        label: string,
        fine: number,
        jail: number
    }[]
}