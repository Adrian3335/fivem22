import React, { Dispatch, SetStateAction } from "react";
import './Navbar.scss'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHome, faFolderOpen, faBullhorn, faHandcuffs, faCircleInfo } from '@fortawesome/free-solid-svg-icons'
import { fetchNui } from "../utils/fetchNui";
import { useLocaleState } from "../state/locale";

interface navElement {
    icon: any,
    title: string,
    subtitle: string,
    href: string
}

const NavBar: React.FC<{href: string, setHref: Dispatch<SetStateAction<string>>}> = ({href, setHref}) => {

    const Locale = useLocaleState()

    const navigations: navElement[] = [
        {
            icon: faHome,
            title: Locale['MAIN_PAGE_TITLE'] || 'Home',
            subtitle: Locale['MAIN_PAGE_DESC'] || '',
            href: 'home'
        },
        {
            icon: faFolderOpen,
            title: Locale['FILES_PAGE_TITLE'] || 'Files',
            subtitle: Locale['FILES_PAGE_DESC'] || '',
            href: 'files'
        },
        {
            icon: faBullhorn,
            title: Locale['ANNOUCEMENTS_PAGE_TITLE'] || 'Annoucements',
            subtitle: Locale['ANNOUCEMENTS_PAGE_DESC'] || '',
            href: 'annoucements'
        },
        {
            icon: faHandcuffs,
            title: Locale['POLICE_PAGE_TITLE'] || 'Police List',
            subtitle: Locale['POLICE_PAGE_DESC'] || '',
            href: 'policelist'
        },
        {
            icon: faCircleInfo,
            title: Locale['DISPATCH_PAGE_TITLE'] || 'Dispatch',
            subtitle: Locale['DISPATCH_PAGE_DESC'] || '',
            href: 'dispatch'
        },
    ]

    const closeUI = () => {
        fetchNui("closeUI")
    }

    const NavigationButton: React.FC<{data: navElement}> = ({data}) => {
        return (
            <div className={"navbar-button " + (data.href == href ? 'selected' : '')} onClick={() => setHref(data.href)}>
                <div className="navbar-icon">
                    <FontAwesomeIcon icon={data.icon}/>
                </div>
                <div className="navbar-desc">
                    <p className="navbar-title">{data.title}</p>
                    <p className="navbar-subtitle">{data.subtitle}</p>
                </div>
            </div>
        )
    }

    return (
        <div className="navbar">
            <div className="logo">
                <div className="logo-title">
                    <p style={{color: '#316BFF'}}>{Locale['JOB_TITLE'] || 'POLICE'}</p>
                    <p>{Locale['MDT_TITLE'] || 'MDT LSPD'}</p>
                </div>
                <div className="logo-rectangle">

                </div>
                <div className="logo-subtitle">
                    {Locale['MDT_DESC'] || ''}
                </div>
            </div>

            <div className="navigation">
                {navigations.map((value, index) => (
                    <NavigationButton key={index} data={value}/>
                ))}
            </div>
            <div className="nav-footer">
                <button onClick={() => setHref("notes")}>
                    NotePad
                </button>
                <button className="long" onClick={() => closeUI()}>
                    {Locale['LOGOUT'] || 'Logout'}
                </button>
            </div>
        </div>
    )
}

export default NavBar