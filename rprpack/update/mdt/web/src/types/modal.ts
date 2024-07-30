export interface DoubleModalT {
    label: string,
    onSubmit: (arg1: string, arg2: string) => void,
    onCancel: () => void,
    firstPlaceholder: string,
    secondPlaceholder: string,
    submitLabel: string
}

export interface SingleModalT {
    label: string,
    onSubmit: (arg1: string) => void,
    onCancel: () => void,
    placeholder: string,
    submitLabel: string
}

export interface DeleteModalT {
    label: string,
    text: string,
    onSubmit: (arg1: any) => void,
    onCancel: () => void,
    submitLabel: string,
    cancelLabel: string,
    extraData?: any
}