import {useState, useEffect} from 'react'
import { Carousel } from '@mantine/carousel';
import { Card } from './Card'
import { useNuiEvent, fetchNui } from "../../hooks/useNuiEvents";
import './style.css'

export const CarouselComponent = ({type, setType}:any) => {
  const [height, setHeight] = useState(0)
  const [data, setdata] = useState([])
  const [moneySign, setMoneySign] = useState("")
  useNuiEvent("setCarousel", (data:any) => {
    setdata([])
    setTimeout(() => {
      setType(data.type)
      setdata(data.elements)
      if(data.sign) {
        setMoneySign(data.sign)
      }
    }, 100);
  })
  useEffect(() => {
    setHeight(window.innerHeight) 
  }, [])
  const handleClick = (data:any) => {
    if(type == "categories") {
      const label = data.label
      fetchNui("av_vehicleshop", "openCategory", label)
    } else {
      const {name, label, stock} = data
      fetchNui("av_vehicleshop", "showVehicle", {name, label, stock})
    }
  }
  return <div style={{display: "flex", flexDirection: "column", justifyContent: "end", height: "100vh", width: "95%", marginLeft: "auto", marginRight: "auto"}}>
    {data && data[0] &&
      <Carousel dragFree mb={10} slideSize={height > 1000 ? "340px" : "280px"} align="start" slideGap="xs" controlsOffset={"sm"} controlSize={20}>
        {data.map((info:any, index:number) => (
          <Carousel.Slide key={index}>
            <Card info={info} type={type} height={height} handleClick={handleClick} sign={moneySign}/>
          </Carousel.Slide>
        ))}
      </Carousel>
    }
  </div>
}