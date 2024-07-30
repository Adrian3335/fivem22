import { useState } from 'react';
import {
  Table,
  ScrollArea,
  ActionIcon,
  Group,
  Text,
  TextInput,
  Select,
  rem,
} from '@mantine/core';
import { IconSearch, IconEdit, IconEraser, IconPlus } from '@tabler/icons-react';
import { useNuiEvent } from "../../hooks/useNuiEvents";

export function TableData({data, categories, handleAction, lang}:any) {
  const [currentVehicles, setCurrentVehicles] = useState([]);
  const [currentCategory, setCurrentCategory] = useState<string | null>(null)
  useNuiEvent("refreshVehicles", () => {
    handleCategory(currentCategory)
  })
  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { value } = event.currentTarget;
    if (value == '') {
        handleCategory(currentCategory)
        return
    }
    const newList = data.filter((data: any) => {
        const lowercaseValue = value.toLowerCase();
        if (lowercaseValue !== '' && data.category.toLowerCase().includes(currentCategory)) {
            if(data.name.toLowerCase().includes(lowercaseValue)) return true;
        } else {
            return data.category.toLowerCase().includes(currentCategory);
        }
    });
    if (newList[0]) {
        setCurrentVehicles(newList)
    } else {
        setCurrentVehicles([])
    }
  };

  const handleCategory = (value:any) => {
    setCurrentCategory(value)
    const newList = data.filter((data:any) => {
      if (value !== null) {
        return data.category.toLowerCase() == value.toLowerCase();
      }
    });
    setCurrentVehicles(newList)
  }
  const rows = currentVehicles.map((row:any, index:number) => (
    <Table.Tr key={index}>
      <Table.Td >{row.name}</Table.Td>
      <Table.Td >{row.price}</Table.Td>
      <Table.Td >{row.category}</Table.Td>
      <Table.Td >{row.stock}</Table.Td>
      <Table.Td p={0}>
        <Group>
            <ActionIcon size={"sm"} variant='subtle' onClick={()=>{handleAction("edit", row)}}>
                <IconEdit size={16}/>
            </ActionIcon>
            <ActionIcon size={"sm"} variant='subtle' color='red' onClick={()=>{handleAction("delete", row)}}>
                <IconEraser size={16}/>
            </ActionIcon>
        </Group>
      </Table.Td>
    </Table.Tr>
  ));

  return (
    <>
      <Group justify='center'>
        <Select
            placeholder={lang.select_category}
            data={categories}
            value={currentCategory}
            onChange={handleCategory}
            searchable
            maw={"40%"}
        />
        <ActionIcon variant='light' size={"md"} color='blue.3' onClick={()=>{handleAction("add")}}>
            <IconPlus size={14}/>
        </ActionIcon>
        <TextInput
            placeholder={lang.search}
            leftSection={<IconSearch style={{ width: rem(16), height: rem(16) }} stroke={1.5} />}
            onChange={(e) => {handleSearchChange(e)}}
            maw={"40%"}
        />
      </Group>
        <ScrollArea h={400}>
            <Table horizontalSpacing="xs" verticalSpacing="xs" layout="auto" withRowBorders={false} stickyHeader>
                <Table.Tbody>
                    <Table.Tr>
                        <Table.Th>
                            <Text fw={500} fz="sm">{lang.table_name}</Text>
                        </Table.Th>
                        <Table.Th>
                            <Text fw={500} fz="sm">{lang.table_price}</Text>
                        </Table.Th>
                        <Table.Th>
                            <Text fw={500} fz="sm">{lang.table_category}</Text>
                        </Table.Th>
                        <Table.Th>
                            <Text fw={500} fz="sm">{lang.table_stock}</Text>
                        </Table.Th>
                        <Table.Th>
                            <Text fw={500} fz="sm">{lang.table_actions}</Text>
                        </Table.Th>
                    </Table.Tr>
                </Table.Tbody>
                <Table.Tbody>
                    {rows.length > 0 ? (
                        rows
                    ) : (
                        <Table.Tr>
                        <Table.Td colSpan={5}>
                            {!currentCategory ?
                                <Text fw={500} ta="center" c="dimmed">
                                    {lang.default_description}
                                </Text>
                            :
                                <Text fw={500} ta="center" c="dimmed">
                                    {lang.empty}
                                </Text>
                            }
                        </Table.Td>
                        </Table.Tr>
                    )}
                </Table.Tbody>
            </Table>
        </ScrollArea>
    </>
  );
}