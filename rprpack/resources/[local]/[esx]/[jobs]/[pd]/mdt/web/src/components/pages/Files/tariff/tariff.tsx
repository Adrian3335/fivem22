import React, { useState } from "react";
import { usePlayerDataState } from "../../../../state/playerData";
import { useTariffState } from "../../../../state/tariff";
import { fetchNui } from "../../../../utils/fetchNui";
import TitleBlock from "../../../TitleBlock";
import "./tariff.scss"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCheck, faPlus, faX } from "@fortawesome/free-solid-svg-icons";
import { TariffT } from "../../../../types/tariff";
import SingleModal from "../../../Modals/SingleModal";
import ConfirmModal from "../../../Modals/ConfirmModal";
import {useRef} from 'react';

const Tariff: React.FC<{data: any}> = ({data}) => {

    const playerData = usePlayerDataState();
    const tariff = useTariffState();
    const [tariffVisibile, setTariffVisible] = useState<boolean>(false);
    const [totalFine, setTotalFine]= useState<number>(0);
    const [totalJail, setTotalJail] = useState<number>(0);
    const [summary, setSummary] = useState<any[]>([]);

    const [customWyrok, setCustomWyrok] = useState<boolean>(false)

    
    const inputRef = useRef(null);

    const generateReason = (): string => {
        let r = ""
        const added: {[key: string]: number} = {}
        for (let i=0; i< summary.length; i++) {
            const e = summary[i]
            if (!added[e.label]) {
                added[e.label] = 1
            } else {
                added[e.label] += 1
            }
        }
        for (const [key, value] of Object.entries(added)) {
            r += (key + " " + (value > 1 ? (value + "x | ") : " | "))
        }
        return r
    }

    const reloadTotal = () => {
        setTotalFine(0)
        setTotalJail(0)
        let f = 0;
        let j = 0;
        for (let i=0; i < summary.length; i++) {
            f += summary[i].fine
            j += summary[i].jail
        }
        setTotalFine(f)
        setTotalJail(j)
    }

    let number = 0;
    const submit = () => {
        if (totalFine == 0 && totalJail == 0) return;
        if (!playerData) return;
        const reason = generateReason()
        if (reason.length == 0) return;
        {summary.map(() => (
            number += 1
        ))}
        for(let i = number; i >= 0; i = i - 1){
            remove(i)
        }
        fetchNui('submitFine', {
            identifier: data.identifier,
            fine: totalFine,
            jail: totalJail,
            reason: reason,
            officer: (playerData.badge || '') + " " + playerData.firstname + " " + playerData.lastname
        })
        if (!tariffVisibile) return;
        setTariffVisible(false)
    }

    const addData = (element: any) => {
        const tempSummary = summary
        tempSummary.push(element)
        setSummary(tempSummary)
        reloadTotal()
    }

    const remove = (index: number) => {
        const tempSummary = summary
        tempSummary.splice(index, 1)
        setSummary(tempSummary)
        reloadTotal()
    }

    const submitCustomWyrok = () => {
        const first = document.querySelector('#customZarzuty') as HTMLInputElement | null;
        const second = document.querySelector('#customGrzywna') as HTMLInputElement | null;
        const third = document.querySelector('#customWyrok') as HTMLInputElement | null;
        
        if(first != null && second != null && third != null){
            var data = {
                label: first.value,
                fine: parseInt(second.value),
                jail: parseInt(third.value)
            }

            addData(data)
        }

        setCustomWyrok(false)
    }


    const SmallTitleBlock: React.FC<{text: string}> = ({text}) => {
        return (
            <div className="title-container" style={{margin: 0}}>
                <div className="title-text" style={{fontSize: "7px"}}>
                    {text}
                </div>
            <div className="title-line"></div>
            </div>
        )
    }

    return (
        <>
            {customWyrok && <>
                <div className="background" onClick={() => setCustomWyrok(false)}></div>
                <div className="modal-container">
                    <div className="modal-header">
                        <div className="modal-label">
                            Niestandardowy zarzut
                        </div>
                        <div className="modal-close" onClick={() => setCustomWyrok(false)}>
                            <FontAwesomeIcon icon={faX}/>
                        </div>
                    </div>
                    <div className="modal-content">
                        <input type="text" id="customZarzuty" placeholder="Zarzuty" ref={inputRef}></input>
                        <input type="number" id="customWyrok" placeholder="Ilość miesięcy" ref={inputRef}></input>
                        <input type="number" id="customGrzywna" placeholder="Ilość grzywny" ref={inputRef}></input>
                    </div>
                    <div className="modal-footer">
                        <div className="btn" onClick={() => submitCustomWyrok()}>
                            Zapisz zarzut
                        </div>
                    </div>
                </div>
            </>}

            <TitleBlock text={"Wystawianie mandatów"}/>
            <div className="tariff-container" id="tariff">
                <div className="fines-container">
                    <div className="fines-scroll">
                        {tariff?.map((value: TariffT, index: number) => (
                            <>
                                <div className="tariff-title" key={index} style={{marginTop: index == 0 ? "0" : "12px", width: "100%"}}>
                                    {value.label}
                                </div>
                                {value.data.map((value2, index2) => (
                                    <div className="tariff-data" key={index2} onClick={() => addData(value2)}>
                                        <span className="tariff-reason">{value2.label}</span>
                                        <div className="tariff-data-data">
                                            {value2.jail > 0 && 
                                                <span className="jail">
                                                    {value2.jail} miesięcy
                                                </span>
                                            }
                                            {value2.fine > 0 && 
                                                <span className="fine">
                                                    {value2.fine} $
                                                </span>
                                            }
                                            <div className="add">
                                                <FontAwesomeIcon icon={faPlus}/>
                                            </div>
                                        </div>
                                    </div>
                                ))}
                                
                            </>
                        ))}
                    </div>
                </div>
                <div className="summary-container">
                    <div className="tariff-title">
                        Podsumowanie mandatu
                    </div>

                    <div className="summary-container2">
                        {summary.map((value, index) => (
                            <div className="summary-fine" key={index}>
                                <span className="summary-reason">
                                    {value.label}
                                </span>
                                <div className="summary-fine-data">
                                    {value.jail > 0 && 
                                        <span className="jail">
                                            {value.jail} miesięcy
                                        </span>
                                    }
                                    {value.fine > 0 && 
                                        <span className="fine">
                                            {value.fine} $
                                        </span>
                                    }
                                    <div className="remove" onClick={() => remove(index)}>
                                        <FontAwesomeIcon icon={faX}/>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                    <div className="tariff-custom" onClick={() => setCustomWyrok(true)}>
                        Dodaj niestandardowy wyrok
                    </div>

                    <div className="summary-data">
                        <SmallTitleBlock text={"PODSUMOWANIE"}/>
                        <div className="data">
                            <div className="summary-block" style={{color: "#92FF3C"}}>
                                {totalFine} $
                            </div>
                            <div className="summary-block" style={{color: "#316BFF"}}>
                                {totalJail} miesięcy
                            </div>
                        </div>
                        <div className="data2">
                            <div className="data2-data">
                                <SmallTitleBlock text={"Data"}/>
                                <div className="data2-block">
                                    {new Date().toLocaleDateString()}
                                </div>
                            </div>
                            <div className="data2-data">
                                <SmallTitleBlock text={"Wystawiający"}/>
                                <div className="data2-block">
                                    {(playerData?.badge || '') + " " + playerData?.firstname + " " + playerData?.lastname}
                                </div>
                            </div>
                            <div className="summary-button-container">
                                <div onClick={submit}>
                                    <FontAwesomeIcon icon={faCheck} />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}

export default Tariff