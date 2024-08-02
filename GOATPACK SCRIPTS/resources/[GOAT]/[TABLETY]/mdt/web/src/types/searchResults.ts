export interface CitizenData {
    firstname: string,
    lastname: string,
    dateofbirth: string,
    identifier: string,
    sex: string,
    job: {
        name: string,
        grade: number,
        grade_label: string,
        label: string
    },
    licenses: string[],
    // TO DO REST
}

export interface VehicleData {
    plate: string,
    owner: string,
    ownerIdentifier: string,
    model: string
}