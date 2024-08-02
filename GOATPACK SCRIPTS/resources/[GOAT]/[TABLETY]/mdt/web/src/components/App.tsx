import React, { useState } from 'react';
import './App.scss'
import {debugData} from "../utils/debugData";
import { useNuiEvent } from '../hooks/useNuiEvent';
import { fetchNui } from '../utils/fetchNui';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faChevronLeft, faChevronRight, faX, faSearch } from '@fortawesome/free-solid-svg-icons'

import NavBar from './NavBar';
import Home from './pages/Home/Home';
import Files from './pages/Files/Files';
import Annoucements from './pages/Annoucements/Annoucements'
import PoliceList from './pages/PoliceList/PoliceList';
import Notes from './pages/Notes/Notes';
import Dispatch from './pages/Dispatch/Dispatch';

import PlayerData from '../types/playerData';
import { useSetPlayerData } from '../state/playerData';
import { useLocale, useLocaleState } from '../state/locale';
import { useAnnoucements } from '../state/annoucements';
import { Annoucement } from '../types/annoucements';
import { usePoliceList } from '../state/policeList';
import { PoliceMan } from '../types/police';
import { useSetNotes } from '../state/notes';
import { TariffT } from '../types/tariff';
import { useSetTariff } from '../state/tariff';
import { useSetUnitsAndVehicles } from '../state/unitsAndVehicles';

// This will set the NUI to visible if we are
// developing in browser
debugData([
  {
    action: 'setVisible',
    data: true,
  }
])

debugData([
  {
    action: 'init',
    data: {
      locale: {
        ['UI_TABLET_NAME']: 'Police-MDT.com',
        ['MAIN_PAGE_TITLE']: 'Home',
        ['MAIN_PAGE_DESC']: 'Your data, last notes and simple notepad',
        ['FILES_PAGE_TITLE']: 'Files',
        ['FILES_PAGE_DESC']: 'Citizen and vehicle notes, data etc.',
        ['ANNOUCEMENTS_PAGE_TITLE']: 'Annoucements',
        ['ANNOUCEMENTS_PAGE_DESC']: 'Citizen and vehicle notes, data etc.',
        ['POLICE_PAGE_TITLE']: 'Police List',
        ['POLICE_PAGE_DESC']: 'Officers list and their status',
        ['DISPATCH_PAGE_TITLE']: 'Dispatch',
        ['DISPATCH_PAGE_DESC']: 'Dispatch, patrols data etc.',
        ['JOB_TITLE']: 'POLICE',
        ['MDT_TITLE']: 'MDT LSPD',
        ['MDT_DESC']: 'In MDT you can check citizen, vehicles and make fine',
        ['SETTINGS']: 'Settings',
        ['LOGOUT']: 'Logout',
        ['STATUS_AVAILABLE']: 'Available',
        ['STATUS_NOAVAILABLE']: 'No Available',
        ['STATUS_S2']: 'Status 2',
        ['STATUS_S5']: 'Status 5',
        ['STATUS_S4']: 'Status 4',
        ['STATUS_S8']: 'Status 8',
      },
      units: [
        'ADAM',
        'BOY'
      ],
      vehicles: [
        'Ford Crown Victoria',
        'Dodge Charger',
        'Dodge Ram'
      ],
      tariff: [
        {
          label: 'Wykroczenia drogowe',
          data: [
            {
              label: 'Przekroczenie prędkości',
              fine: 15000,
              jail: 0
            },
            {
              label: 'Jazda bez prawa jazdy',
              fine: 20000,
              jail: 0
            },
          ]
        },
        {
          label: 'Kradzieże i rabunki',
          data: [
            {
              label: 'Napad na sklep',
              fine: 25000,
              jail: 15
            },
            {
              label: 'Napad na jubileraDAWDAWDWADADAWDAWDAWDjubileraDAWDAWDWADADAWDAWDAWDjubileraDAWDAWDWADADAWDAWDAWD',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
            {
              label: 'Napad na jubilera',
              fine: 50000,
              jail: 30
            },
          ]
        }
      ]
    }
  }
])

debugData([
  {
    action: 'setPlayerData',
    data: {
      firstname: 'Chris',
      lastname: 'Frog',
      badge: '[01]',
      dutyTime: '00:00:00',
      job: {
        name: 'police',
        grade: 14,
        label: 'LSPD',
        grade_label: 'Chief of Police',
        onDuty: true
      }
    }
  }
])


const App: React.FC = () => {

  const setPlayerData = useSetPlayerData()
  const [Locale, setLocale] = useLocale()
  const [localeSetted, setLocaleSetted] = useState<boolean>(false)
  const setTariff = useSetTariff()
  const setUnitsAndVehicles = useSetUnitsAndVehicles()

  const [href, setHref] = useState<string>("home")

  useNuiEvent<{
    locale: { [key: string]: string };
    tariff: TariffT[];
    units: string[];
    vehicles: string[];
  }>('init', ({ locale, tariff, units, vehicles }) => {
    setTariff(tariff)
    const a = {
      units: units,
      vehicles: vehicles
    }
    setUnitsAndVehicles(a)
    const tempLocale = Locale
    for (const name in locale) {
      tempLocale[name] = locale[name]
    }
    setLocale(tempLocale)
    setLocaleSetted(true)
  });

  useNuiEvent<PlayerData>('setPlayerData', (data) => {
    setPlayerData(data)
  })

  const [annoucements, setAnnoucements] = useAnnoucements()
  useNuiEvent<Annoucement[]>('setAnnoucements', (data) => {
    setAnnoucements(data)
  })
  useNuiEvent<Annoucement>('addAnnoucement', (data) => {
    const tempAnnoun = annoucements
    tempAnnoun.push(data)
    setAnnoucements(tempAnnoun)
  })

  const setNotes = useSetNotes()
  useNuiEvent<Annoucement[]>('setNotes', (data) => {
    setNotes(data)
  })

  const [policeList, setPoliceList] = usePoliceList()
  useNuiEvent<PoliceMan[]>('setPoliceList', (data) => {
    setPoliceList(data)
  })

  if (!localeSetted) {
    fetchNui('uiLoaded', {});
  }

  const closeUI = () => {
    fetchNui("closeUI")
  }

  const event = new Event("goBack");

  const goBack = () => {
    dispatchEvent(event)
  }

  return (
    <div className="mdt-container">
      <div className='speakers'>
        <div className='circle'>

        </div>
        <div className='rectangle'>
          
        </div>
        <div className='circle'>
          
        </div>
      </div>
      <div className='mdt-screen'>
        <div className='mdt-topbar'>
          <div className='icons'>
            <FontAwesomeIcon icon={faChevronLeft} onClick={() => goBack()} style={{cursor: "pointer"}}/>
            {/* <FontAwesomeIcon icon={faChevronRight}/> */}
          </div>
          <div className='href'>
            <div style={{display: 'flex', justifyContent: 'center', width: '100%'}}>
              www.<span>{Locale['UI_TABLET_NAME'] || 'Police-MDT.com'}</span>/{href}/
            </div>
            <div className='search-icon'>
              <FontAwesomeIcon icon={faSearch}/>
            </div>
          </div>
          <div className='icons' onClick={() => closeUI()} style={{cursor: "pointer"}}>
            <FontAwesomeIcon icon={faX}/>
          </div>
        </div>
        <div className='mdt-page'>
          <NavBar href={href} setHref={setHref}/>

          {<div style={{display: href == "home" ? "block" : "none"}}>
            <Home setHref={setHref}/>
          </div>}

          {<div style={{display: href == "files" ? "block" : "none"}}>
            <Files/>
          </div>}

          {<div style={{display: href == "annoucements" ? "block" : "none"}}>
            <Annoucements/>
          </div>}

          {<div style={{display: href == "policelist" ? "block" : "none"}}>
            <PoliceList/>
          </div>}

          {<div style={{display: href == "dispatch" ? "block" : "none"}}>
            <Dispatch/>
          </div>}

          {<div style={{display: href == "notes" ? "block" : "none"}}>
            <Notes/>
          </div>}

        </div>
      </div>
    </div>
  );
}

export default App;
