import React, {useEffect, useRef, useState} from "react";
import "./Notes.scss"
import { debugData } from "../../../utils/debugData";
import TitleBlock from "../../TitleBlock";
import { useNotes } from "../../../state/notes";
import { Annoucement } from "../../../types/annoucements";
import { fetchNui } from "../../../utils/fetchNui";
import DoubleModal from "../../Modals/DoubleModal";
import DeleteModal from "../../Modals/DeleteModal";

debugData([
    {
        action: 'setNotes',
        data: [
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                id: 5,
                title: "tresc",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
            {
                title: "Tytuł",
                content: "Text Text Text Text Text Text Text"
            },
        ]
    }
])

const Notes: React.FC = () => {

    const [modal, setModal] = useState<boolean>(false)
    const [searchedNotes, setSearchedNotes] = useState<Annoucement[]>([])
    const [notes, setNotes] = useNotes()
    const search = useRef<HTMLInputElement>(null)
    const [deleteModal, setDeleteModal] = useState<boolean>(false)
    const [clickedNote, setClickedNote] = useState<any>(null)

    useEffect(() => {
        if (search.current && search.current.value && search.current.value.length > 0) {
            const value: string = search.current.value.toLocaleLowerCase()
            const newNotes = notes.filter((e: Annoucement) => {
                return e.title.toLocaleLowerCase().includes(value) || e.content.toLocaleLowerCase().includes(value)
            })
            setSearchedNotes(newNotes)
        } else {
            setSearchedNotes(notes)
        }
    }, [notes])

    const updateNotes = () => {
        if (search.current && search.current.value && search.current.value.length > 0) {
            const value: string = search.current.value.toLocaleLowerCase()
            const newNotes = notes.filter((e: Annoucement) => {
                return e.title.toLocaleLowerCase().includes(value) || e.content.toLocaleLowerCase().includes(value)
            })
            setSearchedNotes(newNotes)
        } else {
            setSearchedNotes(notes)
        }
    }

    const onSubmit = (title: string, content: string) => {
        setModal(false)
        const tempNotes = notes
        tempNotes.push({title, content, index: 0})
        setNotes(tempNotes)
        fetchNui('addNote', {title, content})
    }

    const onCancel = () => {
        setModal(false)
    }

    const deleteNote = (data: any) => {
        setClickedNote(null)
        setDeleteModal(false)
        if (!data) return;
        const tempNotes = notes
        const id = tempNotes.findIndex((e) => e.id == data)
        if (id && id !== -1) {
            tempNotes.splice(id, 1)
            setNotes(tempNotes)
            fetchNui('deleteNote', {id: data})
        }
    }

    return (
        <>
            {modal && <DoubleModal label="Dodaj notatkę" onSubmit={onSubmit} onCancel={onCancel} firstPlaceholder="Tytuł notatki..." secondPlaceholder="Treść notatki..." submitLabel="Dodaj notatkę" />}
            {deleteModal && <DeleteModal label="Usuwanie notatki" onSubmit={deleteNote} onCancel={() => {setDeleteModal(false); setClickedNote(null)}} text="Czy na pewno chcesz usunąć notatkę?" submitLabel="Usuń" cancelLabel="Anuluj" extraData={clickedNote}/>}
            <div className="notes-container">
                <div className="notes">
                    <TitleBlock text="Ogłoszenia"/>
                    <input className="search-container" placeholder="Wyszukaj notatki..." ref={search} onInput={() => updateNotes()} />
                    <div className="container">
                        <div className="notes-header">
                            <span style={{width: "265px"}}>
                                Tytuł Notatki
                            </span>
                            <span style={{width: "636px"}}>
                                Treść Notatki
                            </span>
                        </div>

                        <div className="notes-results">
                            <table>
                                {searchedNotes.map((value, index) => (
                                    <tr key={index} className="notes-row" onClick={() => {setDeleteModal(true); setClickedNote(value.id)}}>
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
                            <div className="btn" onClick={() => setModal(true)}>
                                Dodaj notatkę
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </>
    )
}

export default Notes