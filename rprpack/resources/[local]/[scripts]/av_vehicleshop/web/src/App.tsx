import { useState, useEffect } from 'react'
import '@mantine/core/styles.css';
import '@mantine/carousel/styles.css';
import './global.css'
import { MantineProvider } from '@mantine/core';
import { CarouselComponent } from "./components/Carousel/Carousel";
import { VehPanel } from "./components/VehPanel/VehPanel";
import { AdminPanel } from "./components/AdminPanel/AdminPanel";
import { useNuiEvent, fetchNui } from "./hooks/useNuiEvents";

const App = () => {
  const [showCarousel, setShowCarousel] = useState(false)
  const [showPanel, setShowPanel] = useState(false)
  const [type, setType] = useState("")
  const [allVehicles, setAllVehicles] = useState([])
  const [categories, setCategories] = useState([])
  const [showAdmin, setShowAdmin] = useState(false)
  const [lang, setLang] = useState({})
  useNuiEvent("openDealership", (data:any) => {
    setShowCarousel(data.state)
    setLang(data.lang)
  })
  useNuiEvent("openAdmin", (data:any) => {
    if(data.vehicles) {
      setAllVehicles(data.vehicles)
    }
    if(data.categories) {
      setCategories(data.categories)
    }
    if(data.lang) {
      setLang(data.lang)
    }
    setShowAdmin(data.state)
  })
  useNuiEvent("showDetails", (data:any) => {
    setShowPanel(data.state)
  })
  useNuiEvent("openTuner", () => {
    setShowCarousel(false)
    setShowPanel(false)
  })
  useNuiEvent("close", () => {
    setShowCarousel(false)
    setShowPanel(false)
  })
  const onEscKey = (e:any) => {
    if (e.key === 'Escape') {
      if(showAdmin) {
        setShowAdmin(false)
        fetchNui("av_vehicleshop", "closeAdmin")
        return
      }
      if(type == "categories") {
        setShowPanel(false)
        setShowCarousel(false)
        fetchNui("av_vehicleshop", "close")
      } else {
        setShowPanel(false)
        fetchNui("av_vehicleshop", "showCategories")
      }
    }
  }
  useEffect(() => {
    window.addEventListener('keydown', onEscKey)
    return () => {
      window.removeEventListener('keydown', onEscKey)
    }
  }, [type || showAdmin]);
  return (
    <MantineProvider defaultColorScheme='dark'>
      {showPanel && <VehPanel lang={lang}/>}
      {showCarousel && <CarouselComponent type={type} setType={setType} lang={lang}/>}
      {showAdmin && <AdminPanel allVehicles={allVehicles} categories={categories} lang={lang}/>}
    </MantineProvider>
  )
}
export default App