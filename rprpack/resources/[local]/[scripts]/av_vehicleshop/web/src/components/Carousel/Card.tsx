import { useEffect, useState } from 'react'
import { Box, Text, Group, Title} from '@mantine/core'
import { checkIfImageExists } from "../../hooks/imageExists";
import { IconBox, IconPackageOff } from '@tabler/icons-react';

export const Card = ({info, type, height, handleClick, sign}:any) => {
  const [image, setImage] = useState("")
  const [loaded, setLoaded] = useState(false)
  const [isLocal, setIsLocal] = useState(false)
  useEffect(() => {
    const checkImage = async () => {
      try {
        const exists = await checkIfImageExists(`vehicles/${info.name}.png`);
        if (exists) {
          setImage(`vehicles/${info.name}.png`)
          setIsLocal(true)
          setLoaded(true)
        } else {
          const fivem = await checkIfImageExists(`https://docs.fivem.net/vehicles/${info.name}.webp`);
          if (fivem) {
            setImage(`https://docs.fivem.net/vehicles/${info.name}.webp`)
          } else {
            setImage(`https://i.imgur.com/KzeajsO.png`)
          }
          setLoaded(true)
        }
      } catch (error) {
        setImage(`https://i.imgur.com/KzeajsO.png`)
        setLoaded(true)
      }
    };
    if (type !== "categories") checkImage();
  }, [info.name])
  return (
    <Box className="card" style={{display: type == "categories" ? "flex" : "block", backgroundColor: isLocal ? "transparent" : "rgba(20, 21, 23, 0.95)", width: height > 1000 ? "340px" : "280px", height: height > 1000 ? "200px" : "140px"}} onClick={()=>{handleClick(info)}}>
        {type == "categories" ?
          <>
            {info?.label && <Box className={type == "categories" ? "category-label" : "vehicle-label"}>{info?.label}</Box>}
          </>
          :
          <>
            {loaded &&
              <>
                <Group justify='space-between'>
                  <Box className='veh-stock' style={{zIndex: 99}}>
                    <>{info.stock > 0 ? <IconBox color="rgba(240,240,240,0.5)" size={18} stroke={2}/> : <IconPackageOff color="rgba(240,240,240,0.5)" size={18} stroke={2}/>}</>
                    <Text c="gray.3" fw={500} ml={5}>{info.stock}</Text>
                  </Box>
                  <Box className='veh-price' style={{zIndex: 99}}>
                    <Title fw={500} order={2} c="yellow.3" fs="italic">{`${sign}${info.price.toLocaleString("en-US")}`}</Title>
                  </Box>
                </Group>
                <Box className='veh-label' style={{zIndex: 99}}>
                  <Title fw={500} order={2} c="gray.3" tt={"capitalize"} fs="italic">{info.label}</Title>
                </Box>
                <Box
                  h={"100%"}
                  w={"100%"}
                  style={{
                    background: isLocal ? `url(${image})` : `no-repeat center url(${image})`,
                    backgroundSize: isLocal ? "100% 100%" : "50%",
                    position: "absolute",
                    zIndex: 0,
                    top: "50%",
                    left: isLocal ? "48.2%" : "50%",
                    transform: "translate(-50%, -50%)",
                    maxWidth: height > 1000 ? "342px" : "280px",
                    maxHeight: "100vh"
                  }}
                />
              </>
            }
          </>
        }
    </Box>
  )
}