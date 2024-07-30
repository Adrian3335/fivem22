import { Progress, Box, Text, Group } from '@mantine/core';

export const StatsBar = ({info}:any) => {
  return <Box style={{display: "block", width: "95%", marginLeft: "auto", marginRight: "auto"}} mb={10} p={5} mt={-10}>
    {Object.keys(info).map((field:any, index:number) => (
        <Box key={index} mt={10}>
            <Group grow w={"100%"}>
                <Text fw={500} fz={"md"} fs={"italic"} className='info-field'>{info[field].name}</Text>
                <Text fw={500} fz={"md"} ta={"right"} fs={"italic"} className='info-field'>{`${(Math.round((info[field].value / 100) * 100))} / 10`}</Text>
            </Group>
            <Progress color="cyan" size="xs" value={Math.round((info[field].value / 10) * 100)} />
        </Box>
    ))}
  </Box>
}