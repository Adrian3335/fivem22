import React from "react";
import "./Modal.scss"
import { DeleteModalT } from "../../types/modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faX } from "@fortawesome/free-solid-svg-icons";

const ConfirmModal: React.FC<DeleteModalT> = (data) => {

    const submit = () => {
        data.onSubmit(data.extraData)
    }

    return (
        <>
            <div className="background" onClick={() => data.onCancel()}></div>
            <div className="modal-container delete-modal">
                <div className="modal-header">
                    <div className="modal-label">
                        {data.label}
                    </div>
                    <div className="modal-close" onClick={() => data.onCancel()}>
                        <FontAwesomeIcon icon={faX}/>
                    </div>
                </div>
                <div className="modal-content delete-modal">
                    {data.text}
                </div>
                <div className="modal-footer">
                    <div className="btn" onClick={() => submit()}>
                        {data.submitLabel}
                    </div>
                    <div className="btn" onClick={() => data.onCancel()}>
                        {data.cancelLabel}
                    </div>
                </div>
            </div>
        </>
    )
}

export default ConfirmModal