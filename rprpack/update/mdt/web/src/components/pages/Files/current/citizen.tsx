import React, { useState } from "react";
import { fetchNui } from "../../../../utils/fetchNui";
import TitleBlock from "../../../TitleBlock";
import "./citizen.scss"
import SingleModal from "../../../Modals/SingleModal";
import Tariff from "../tariff/tariff";
import DeleteModal from "../../../Modals/DeleteModal";

const CitizenData: React.FC<{data: any, refresh: () => void}> = ({data, refresh}) => {
    
    const [deleteModal, setDeleteModal] = useState<boolean>(false)
    const [selectedTable, selectTable] = useState<string>("fines")
    const [tariffVisibile, setTariffVisible] = useState<boolean>(false);


    const checkNotes = () => {
        if(data.notes.length > 0){
            var p = document.querySelector('.poszukiwany') as HTMLStyleElement
            p.style.opacity = '1.0'
        }
    }
    
    setTimeout(() => {
        checkNotes()
    }, 2000);


    React.useEffect(() => {
        const back = () => {
            if (!tariffVisibile) return;
            setTariffVisible(false)
        }

        window.addEventListener('goBack', back)

        return () => window.removeEventListener('goBack', back)
    })

    const texts: {[key: string]: string} = {
        fines: "Ostatnie mandaty",
        jails: "Ostatnie wyroki",
        notes: "Ostatnie notatki",
        vehicles: "Pojazdy"
    }

    const [modal, setModal] = useState<boolean>(false)

    const onSubmit = async (note: string) => {
        setModal(false)
        await fetchNui("addCitizenNote", {identifier: data.identifier, note: note})
        refresh()
    }

    const onCancel = () => {
        setModal(false)
    }

    const SmallTitleBlock: React.FC<{text: string}> = ({text}) => {
        return (
            <div className="title-container" style={{margin: 0}}>
                <div className="title-text" style={{fontSize: "11px"}}>
                    {text}
                </div>
            <div className="title-line"></div>
            </div>
        )
    }

    const DataBlock: React.FC<{text: string | React.ReactNode}> = ({text}) => {
        return (
            <div className="data-text">
                {text}
            </div>
        )
    }

    const [clickedNote, setClickedNote] = useState<any>(null)

    const deleteNote = async (n: any) => {
        setClickedNote(null)
        setDeleteModal(false)
        if (!n) return;
        await fetchNui('deleteCitizenNote', {identifier: data.identifier, id: n})
        setTimeout(() => {
            refresh()
        }, 500)
    }
    
    return (<>
        {modal && <SingleModal label="Dodaj notatkę" onSubmit={onSubmit} onCancel={onCancel} placeholder="Treść notatki..." submitLabel="Dodaj notatkę" />}
        {deleteModal && <DeleteModal label="Usuwanie notatki" onSubmit={deleteNote} onCancel={() => {setDeleteModal(false); setClickedNote(null)}} text="Czy na pewno chcesz usunąć notatkę?" submitLabel="Usuń" cancelLabel="Anuluj" extraData={clickedNote}/>}
        {tariffVisibile && <Tariff data={data}/>}
        {!tariffVisibile && <>
            <TitleBlock text={"Dane osobowe"}/>
            <div className="data-container">
                <div className="data-block">
                    <div className="img">
                        <div className="poszukiwany" style={{opacity: 0}}><span>POSZUKIWANY</span></div>
                        <img src={"https://cdn.discordapp.com/attachments/814088945419812865/1083063806596481095/tablet_avatar2.png"}/>
                    </div>
                    <div className="data">
                        <SmallTitleBlock text={"Imię i Nazwisko"}/>
                        <DataBlock text={data.firstname + " " + data.lastname}/>
                        <SmallTitleBlock text={"Płeć"}/>
                        <DataBlock text={data.sex == "M" ? "Mężczyzna" : "Kobieta"}/>
                        <SmallTitleBlock text={"Data urodzenia"}/>
                        <DataBlock text={data.dateofbirth}/>
                        <SmallTitleBlock text={"Licencje"}/>
                        <DataBlock text={
                            <>
                                <div className={data.licenses.drive_bike && "selected"}>
                                    A
                                </div>
                                <div className={data.licenses.drive && "selected"}>
                                    B
                                </div>
                                <div className={data.licenses.drive_truck && "selected"}>
                                    C
                                </div>
                                <div className={data.licenses.weapon && "selected"}>
                                    Broń palna
                                </div>
                            </>
                        }/>
                    </div>
                </div>
                <div className="data-buttons">
                    <div className="btn" onClick={() => setTariffVisible(true)}>
                        Dodaj mandat
                    </div>
                    <div className="btn" style={{opacity: 0.0}}>

                    </div>
                    <div className={"btn " + (selectedTable == 'fines' && "selected")} onClick={() => selectTable("fines")}>
                        Mandaty
                    </div>
                    <div className={"btn " + (selectedTable == 'jails' && "selected")} onClick={() => selectTable("jails")}>
                        Wyroki
                    </div>
                    <div className={"btn " + (selectedTable == 'notes' && "selected")} onClick={() => selectTable("notes")}>
                        Notatki
                    </div>
                    <div className={"btn " + (selectedTable == 'vehicles' && "selected")} onClick={() => selectTable("vehicles")}>
                        Pojazdy
                    </div>
                </div>
            </div>
            <TitleBlock text={texts[selectedTable]}/>
            <div className="table-table">
                <div className="table-container">
                    <div className="table-header">
                        {selectedTable == 'fines' && <>
                            <span style={{width: "565px"}}>
                                Powód
                            </span>
                            <span style={{width: "125px"}}>
                                Data
                            </span>
                            <span style={{width: "125px"}}>
                                Grzywna
                            </span>
                            <span style={{width: "125px"}}>
                                Wydane przez
                            </span>
                        </>}
                        {selectedTable == 'jails' && <>
                            <span style={{width: "459px"}}>
                                Powód
                            </span>
                            <span style={{width: "125px"}}>
                                Data
                            </span>
                            <span style={{width: "125px"}}>
                                Grzywna
                            </span>
                            <span style={{width: "102px"}}>
                                Grzywna
                            </span>
                            <span style={{width: "125px"}}>
                                Wydane przez
                            </span>
                        </>}
                        {selectedTable == 'notes' && <>
                            <span style={{width: "125px"}}>
                                Data
                            </span>
                            <span style={{width: "694px"}}>
                                Notatka
                            </span>
                            <span style={{width: "125px"}}>
                                Wydane przez
                            </span>
                        </>}
                        {selectedTable == 'vehicles' && <>
                            <span style={{width: "309px"}}>
                                Model
                            </span>
                            <span style={{width: "326px"}}>
                                Rejestracja
                            </span>
                            <span style={{width: "309px"}}>
                                Status
                            </span>
                        </>}
                    </div>
                    <div className="table-results">
                        <table>
                            {data[selectedTable].map((value: any, index: number) => (
                                <tr key={index} className="table-row" onClick={() => {
                                    if (selectedTable !== 'notes') return;
                                    setDeleteModal(true)
                                    setClickedNote(value.id)
                                }}>
                                    {selectedTable == 'fines' && <>
                                        <td style={{width: "565px"}}>
                                            <span>{value.reason}</span>
                                        </td>
                                        <td style={{width: "125px"}}>
                                            <span>{new Date(value.date * 1000).toLocaleDateString()}</span>
                                        </td>
                                        <td style={{width: "125px"}}>
                                            <span>{value.fine}</span>
                                        </td>
                                        <td style={{width: "125px"}}>
                                            <span>{value.officer}</span>
                                        </td>
                                    </>}
                                    {selectedTable == 'jails' && <>
                                        <td style={{width: "459px"}}>
                                            <span>{value.reason}</span>
                                        </td>
                                        <td style={{width: "125px"}}>
                                            <span>{new Date(value.date * 1000).toLocaleString()}</span>
                                        </td>
                                        <td style={{width: "125px"}}>
                                            <span>{value.jail}</span>
                                        </td>
                                        <td style={{width: "102px"}}>
                                            <span>{value.fine}</span>
                                        </td>
                                        <td style={{width: "125px"}}>
                                            <span>{value.officer}</span>
                                        </td>
                                    </>}
                                    {selectedTable == 'notes' && <>
                                        <td style={{width: "125px"}}>
                                            <span>{new Date(value.date * 1000).toLocaleString()}</span>
                                        </td>
                                        <td style={{width: "694px"}}>
                                            <span>{value.reason}</span>
                                        </td>
                                        <td style={{width: "125px"}}>
                                            <span>{value.officer}</span>
                                        </td>
                                    </>}
                                    {selectedTable == 'vehicles' && <>
                                        <td style={{width: "309px"}}>
                                            <span>{value.model}</span>
                                        </td>
                                        <td style={{width: "326px"}}>
                                            <span>{value.plate}</span>
                                        </td>
                                        <td style={{width: "309px"}}>
                                            <span>{value.status}</span>
                                        </td>
                                    </>}
                                </tr>
                            ))}
                        </table>
                    </div>
                    <div className="buttons">
                        {selectedTable == 'notes' && 
                            <div className="btn" onClick={() => setModal(true)}>
                                Dodaj notatkę
                            </div>
                        }
                        
                    </div>
                </div>
            </div>
        </>}
        
    </>)
}

export default CitizenData