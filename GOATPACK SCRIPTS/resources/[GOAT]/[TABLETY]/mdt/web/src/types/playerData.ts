interface PlayerData {
    firstname: string,
    lastname: string,
    badge?: string,
    dutyTime: string,
    job: {
        name: string,
        grade: number,
        label: string,
        grade_label: string,
        onDuty: boolean
    }
}

export default PlayerData