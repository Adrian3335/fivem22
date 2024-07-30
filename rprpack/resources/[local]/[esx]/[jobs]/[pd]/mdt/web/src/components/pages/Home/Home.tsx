import React, { useState, Dispatch, SetStateAction, useRef } from "react";
import { usePlayerDataState } from "../../../state/playerData";
import './Home.scss'
import { CitizenNote, VehicleNote } from "../../../types/notes";
import { useNuiEvent } from "../../../hooks/useNuiEvent";
import { debugData } from "../../../utils/debugData";
import TitleBlock from "../../TitleBlock";
import { fetchNui } from "../../../utils/fetchNui";
import { useNotes } from "../../../state/notes";
import { useLocaleState } from "../../../state/locale";

debugData([
    {
        action: 'setLastNotes',
        data: {
            citizen: [
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód wad awd awd awdawdnaw dawi dawid niaw  dwa daw daw daw daw daw dawd awdaw daw da wda wdawddniawdnioawn idawni dawni danwidia ndi naiwdniad dwa daw daw daw daw daw daw da daw d",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
                {
                    name: 'Chris Frog',
                    date: 1677353352,
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
            ],
            vehicles: [
                {
                    model: 'Warrener',
                    owner: "Chris Frog",
                    date: 1677353352,
                    plate: "XYZ 1234",
                    reason: "Przykładowy powód",
                    officer: "[01] Chris Frog"
                },
            ]
        }
    }
])

const Home: React.FC<{setHref: Dispatch<SetStateAction<string>>}> = ({setHref}) => {

    const playerData = usePlayerDataState()

    const Locale = useLocaleState()

    const [currentAction, setCurrentAction] = useState<string>('available')

    const actions = [
        {
            label: Locale['STATUS_AVAILABLE'],
            name: 'available'
        },
        {
            label: Locale['STATUS_NOAVAILABLE'],
            name: 'noavailable'
        },
        {
            label: Locale['STATUS_S2'],
            name: 's2'
        },
        {
            label: Locale['STATUS_S5'],
            name: 's5'
        },
        {
            label: Locale['STATUS_S4'],
            name: 's4'
        },
        {
            label: Locale['STATUS_S8'],
            name: 's8'
        },
    ]

    const setStatus = (s: string) => {
        setCurrentAction(s)
        fetchNui('setStatus', {status: s})
    }

    const [lastVehicleNotes, setVehicleNotes] = useState<VehicleNote[]>([])
    const [lastNotes, setNotes] = useState<CitizenNote[]>([])

    useNuiEvent<{
        citizen: CitizenNote[],
        vehicles: VehicleNote[]
    }>('setLastNotes', (data) => {
        setVehicleNotes(data.vehicles)
        setNotes(data.citizen)
    })

    const titleNote = useRef<HTMLInputElement>(null)
    const contentNote = useRef<HTMLTextAreaElement>(null)

    const [playerNotes, setPlayerNotes] = useNotes()

    const addNote = () => {
        if (!titleNote.current) return;
        if (!contentNote.current) return;
        const firstValue: string = titleNote.current.value
        const secondValue: string = contentNote.current.value
        if (!firstValue || !secondValue) return;
        fetchNui('addNote', {title: firstValue, content: secondValue})
        const tempNotes = playerNotes
        tempNotes.push({title: firstValue, content: secondValue, index: 0})
        setPlayerNotes(tempNotes)
        titleNote.current.value = ""
        contentNote.current.value = ""
    }

    return (
        <div className="home-container">
            <div className="home">
                <TitleBlock text={"Status służby"}/>
                <div className="self-container">
                    <div className="self-name">
                        {playerData && <span>{playerData.badge || ''} {playerData.firstname} {playerData.lastname} <span>{playerData.job.grade_label}</span></span>}
                        
                    </div>
                    <div className="self-hours">
                        <div>
                            {playerData && playerData.dutyTime}
                        </div>
                    </div>
                    <div className="self-actions">
                        {actions.map((value, index) => (
                            <div className={"action-button " + (value.name == currentAction && "clicked")} key={index} onClick={() => setStatus(value.name)}>
                                {value.label}
                            </div>
                        ))}
                    </div>
                </div>

                <TitleBlock text={"Ostatnie notatki obywateli"}/>
                <div className="notes-container" style={{marginBottom: "14px"}}>
                    <div className="notes-header">
                        <span style={{width: "125px"}}>
                            Dane osobowe
                        </span>
                        <span style={{width: "103px"}}>
                            Data
                        </span>
                        <span style={{width: "336px"}}>
                            Powód
                        </span>
                        <span style={{width: "125px"}}>
                            Wydane przez
                        </span>
                    </div>
                    <div className="notes-notes">
                        <table>
                            {lastNotes.reverse().map((value, index) => (
                                <tr className="notes-row" key={index}>
                                    <td style={{width: "129px"}}>
                                        <span>{value.name}</span>
                                    </td>
                                    <td style={{width: "107px"}}>
                                        <span>{new Date(value.date * 1000).toLocaleDateString()}</span>
                                    </td>
                                    <td style={{width: "340px"}}>
                                        <span>{value.reason}</span>
                                    </td>
                                    <td style={{width: "129px"}}>
                                        <span>{value.officer}</span>
                                    </td>
                                </tr>
                            ))}
                        </table>
                    </div>
                </div>

                <TitleBlock text={"Ostatnie notatki pojazdów"}/>
                <div className="notes-container vehicle-container">
                    <div className="notes-header">
                        <span style={{width: "86px"}}>
                            Model
                        </span>
                        <span style={{width: "76px"}}>
                            Właściciel
                        </span>
                        <span style={{width: "103px"}}>
                            Data
                        </span>
                        <span style={{width: "69px"}}>
                            Rej.
                        </span>
                        <span style={{width: "263px"}}>
                            Powód
                        </span>
                        <span style={{width: "84px"}}>
                            Wydane przez
                        </span>
                    </div>
                    <div className="notes-notes vehicle-notes">
                        <table>
                            {lastVehicleNotes.reverse().map((value, index) => (
                                <tr className="notes-row" key={index}>
                                    <td style={{width: "90px"}}>
                                        <span>{value.model}</span>
                                    </td>
                                    <td style={{width: "80px"}}>
                                        <span>{value.owner}</span>
                                    </td>
                                    <td style={{width: "107px"}}>
                                        <span>{new Date(value.date * 1000).toLocaleDateString()}</span>
                                    </td>
                                    <td style={{width: "73px"}}>
                                        <span>{value.plate}</span>
                                    </td>
                                    <td style={{width: "267px"}}>
                                        <span>{value.reason}</span>
                                    </td>
                                    <td style={{width: "88px"}}>
                                        <span>{value.officer}</span>
                                    </td>
                                </tr>
                            ))}
                        </table>
                    </div>
                </div>

            </div>
            <div className="notepad">
                <TitleBlock text={"Notepad"}/>
                <div className="notepad-container">
                    <input placeholder="Tytuł notatki..." ref={titleNote}/>
                    <textarea placeholder="Treść notatki..." ref={contentNote}></textarea>
                    <div className="buttons">
                        <div className="btn" onClick={() => setHref("notes")}>
                            Wszystkie notatki
                        </div>
                        <div className="btn btn-blue" onClick={() => addNote()}>
                            Dodaj notatkę
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    )
}

export default Home