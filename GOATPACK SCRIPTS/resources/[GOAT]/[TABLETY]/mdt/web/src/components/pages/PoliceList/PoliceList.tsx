import React from "react";
import { usePoliceListState } from "../../../state/policeList";
import { debugData } from "../../../utils/debugData";
import "./PoliceList.scss"
import TitleBlock from "../../TitleBlock";

debugData([
    {
        action: 'setPoliceList',
        data: [

            {
                badge: "[01]",
                firstname: "Chris",
                lastname: "Frog",
                status: "Dostępny",
                user_grade: "Szef Policji",
            },
        ]
    }
])

const PoliceList: React.FC = () => {

    const policeList = usePoliceListState()

    return (
        <div className="policelist-container">
            <div className="policelist">
                <TitleBlock text="Funkcjonariusze"/>
                <div className="container">
                    <div className="policelist-header">
                        <span style={{width: "150px"}}>
                            Numer odznaki
                        </span>
                        <span style={{width: "350px"}}>
                            Officer
                        </span>
                        <span style={{width: "215px"}}>
                            Stopień
                        </span>
                        <span style={{width: "182px"}}>
                            Status
                        </span>
                    </div>

                    <div className="policelist-results">
                        <table>
                            {policeList.map((value, index) => (
                                <tr key={index} className="policelist-row">
                                    <td style={{width: "150px"}}>
                                        <span>{value.badge}</span>
                                    </td>
                                    <td style={{width: "350px"}}>
                                        <span>{value.firstname + " " + value.lastname}</span>
                                    </td>
                                    <td style={{width: "215px"}}>
                                        <span>{value.user_grade}</span>
                                    </td>
                                    <td style={{width: "182px"}}>
                                        <span>{value.status}</span>
                                    </td>
                                </tr>
                            ))}
                        </table>
                    </div>

                </div>
            </div>
        </div>
    )
}

export default PoliceList