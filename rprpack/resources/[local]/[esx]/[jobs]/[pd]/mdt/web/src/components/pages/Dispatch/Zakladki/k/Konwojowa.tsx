import React, { useState } from "react";
import "./Konwojowa.scss"
import "../../../../Modals/Modal.scss"
import TitleBlock from "../../../../TitleBlock";
import { useNuiEvent } from "../../../../../hooks/useNuiEvent";
import { usePoliceListState } from "../../../../../state/policeList";
import { debugData } from "../../../../../utils/debugData";
import { usePlayerDataState } from "../../../../../state/playerData";
import { fetchNui } from "../../../../../utils/fetchNui";
import { faAdd, faRotateRight, faX } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import SingleModal from "../../../../Modals/SingleModal";
import ConfirmModal from "../../../../Modals/ConfirmModal";
import { useUnitsAndVehiclesState } from "../../../../../state/unitsAndVehicles";

interface Officer {
    id: string;
    name: string;
}
interface Patrol {
    status: string,
    vehicle: string,
    unit: string,
    officers: Officer[]
}

interface Status {
    sv: string
}

interface zatrzymaniData {
    zatrzymani: number
}

interface trasaData {
    trasa: string
}

debugData([
    {
        action: 'setKonwojowa',
        data: [
            {
                status: "-",
                vehicle: "Dodge Ram",
                unit: "BOY",
                officers: [
                    {
                        name: '[01] Chris Frog'
                    }
                ]
            },
            {
                status: "JEBAĆ PIS I",
                vehicle: "Ford Crown Victoria",
                unit: "ADAM",
                officers: [
                    {
                        name: '[01] Chris Frog',
                        id: 3
                    },
                    {
                        name: '[02] Chris Frog',
                        id: 2
                    },
                    {
                        name: '[03] Chris Frog',
                        id: 1
                    },
                ]
            },
        ]
    },
    {
        action: 'setPrzydzial',
        data: [
            {
                name: '[997] Aiden Kutas',
                id: 4
            },
        ]
    }
])

const Konwojowa:React.FC = () => {
    const playerData = usePlayerDataState()

    const [patrolsData, setPatrolsData] = useState<Patrol[]>([])

    const [statusData, setStatusData] = useState<Status>({
        sv: "",
    })

    const [przydzial, setPrzydzial] = useState<Officer[]>([])

    const [zatrzymaniText, setZatrzymaniText] = useState<zatrzymaniData>({
        zatrzymani: 0,
    })

    const [trasaText, setTrasaText] = useState<trasaData>({
        trasa: "",
    })

    useNuiEvent<Patrol[]>('setKonwojowa', (data) => {
        setPatrolsData(data)
    })

    useNuiEvent<Status>('setStatusData', (data) => {
        setStatusData(data)
    })

    useNuiEvent<Officer[]>('setPrzydzial', (data) => {
        setPrzydzial(data)
    })

    useNuiEvent<Status>('setKonwojowaSV', (data) => {
        setStatusData(data)
    })

    useNuiEvent<zatrzymaniData>('setKonwojowaZatrzymani', (data) => {
        setZatrzymaniText(data)
    })

    useNuiEvent<trasaData>('setKonwojowaTrasa', (data) => {
        setTrasaText(data)
    })




    const setSV = (self: boolean) => {
        let sv: string = ""
        if (self && playerData) {
            sv = playerData.badge + " " + playerData.firstname + " " + playerData.lastname
        }
        fetchNui('setNapadowaSV', {type: 'konwojowa', sv: sv})
    }

    const clearkonwojowa = () => {
        fetchNui("clearNapadowa", {type: 'konwojowa'})
    }

    const removePatrol = () => {
        if (clickedPatrol == null) return;
        fetchNui("removePatrol", {type: 'konwojowa', index: clickedPatrol + 1})
    }

    const [removeModal, setRemoveModal] = useState<boolean>(false)
    const [clickedPatrol, setClickedPatrol] = useState<number | null>(null)

    const unitsAndVehicles = useUnitsAndVehiclesState()

    const [editModal, setEditModal] = useState<boolean>(false)
    const [editedUnit, setEditedUnit] = useState<string | null>(null)
    const [editedVehicle, setEditedVehicle] = useState<string | null>(null)

    const [editedOfficer1, setEditedOfficer1] = useState<string | null>(null)
    const [editedOfficer2, setEditedOfficer2] = useState<string | null>(null)
    const [editedOfficer3, setEditedOfficer3] = useState<string | null>(null)
    const [editedOfficer4, setEditedOfficer4] = useState<string | null>(null)
    const [editedOfficer5, setEditedOfficer5] = useState<string | null>(null)

    const submitEdit = () => {
        setEditModal(false)
        if (!editedUnit && !editedVehicle && !editedOfficer1) return;
        
        if (clickedPatrol === null) {
            var officers = {
                officer1: editedOfficer1,
                officer2: editedOfficer2,
                officer3: editedOfficer3,
                officer4: editedOfficer4,
                officer5: editedOfficer5,
            }
            fetchNui("createUnit", {type: 'konwojowa', unit: editedUnit, vehicle: editedVehicle, officers: officers})
        } else {
            var officers = {
                officer1: editedOfficer1,
                officer2: editedOfficer2,
                officer3: editedOfficer3,
                officer4: editedOfficer4,
                officer5: editedOfficer5,
            }
            fetchNui("editUnit", {type: 'konwojowa', index: clickedPatrol + 1, unit: editedUnit, vehicle: editedVehicle, officers: officers})
        }
    }

    const cancelEdit = () => {
        setEditModal(false)
        setEditedUnit(null)
        setEditedVehicle(null)
        setEditedOfficer1(null)
        setEditedOfficer2(null)
        setEditedOfficer3(null)
        setEditedOfficer4(null)
        setEditedOfficer5(null)
    }

    const onChangeEdit = (t: string, value: string) => {
        if (t == 'unit') {
            setEditedUnit(value)
        } else if (t == 'vehicle') {
            setEditedVehicle(value)
        } else if (t == 'officer1' && (value != '' || value != undefined)){
            setEditedOfficer1(value)
        } else if (t == 'officer2' && (value != '' || value != undefined)){
            setEditedOfficer2(value)
        } else if (t == 'officer3' && (value != '' || value != undefined)){
            setEditedOfficer3(value)
        } else if (t == 'officer4' && (value != '' || value != undefined)){
            setEditedOfficer4(value)
        } else if (t == 'officer5' && (value != '' || value != undefined)){
            setEditedOfficer5(value)
        }
    }

    const ZatrzymaniChange = (z: string) => {
        fetchNui("updateZatrzymani", {text: z})
    }

    const TrasaChange = (z: string) => {
        fetchNui("updateRabunekAkcyjna", {text: z})
    }

    const addSwatUser = () => {
        fetchNui("addSWAT")
    }

    const removePrzydzial = (id: string, name: string) => {
        if (playerData) {
            var x = playerData.badge + " " + playerData.firstname + " " + playerData.lastname

            if(x == name){
                fetchNui('removePrydzial', {id})
            }
        }
    }

    const getOfficersInAkcyjna = () => {
        var patrols = 0
        var x = patrolsData
        for(var i = 0; i < x.length; i++){
            patrols += x[i].officers.length
        }
        
        return patrols
    }

    return (
        <>
            {removeModal && <ConfirmModal label="Usunąć jednostkę pościgową?" text={"Czy na pewno chcesz usunąć U" + (clickedPatrol !== null && clickedPatrol + 1) + "?"} submitLabel="Usuń" cancelLabel="Anuluj" onSubmit={removePatrol} onCancel={() => setRemoveModal(false)} />}
            {editModal && <>
                <div className="background" onClick={() => cancelEdit()}></div>
                <div className="modal-container">
                    <div className="modal-header">
                        <div className="modal-label">
                            Informacje o jednostce konwojowej
                        </div>
                        <div className="modal-close" onClick={() => cancelEdit()}>
                            <FontAwesomeIcon icon={faX}/>
                        </div>
                    </div>
                    <div className="modal-content">
                        <input type="text" placeholder="Funkcjonariusz"></input>
                        <input type="text" placeholder="Funkcjonariusz"></input>
                        <input type="text" placeholder="Funkcjonariusz"></input>
                        <input type="text" placeholder="Funkcjonariusz"></input>
                        <input type="text" placeholder="Funkcjonariusz"></input>
                        <div className="konwojowa-modal">
                            <select onChange={(e) => onChangeEdit('unit', e.target.value)}>
                                {unitsAndVehicles.units.map((value, index) => (
                                    <option key={index} value={value}>
                                        {value}
                                    </option>
                                ))}
                            </select>
                            <select onChange={(e) => onChangeEdit('vehicle', e.target.value)}>
                                {unitsAndVehicles.vehicles.map((value, index) => (
                                    <option key={index} value={value}>
                                        {value}
                                    </option>
                                ))}
                            </select>
                        </div>
                        <div className="konwojowa-modal">
                        <input type="text" placeholder="Notatka"></input>
                            <select onChange={(e) => onChangeEdit('vehicle', e.target.value)}>
                                <option>U1</option>
                                <option>U2</option>
                                <option>U3</option>
                                <option>U4</option>
                                <option>U5</option>
                                <option>U6</option>
                                <option>U7</option>
                                <option>U8</option>
                                <option>U9</option>
                                <option>U10</option>
                                <option>ZATRZMANY</option>
                            </select>

                        </div>
                    </div>
                    <div className="modal-footer">
                        <div className="btn" onClick={() => submitEdit()}>
                            Zapisz unit
                        </div>
                    </div>
                </div>
            </>}
            <div className="konwojowa-container">
                <div className="konwojowa">
                    <TitleBlock text="konwojowa"/>

                    <div className="konwojowa-header">

                        <div style={{width: "225px"}}>
                            <div className="header-title">
                                Trasa
                            </div>
                            <div className="header-content" style={{backgroundColor: '#0D141F', color: 'rgba(255, 255, 255, 0.6)'}}>
                                {(statusData.sv == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <input className="trasa-content" type="text" placeholder="Trasa przewozu..." value={trasaText.trasa} onBlur={event => TrasaChange(event.target.value)}></input>}
                                {(statusData.sv != (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <input className="trasa-content" type="text" placeholder="Trasa przewozu... (SV/NEGO)" value={trasaText.trasa} disabled></input>}
                                
                            </div>
                        </div>

                        <div style={{width: "240px"}}>
                            <div className="header-title pwc">
                                <div className="pwc-button" onClick={() => setSV(true)}>
                                    Przejmij
                                </div>
                                <span>SV</span>
                                <div className="pwc-button" onClick={() => setSV(false)}>
                                    Zresetuj
                                </div>
                            </div>
                            <div className="header-content">
                                {statusData.sv}
                            </div>
                        </div>

                        <div style={{width: "150px"}}>
                            <div className="header-title">
                                Unity
                            </div>
                            <div className="header-content">
                                {patrolsData.length}
                            </div>
                        </div>

                        <div style={{width: "150px"}}>
                            <div className="header-title">
                                Jednostki
                            </div>
                            <div className="header-content">
                                {getOfficersInAkcyjna()}
                            </div>
                        </div>
                        <div style={{width: "150px"}}>
                            <div className="header-title">
                                Zatrzymani
                            </div>
                            <div className="header-content">
                                {(statusData.sv == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <input className="zatrzymani-data" type="number" placeholder="Ilość zatrzymanych..." onBlur={event => ZatrzymaniChange(event.target.value)} value={zatrzymaniText.zatrzymani}></input>}
                                {(statusData.sv != (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <input className="zatrzymani-data" type="number" placeholder="Ilość zatrzymanych... (UZUPEŁNIA SV/NEGO)" value={zatrzymaniText.zatrzymani} disabled></input>}
                            </div>
                        </div>
                    </div>

                    <div className="konwojowa-container2">
                        <div className="patrols-container">
                            <header>
                                <span>Unit</span>
                                {(statusData.sv == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <span className="refresh" onClick={() => clearkonwojowa()}><FontAwesomeIcon icon={faRotateRight}/>  Wyczyść Napadową</span>}
                            </header>
                            
                            {patrolsData.map((value, index) => (
                                <div className="patrol" key={index} onContextMenu={() => {setRemoveModal(true); setClickedPatrol(index); return;}} onClick={() => {
                                    setClickedPatrol(index);
                                    setRemoveModal(true)
                                }}>
                                    <div className="pu-index">
                                        U{index + 1}
                                    </div>
                                    <div className="names">
                                        {value.officers.map((officer, ofIndex) => (
                                            <span key={ofIndex}>
                                                {officer.name}
                                            </span>
                                        ))}
                                    </div>
                                    <div className="unit">
                                        {value.unit}
                                    </div>
                                    <div className="vehicle">
                                        {value.vehicle}
                                    </div>
                                    <div className="status">
                                        <span>
                                            {value.status}
                                        </span>
                                    </div>
                                </div>
                            ))}
                        </div>
                        <div className="patrols-right">
                            <div className="patrols-s4">
                                <div className="patrolsprzydzial">
                                    <header>
                                        SWAT
                                    </header>
                                    <div className="przydzial-button">
                                        <FontAwesomeIcon icon={faAdd} onClick={addSwatUser}/>
                                    </div>
                                </div>
                            
                                <div className="s4-scroll">
                                    {przydzial.map((value, index) => (
                                        <div key={index} onClick={() => removePrzydzial(value.id, value.name)}>
                                            {value.name}
                                        </div>
                                    ))}
                                </div>
                            </div>
                            <div className="patrols-self">
                                <div className="create-patrol" onClick={() => {
                                    setEditModal(true)
                                    setEditedUnit(unitsAndVehicles.units[0])
                                    setEditedVehicle(unitsAndVehicles.vehicles[0])
                                }}>
                                    Stwórz unit
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>

    )
}

export default Konwojowa