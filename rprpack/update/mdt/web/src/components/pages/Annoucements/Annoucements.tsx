import React, { useState } from "react";
import { useAnnoucementsState } from "../../../state/annoucements";
import { Annoucement } from "../../../types/annoucements";
import { debugData } from "../../../utils/debugData";
import TitleBlock from "../../TitleBlock";
import DoubleModal from "../../Modals/DoubleModal";
import './Annoucements.scss'
import { fetchNui } from "../../../utils/fetchNui";

debugData([
    {
        action: 'setAnnoucements',
        data: [
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 1
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 2
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 3
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 4
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 5
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 6
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 7
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 8
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 9
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 10
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 11
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 12
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 13
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 14
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 15
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 16
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 17
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 18
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text",
                index: 19
            },
        ]
    }
])

const Annoucements: React.FC = () => {

    const annoucements: Annoucement[] = useAnnoucementsState()
    const [modal, setModal] = useState<boolean>(false)

    const onSubmit = (title: string, content: string) => {
        setModal(false)
        fetchNui('addAnnoucement', {title, content})
    }

    const onCancel = () => {
        setModal(false)
    }

    const removeAnno = () => {
        var test = document.getElementById("annoucements-checkbox-idea");
        var dick = test?.classList.contains('showed');

        if(dick){
            document.querySelectorAll('.annoucements-checkbox-idea').forEach(function(el) {
                var element = el as HTMLInputElement
                element.style.display = 'none';
            });

            test?.classList.remove('showed');
            var button = document.getElementById('confirm-button') as HTMLInputElement;
            button.style.display = 'none';
        } else {
            document.querySelectorAll('.annoucements-checkbox-idea').forEach(function(el) {
                var element = el as HTMLInputElement
                element.style.display = 'block';
            });
            test?.classList.add('showed')
            var button = document.getElementById('confirm-button') as HTMLInputElement;
            button.style.display = 'flex';
            

        }
    }

    const confirmRemoveAnno = () => {
        removeAnno()
        document.querySelectorAll('.checkbox-input').forEach(function(el) {
            var element = el as HTMLInputElement
            if(element.checked){
                var ret = element.id.replace('checkbox','');
                document.getElementById("row-"+ret+"")?.remove();
            }
        })
    }

    return (
        <>
            {modal && <DoubleModal label="Dodaj ogłoszenie" onSubmit={onSubmit} onCancel={onCancel} firstPlaceholder="Tytuł ogłoszenia..." secondPlaceholder="Treść ogłoszenia..." submitLabel="Dodaj ogłoszenie" />}
            <div className="annoucements-container">
                <div className="annoucements">
                    <TitleBlock text="Ogłoszenia"/>
                    <div className="container">
                        <div className="annoucements-header">
                            <span style={{width: "265px"}}>
                                Tytuł Ogłoszenia
                            </span>
                            <span style={{width: "636px"}}>
                                Treść Ogłoszenia
                            </span>
                        </div>

                        <div className="annoucements-results">
                            <table>
                                {annoucements.map((value, index) => (
                                    <tr key={index} className="annoucements-row" id={'row-'+value.index}>
                                        <div className="annoucements-checkbox-idea" id="annoucements-checkbox-idea">
                                            <input type="checkbox" className="checkbox-input" id={'checkbox'+value.index} />
                                            <label htmlFor={"checkbox"+value.index}>
                                                <span className="checkbox"></span>
                                            </label>
                                        </div>
                                        <td style={{width: "265px"}}>
                                            <span>{value.title}</span>
                                        </td>
                                        <td style={{width: "636px"}}>
                                            <span>{value.content}</span>
                                        </td>
                                    </tr>
                                ))}
                            </table>
                        </div>

                        <div className="buttons">
                            <div className="remove-btn" id="confirm-button" onClick={() => confirmRemoveAnno()}>
                                Potwierdź
                            </div>
                            <div className="remove-btn" onClick={() => removeAnno()}>
                                Usuń ogłoszenia
                            </div>
                            <div className="btn" onClick={() => setModal(true)}>
                                Dodaj ogłoszenie
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </>
        
    )
}

export default Annoucements