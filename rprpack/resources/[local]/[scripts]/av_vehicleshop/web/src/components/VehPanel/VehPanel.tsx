import { useState, useEffect } from 'react'
import { useNuiEvent, fetchNui } from "../../hooks/useNuiEvents";
import { Box, Title, Group, Flex, Text, Center, Button } from '@mantine/core';
import { IconGauge, IconUsers } from '@tabler/icons-react';
import { StatsBar } from "./StatsBar";
import './style.css'

interface InfoProperties {
    name?: string,
    brand?: string,
    label?: string,
    class?: string,
    info?: {},
    speed?: number,
    unit?: string,
    seats?: number,
    tuning?: boolean,
    buy?: boolean,
    test?: boolean,
    stock: number,
}

export const VehPanel = ({lang}:any) => {
  const [height, setHeight] = useState(0)
  const [info, setInfo] = useState<InfoProperties | null>(null)
  useNuiEvent("vehData", (data) => {
    setInfo(data.vehData)
  })
  const handleClick = (event:string, info:any) => {
    fetchNui("av_vehicleshop", event, {name: info.name, stock: info.stock})
  }
  useEffect(() => {
    setHeight(window.innerHeight) 
  }, [])
  
  return <div>
    {info ?
        <Flex
          justify="flex-end"
          align="flex-start"
          direction="column"
          wrap="nowrap"
          className="info-container"
          style={{scale: height < 1000 ? "0.85" : "1", marginTop: height > 1000 ? "1%" : "unset", marginLeft: height > 1000 ? "1%" : "unset"}}
        >
          <Box className='info-header'>
            <Group grow w={"100%"} p={5} style={{borderTop: "solid 2px rgba(255,255,255,0.5)"}}>
              <Flex
                justify="flex-end"
                align="flex-start"
                direction="column"
                wrap="nowrap"
              >
                <Text tt={"uppercase"} fs={"italic"} className='info-brand'>{info?.brand}</Text>
                <Text c="dimmed" fz={20} mt={-10} tt={"uppercase"} className='info-name' truncate>{info?.label}</Text>
              </Flex>
              <Title mt={9} order={1} ta={"right"} className='info-class'>{info?.class}</Title>
            </Group>
          </Box>
          <StatsBar info={info['info']}/>
          <Group grow w={"100%"} p={5} mb={10}>
            <Center>
              <IconGauge size="0.95rem"/>
              <Text ml={5} tt={"uppercase"} className='info-field'>{`${info?.speed} ${info?.unit}`}</Text>
            </Center>
            <Center>
              <IconUsers size="0.95rem"/>
              <Text ml={5} className='info-field'>{`${info?.seats} ${lang.seats}`}</Text>
            </Center>
          </Group>
          {info?.buy && 
            <Button 
              className="buyButton" 
              c={info?.stock <= 0 ? "dimmed" : "gray.3"} 
              color={info?.stock <= 0 ? "dark.7" : "teal.7"} 
              w={"95%"} 
              style={{
                marginLeft: "auto", 
                marginRight: "auto"
              }} 
              onClick={()=>{handleClick("buyVehicle", info)}} 
              disabled={(info?.stock <= 0)}
            >
              {info?.stock <= 0 ? lang?.no_stock : lang?.buy_button}
            </Button>}
          {info?.tuning && <Button color="cyan" w={"95%"} style={{marginLeft: "auto", marginRight: "auto"}} mt={10} onClick={()=>{handleClick("tuningVehicle", info)}}>{lang?.tuning_button}</Button>}
          {info?.test && <Button w={"95%"} style={{marginLeft: "auto", marginRight: "auto"}} mt={10} mb={10} onClick={()=>{handleClick("testDrive", info)}}>{lang?.test_button}</Button>}
        </Flex>
      :
      null
    }
  </div>
}