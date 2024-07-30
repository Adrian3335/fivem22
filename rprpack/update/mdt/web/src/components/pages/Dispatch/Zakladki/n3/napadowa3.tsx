import React, { useState } from "react";
import "./napadowa3.scss"
import "../../../../Modals/Modal.scss"
import TitleBlock from "../../../../TitleBlock";
import { useNuiEvent } from "../../../../../hooks/useNuiEvent";
import { usePoliceListState } from "../../../../../state/policeList";
import { debugData } from "../../../../../utils/debugData";
import { usePlayerDataState } from "../../../../../state/playerData";
import { fetchNui } from "../../../../../utils/fetchNui";
import { faRotateRight, faX } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import SingleModal from "../../../../Modals/SingleModal";
import ConfirmModal from "../../../../Modals/ConfirmModal";
import { useUnitsAndVehiclesState } from "../../../../../state/unitsAndVehicles";

interface Officer {
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

interface Nego {
    nego: string
}

interface notatkiData {
    notatki: string
}
interface zadaniaData {
    zadania: string
}
interface miejsceData {
    miejsce: string
}

debugData([
    {
        action: 'setNapadowa3',
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
])

const Napadowa3:React.FC = () => {
    const playerData = usePlayerDataState()

    const [patrolsData, setPatrolsData] = useState<Patrol[]>([])

    const [statusData, setStatusData] = useState<Status>({
        sv: "",
    })

    const [negoData, setNegoData] = useState<Nego>({
        nego: "",
    })

    const [notatkiText, setNotatkiText] = useState<notatkiData>({
        notatki: "",
    })
    const [zadaniaText, setZadaniaText] = useState<zadaniaData>({
        zadania: "",
    })
    const [miejsceText, setMiejsceText] = useState<miejsceData>({
        miejsce: "",
    })

    useNuiEvent<Patrol[]>('setNapadowa3', (data) => {
        setPatrolsData(data)
    })

    useNuiEvent<Status>('setNapadowa3SV', (data) => {
        setStatusData(data)
    })

    useNuiEvent<Nego>('setNapadowa3NEGO', (data) => {
        setNegoData(data)
    })

    useNuiEvent<notatkiData>('setNapadowa3Notatki', (data) => {
        setNotatkiText(data)
    })
    useNuiEvent<zadaniaData>('setNapadowa3Zadania', (data) => {
        setZadaniaText(data)
    })
    useNuiEvent<miejsceData>('setNapadowa3Miejsce', (data) => {
        setMiejsceText(data)
    })


    const setSV = (self: boolean) => {
        let sv: string = ""
        if (self && playerData) {
            sv = playerData.badge + " " + playerData.firstname + " " + playerData.lastname
        }
        fetchNui('setNapadowaSV', {type: 'napadowa3', sv: sv})
    }

    const setNego = (self: boolean) => {
        let nego: string = ""
        if (self && playerData) {
            nego = playerData.badge + " " + playerData.firstname + " " + playerData.lastname
        }
        fetchNui('setNapadowaNEGO', {type: 'napadowa3', nego: nego})
    }

    const clearnapadowa = () => {
        fetchNui("clearNapadowa", {type: 'napadowa3'})
    }


    const removePatrol = () => {
        if (clickedPatrol == null) return;
        fetchNui("removeUnit", {type: 'napadowa3', index: clickedPatrol + 1})
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
            fetchNui("createUnit", {type: 'napadowa3', unit: editedUnit, vehicle: editedVehicle, officers: officers})
        } else {
            var officers = {
                officer1: editedOfficer1,
                officer2: editedOfficer2,
                officer3: editedOfficer3,
                officer4: editedOfficer4,
                officer5: editedOfficer5,
            }
            fetchNui("editUnit", {type: 'napadowa3', index: clickedPatrol + 1, unit: editedUnit, vehicle: editedVehicle, officers: officers})
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

    const ZadaniaChange = (z: string) => {
        fetchNui("updateZadaniaAkcyjna", {type: 'napadowa3', text: z})
    }

    const NotatkiChange = (z: string) => {
        fetchNui("updateNotatkiAkcyjna", {type: 'napadowa3', text: z})
    }

    const RabunekChange = (z: string) => {
        fetchNui("updateRabunekAkcyjna", {type: 'napadowa3', text: z})
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
                            Informacje o jednostce pościgowej
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
                        <div className="napadowa3-modal">
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
                        <div className="napadowa3-modal">
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
            <div className="napadowa3-container">
                <div className="napadowa3">
                    <TitleBlock text="Napadowa 3"/>

                    <div className="napadowa3-header">
                        <div style={{width: "275px"}}>
                            <div className="header-title">                                
                                Placówka
                            </div>
                            <div className="header-content" style={{backgroundColor: '#0D141F', color: 'rgba(255, 255, 255, 0.6)'}}>
                                {(statusData.sv == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname) || negoData.nego == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <input type="text" placeholder="Placówka rabunku..." value={miejsceText.miejsce} onBlur={event => RabunekChange(event.target.value)}></input>}
                                {(statusData.sv != (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname) && negoData.nego != (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <input type="text" id="header-placowka" value={miejsceText.miejsce}  placeholder="Placówka rabunku (Uzupełnia SV/NEGO)" disabled></input>}
                            </div>
                        </div>

                        <div style={{width: "210px"}}>
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
                                {(statusData.sv == '') && 'BRAK'}
                                {(statusData.sv != '') && statusData.sv}
                            </div>
                        </div>
                        <div style={{width: "210px"}}>
                        <div className="header-title pwc">
                                <div className="pwc-button" onClick={() => setNego(true)}>
                                    Przejmij
                                </div>
                                <span>NEGO</span>
                                <div className="pwc-button" onClick={() => setNego(false)}>
                                    Zresetuj
                                </div>
                            </div>
                            <div className="header-content">
                                {(negoData.nego == '') && 'BRAK'}
                                {(negoData.nego != '') && negoData.nego}
                            </div>
                        </div>

                        <div style={{width: "115px"}}>
                            <div className="header-title">
                                Unity
                            </div>
                            <div className="header-content">
                                {patrolsData.length}
                            </div>
                        </div>

                        <div style={{width: "115px"}}>
                            <div className="header-title">
                                Jednostki
                            </div>
                            <div className="header-content">
                                {getOfficersInAkcyjna()}
                            </div>
                        </div>

                    </div>

                    <div className="napadowa3-container2">
                        <div className="patrols-container">
                            <header>
                                <span>Unit</span>
                                {(statusData.sv == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <span className="refresh" onClick={() => clearnapadowa()}><FontAwesomeIcon icon={faRotateRight}/>  Wyczyść Napadową</span>}
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
                                <header>
                                    ŻĄDANIA
                                </header>
                                <div className="s4-scroll">
                                    {(statusData.sv == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname) || negoData.nego == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <textarea value={zadaniaText.zadania} placeholder="Żądania napastników..." onBlur={event => ZadaniaChange(event.target.value)}></textarea>}
                                    {(statusData.sv != (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname) && negoData.nego != (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <textarea value={zadaniaText.zadania} placeholder="Żądania napastników (Uzupełnia SV/NEGO)" id="zadania" disabled></textarea>}
                                </div>
                            </div>
                            <div className="patrols-s4">
                                <header>
                                    NOTATKI
                                </header>
                                <div className="s4-scroll">
                                    {(statusData.sv == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname) || negoData.nego == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <textarea value={notatkiText.notatki} placeholder="Notatki na temat rabunku..." onBlur={event => NotatkiChange(event.target.value)}></textarea>}
                                    {(statusData.sv != (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname) && negoData.nego != (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <textarea value={notatkiText.notatki} placeholder="Notatki na temat rabunku (Uzupełnia SV/NEGO)" id="notatki" disabled></textarea>}
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

export default Napadowa3