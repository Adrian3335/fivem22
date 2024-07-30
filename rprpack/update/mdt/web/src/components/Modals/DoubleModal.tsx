import React, { useRef } from "react";
import "./Modal.scss"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faX } from "@fortawesome/free-solid-svg-icons";
import { DoubleModalT } from "../../types/modal";

const DoubleModal: React.FC<DoubleModalT> = ({label, onSubmit, onCancel, firstPlaceholder, secondPlaceholder, submitLabel}) => {
    
    const firstRef = useRef<HTMLInputElement>(null)
    const secondRef = useRef<HTMLTextAreaElement>(null)
    
    const submit = () => {
        if (!firstRef.current) return;
        if (!secondRef.current) return;
        const firstValue: string = firstRef.current.value
        const secondValue: string = secondRef.current.value
        if (!firstValue || !secondValue) return;
        onSubmit(firstValue, secondValue)
        firstRef.current.value = ""
        secondRef.current.value = ""
    }

    return (
        <>
            <div className="background" onClick={() => onCancel()}></div>
            <div className="modal-container">
                <div className="modal-header">
                    <div className="modal-label">
                        {label}
                    </div>
                    <div className="modal-close" onClick={() => onCancel()}>
                        <FontAwesomeIcon icon={faX}/>
                    </div>
                </div>
                <div className="modal-content">
                    <input placeholder={firstPlaceholder} ref={firstRef}/>
                    <textarea placeholder={secondPlaceholder} ref={secondRef}>

                    </textarea>
                </div>
                <div className="modal-footer">
                    <div className="btn" onClick={() => submit()}>
                        {submitLabel}
                    </div>
                </div>
            </div>
        </>
    )
}

export default DoubleModal