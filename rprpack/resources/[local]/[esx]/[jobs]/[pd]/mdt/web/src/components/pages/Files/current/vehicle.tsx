import React, { useState } from "react";
import { fetchNui } from "../../../../utils/fetchNui";
import SingleModal from "../../../Modals/SingleModal";
import DeleteModal from "../../../Modals/DeleteModal";
import TitleBlock from "../../../TitleBlock";
import "./vehicle.scss"

const VehicleData: React.FC<{data: any, refresh: () => void}> = ({data, refresh}) => {

    const [modal, setModal] = useState<boolean>(false)
    const [deleteModal, setDeleteModal] = useState<boolean>(false)
    const [clickedNote, setClickedNote] = useState<any>(null)

    const onSubmit = async (note: string) => {
        setModal(false)
        await fetchNui("addVehicleNote", {plate: data.plate, note: note})
        refresh()
    }

    const onCancel = () => {
        setModal(false)
    }

    const deleteNote = async (n: any) => {
        setClickedNote(null)
        setDeleteModal(false)
        if (!n) return;
        await fetchNui('deleteVehicleNote', {plate: data.plate, id: n})
        setTimeout(() => {
            refresh()
        }, 500)
    }


    return (
        <>
            {modal && <SingleModal label="Dodaj notatkę" onSubmit={onSubmit} onCancel={onCancel} placeholder="Treść notatki..." submitLabel="Dodaj notatkę" />}
            {deleteModal && <DeleteModal label="Usuwanie notatki" onSubmit={deleteNote} onCancel={() => {setDeleteModal(false); setClickedNote(null)}} text="Czy na pewno chcesz usunąć notatkę?" submitLabel="Usuń" cancelLabel="Anuluj" extraData={clickedNote}/>}
            <TitleBlock text={"Pojazd"}/>
            <div className="info-container">
                <div>
                    <div className="top">
                        <div style={{width: "219px"}}>
                            Model
                        </div>
                        <div style={{width: "168px"}}>
                            Rejestracja
                        </div>
                        <div style={{width: "158px"}}>
                            Właściciel
                        </div>
                        <div style={{width: "158px"}}>
                            Współwłaściciel
                        </div>
                    </div>
                    <div className="bottom">
                        <div style={{width: "219px"}}>
                            {data.model}
                        </div>
                        <div style={{width: "168px"}}>
                            {data.plate}
                        </div>
                        <div style={{width: "158px"}}>
                            {data.owner.firstname} {data.owner.lastname}
                        </div>
                        <div style={{width: "158px"}}>
                            {data.subowner ? (data.subowner.firstname + " " + data.subowner.lastname) : "-"}
                        </div>
                    </div>
                </div>
            </div>
            <div className="vehicle-notes">
                <div className="container">
                    <div className="vehicle-notes-header">
                        <span style={{width: "104px"}}>
                            Data
                        </span>
                        <span style={{width: "488px"}}>
                            Notatka
                        </span>
                        <span style={{width: "111px"}}>
                            Wydane przez
                        </span>
                    </div>

                    <div className="vehicle-notes-results">
                        <table>
                            {data.notes.map((value: any, index: number) => (
                                <tr key={index} className="vehicle-notes-row" onClick={() => {setDeleteModal(true); setClickedNote(value.id)}}>
                                    <td style={{width: "104px"}}>
                                        <span>{new Date(value.time * 1000).toLocaleDateString()}</span>
                                    </td>
                                    <td style={{width: "488px"}}>
                                        <span>{value.note}</span>
                                    </td>
                                    <td style={{width: "111px"}}>
                                        <span>{value.officer}</span>
                                    </td>
                                </tr>
                            ))}
                        </table>
                    </div>

                    <div className="buttons">
                        <div className="btn" onClick={() => setModal(true)}>
                            Dodaj notatkę
                        </div>
                    </div>

                </div>
            </div>
        </>
    )
}

export default VehicleData