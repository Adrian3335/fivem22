import React, { useState } from "react";
import "./Dispatch.scss"
import "../../Modals/Modal.scss"
import TitleBlock from "../../TitleBlock";
import { useNuiEvent } from "../../../hooks/useNuiEvent";
import { usePoliceListState } from "../../../state/policeList";
import { debugData } from "../../../utils/debugData";
import { usePlayerDataState } from "../../../state/playerData";
import { fetchNui } from "../../../utils/fetchNui";
import { faRotateRight, faX } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import SingleModal from "../../Modals/SingleModal";
import ConfirmModal from "../../Modals/ConfirmModal";
import { useUnitsAndVehiclesState } from "../../../state/unitsAndVehicles";
import { useSetAtom } from "jotai";


import Napadowa1 from "./Zakladki/n1/napadowa1";
import Napadowa2 from "./Zakladki/n2/napadowa2";
import Napadowa3 from "./Zakladki/n3/napadowa3";

import Konwojowa from "./Zakladki/k/Konwojowa";


interface Officer {
    firstname: string,
    lastname: string,
    badge: string,
    id: number
}
interface Patrol {
    status: string,
    vehicle: string,
    unit: string,
    officers: Officer[]
}

interface Status {
    pwc: string,
    cityStatus: {
        label: string,
        color: string,
        textColor?: string
    }
}

debugData([
    {
        action: 'setCurrentPatrol',
        data: 0
    }
])

debugData([
    {
        action: 'setDispatch',
        data: [
            {
                status: "-",
                vehicle: "Dodge Ram",
                unit: "BOY",
                officers: [
                    {
                        firstname: "Michael",
                        lastname: "Dustus",
                        badge: "[01]"
                    }
                ]
            },
            {
                status: "-",
                vehicle: "Ford Crown Victoria",
                unit: "ADAM",
                officers: [
                    {
                        firstname: "Vito",
                        lastname: "Giuseppe",
                        badge: "[01]",
                        id: 3
                    },
                    {
                        firstname: "Daniel",
                        lastname: "Martinez",
                        badge: "[02]",
                        id: 2
                    },
                    {
                        firstname: "John",
                        lastname: "Arthur",
                        badge: "[03]",
                        id: 1
                    },
                ]
            },
        ]
    },
    {
        action: 'setS4',
        data: [
            {
                firstname: 'Aiden',
                lastname: 'McClarke',
                badge: '[997]',
                id: 4
            },
        ]
    }
])

const Dispatch:React.FC = () => {

    const policeList = usePoliceListState()

    const playerData = usePlayerDataState()

    const [currentPatrol, setCurrentPatrol] = useState<number | null>(null)

    const [reload, setReload] = useState<boolean>(false)

    const [patrolsData, setPatrolsData] = useState<Patrol[]>([])

    const [statusData, setStatusData] = useState<Status>({
        pwc: "",
        cityStatus: {
            label: "Zielony",
            color: "#92FF3C",
            textColor: "black"
        }
    })

    const [s4, setS4] = useState<Officer[]>([])

    const [href, setHref] = useState<string>('dispatch')

    const reloadData = () => {
        setReload(!reload)
    }

    useNuiEvent<Patrol[]>('setDispatch', (data) => {
        setPatrolsData(data)
    })

    useNuiEvent<Status>('setStatusData', (data) => {
        setStatusData(data)
    })

    useNuiEvent<Officer[]>('setS4', (data) => {
        setS4(data)
    })

    useNuiEvent<number | null>('setCurrentPatrol', (data) => {
        if (data == undefined) {
            setCurrentPatrol(null)
        } else {
            setCurrentPatrol(data)
        }
    })

    const setPWC = (self: boolean) => {
        let pwc: string = ""
        if (self && playerData) {
            pwc = playerData.badge + " " + playerData.firstname + " " + playerData.lastname
        }
        fetchNui('setPWC', {pwc})
    }

    const clearDispatch = () => {
        fetchNui("clearDispatch", {})
    }

    const leavePatrol = () => {
        if (currentPatrol == null) return;
        fetchNui("leavePatrol", {index: currentPatrol + 1})
    }

    const [changeStatus, setChangeStatus] = useState<boolean>(false)

    const cancelStatus = () => {
        setChangeStatus(false)
    }

    const submitStatus = (data: string) => {
        setChangeStatus(false)
        if (!data) return;
        if (currentPatrol === null) return;
        fetchNui("changePatrolStatus", {index: currentPatrol + 1, status: data})
    }

    const [joinModal, setJoinModal] = useState<boolean>(false)
    const [clickedPatrol, setClickedPatrol] = useState<number | null>(null)

    const unitsAndVehicles = useUnitsAndVehiclesState()

    const cancelJoin = () => {
        setClickedPatrol(null)
        setJoinModal(false)
    }

    const submitJoin = async () => {
        const data = Number(clickedPatrol)
        setClickedPatrol(null)
        setJoinModal(false)
        if (currentPatrol !== null) {
            await fetchNui("leavePatrol", {index: currentPatrol + 1})
        }
        fetchNui("joinPatrol", {index: data + 1})
    }

    const [editModal, setEditModal] = useState<boolean>(false)
    const [editedUnit, setEditedUnit] = useState<string | null>(null)
    const [editedVehicle, setEditedVehicle] = useState<string | null>(null)

    const submitEdit = (unit: string, vehicle: string) => {
        setEditModal(false)
        if (!editedUnit && !editedVehicle) return;
        if (currentPatrol !== null && editedUnit == patrolsData[currentPatrol].unit && editedVehicle == patrolsData[currentPatrol].vehicle) {
            setEditedUnit(null)
            setEditedVehicle(null)
            return
        };
        if (currentPatrol === null) {
            fetchNui("createPatrol", {unit: editedUnit, vehicle: editedVehicle})
        } else {
            fetchNui("editPatrol", {index: currentPatrol + 1,unit: editedUnit, vehicle: editedVehicle})
        }

    }

    const cancelEdit = () => {
        setEditModal(false)
        setEditedUnit(null)
        setEditedVehicle(null)
    }

    const onChangeEdit = (t: string, value: string) => {
        if (t == 'unit') {
            setEditedUnit(value)
        } else if (t == 'vehicle') {
            setEditedVehicle(value)
        }
    }

    const changeZakladka = (value: string) => {
        var el2 = document.querySelector('.zakladka-selected')
        el2?.classList.remove('zakladka-selected')


        var el = document.querySelector('.'+value)
        el?.classList.add('zakladka-selected')

        var x = value

        if(x == 'dispatch2'){
            x = 'dispatch'
        } else if (x == 'napadowa-1' || x == 'napadowa-2' || x == 'napadowa-3'){
            x = x.replace('-', '')
        }

        setHref(x)

    }

    return (
        <>
            {changeStatus && <SingleModal label="Wpisz status" placeholder="Podaj status..." submitLabel="Potwierdź" onCancel={cancelStatus} onSubmit={submitStatus} />}
            {joinModal && <ConfirmModal label="Dołączyć do patrolu?" text={"Czy na pewno chcesz dołączyć do PU " + (clickedPatrol !== null && clickedPatrol + 1) + "?"} submitLabel="Dołącz" cancelLabel="Anuluj" onSubmit={submitJoin} onCancel={cancelJoin} />}
            {editModal && <>
                <div className="background" onClick={() => cancelEdit()}></div>
                <div className="modal-container">
                    <div className="modal-header">
                        <div className="modal-label">
                            Informacje o patrolu
                        </div>
                        <div className="modal-close" onClick={() => cancelEdit()}>
                            <FontAwesomeIcon icon={faX}/>
                        </div>
                    </div>
                    <div className="modal-content">
                        <div className="dispatch-modal">
                            <select onChange={(e) => onChangeEdit('unit', e.target.value)}>
                                {unitsAndVehicles.units.map((value, index) => (
                                    <option key={index} value={value} selected={currentPatrol !== null && patrolsData[currentPatrol].unit == value}>
                                        {value}
                                    </option>
                                ))}
                            </select>
                            <select onChange={(e) => onChangeEdit('vehicle', e.target.value)}>
                                {unitsAndVehicles.vehicles.map((value, index) => (
                                    <option key={index} value={value} selected={currentPatrol !== null && patrolsData[currentPatrol].vehicle == value}>
                                        {value}
                                    </option>
                                ))}
                            </select>
                        </div>
                    </div>
                    <div className="modal-footer">
                        <div className="btn" onClick={() => submitEdit("a", "a")}>
                            Zapisz patrol
                        </div>
                    </div>
                </div>
            </>}
            <div className="buttons-zakladki">
                <button className="dispatch2 zakladka-selected" onClick={() => changeZakladka('dispatch2')}>Dispatch</button>
                <button className="napadowa-1" onClick={() => changeZakladka('napadowa-1')}>Napadowa 1</button>
                <button className="napadowa-2" onClick={() => changeZakladka('napadowa-2')}>Napadowa 2</button>
                <button className="napadowa-3" onClick={() => changeZakladka('napadowa-3')}>Napadowa 3</button>
                <button className="konwoj" onClick={() => changeZakladka('konwoj')}>Konwój</button>
            </div>

            {<div style={{display: href == 'napadowa1' ? "block" : "none"}}>
                <Napadowa1></Napadowa1>
            </div>}

            {<div style={{display: href == 'napadowa2' ? "block" : "none"}}>
                <Napadowa2></Napadowa2>
            </div>}

            {<div style={{display: href == 'napadowa3' ? "block" : "none"}}>
                <Napadowa3></Napadowa3>
            </div>}


            {<div style={{display: href == 'konwoj' ? "block" : "none"}}>
                <Konwojowa></Konwojowa>
            </div>}

            
            <div className="dispatch-container" style={{display: href == 'dispatch' ? "block" : "none"}}>
                <div className="dispatch">
                    <TitleBlock text="Dispatch"/>


                    <div className="dispatch-header">

                        <div style={{width: "265px"}}>
                            <div className="header-title">
                                Poziom Zagrożenia
                            </div>
                            <div className="header-content" style={{backgroundColor: statusData.cityStatus.color, color: statusData.cityStatus.textColor}}>
                                {statusData.cityStatus.label}
                            </div>
                        </div>

                        <div style={{width: "260px"}}>
                            <div className="header-title pwc">
                                <div className="pwc-button" onClick={() => setPWC(true)}>
                                    Przejmij
                                </div>
                                <span>PWC</span>
                                <div className="pwc-button" onClick={() => setPWC(false)}>
                                    Zresetuj
                                </div>
                            </div>
                            <div className="header-content">
                                {statusData.pwc}
                            </div>
                        </div>

                        <div style={{width: "174px"}}>
                            <div className="header-title">
                                On Duty
                            </div>
                            <div className="header-content">
                                {policeList.length}
                            </div>
                        </div>

                        <div style={{width: "213px"}}>
                            <div className="header-title">
                                Patrole
                            </div>
                            <div className="header-content">
                                {patrolsData.length}
                            </div>
                        </div>

                    </div>

                    <div className="dispatch-container2">
                        <div className="patrols-container">
                            <header>
                                <span>Patrol Unit</span>
                                {(statusData.pwc == (playerData?.badge + " " + playerData?.firstname + " " + playerData?.lastname)) && <span className="refresh" onClick={() => clearDispatch()}><FontAwesomeIcon icon={faRotateRight}/>  Wyczyść Dispatch</span>}
                            </header>
                            {patrolsData.map((value, index) => (
                                <div className="patrol" key={index} onClick={() => {
                                    if (index == currentPatrol) return;
                                    setClickedPatrol(index);
                                    setJoinModal(true)
                                }}>
                                    <div className="pu-index">
                                        PU {index + 1}
                                    </div>
                                    <div className="badges">
                                        {value.officers.map((officer, ofIndex) => (
                                            <span key={ofIndex}>
                                                {officer.badge}
                                            </span>
                                        ))}
                                    </div>
                                    <div className="names">
                                        {value.officers.map((officer, ofIndex) => (
                                            <span key={ofIndex}>
                                                {officer.firstname} {officer.lastname}
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
                                    STATUS 4
                                </header>
                                <div className="s4-scroll">
                                    {s4.map((value, index) => (
                                        <div key={index}>
                                            {value.badge} {value.firstname} {value.lastname}
                                        </div>
                                    ))}
                                </div>
                            </div>
                            <div className="patrols-self">
                                {currentPatrol === null && <>
                                    <div className="create-patrol" onClick={() => {
                                        setEditModal(true)
                                        setEditedUnit(unitsAndVehicles.units[0])
                                        setEditedVehicle(unitsAndVehicles.vehicles[0])
                                    }}>
                                        Stwórz patrol
                                    </div>
                                </>}
                                {currentPatrol !== null && <>
                                    <div className="line">
                                        <div className="btn" onClick={() => leavePatrol()}>
                                            Opuść patrol
                                        </div>
                                        <div className="btn" onClick={() => {
                                            setEditModal(true)
                                            setEditedUnit(patrolsData[currentPatrol].unit)
                                            setEditedVehicle(patrolsData[currentPatrol].vehicle)
                                        }}>
                                            Edytuj
                                        </div>
                                    </div>
                                    <div className="line">
                                        <div className="patrol-data">
                                            {patrolsData[currentPatrol]?.unit}
                                        </div>
                                        <div className="patrol-data">
                                            {patrolsData[currentPatrol]?.vehicle}
                                        </div>
                                    </div>
                                    <div className="line">
                                        <div className="status" onClick={() => setChangeStatus(true)}>
                                            Zmień status
                                        </div>
                                    </div>
                                </>}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>

    )
}

export default Dispatch