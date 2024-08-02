import React from "react";
import './TitleBlock.scss'

const TitleBlock: React.FC<{text: string}> = ({text}) => {
    return (
        <div className="title-container">
            <div className="title-text">
                {text}
            </div>
            <div className="title-line"></div>
        </div>
    )
}

export default TitleBlock