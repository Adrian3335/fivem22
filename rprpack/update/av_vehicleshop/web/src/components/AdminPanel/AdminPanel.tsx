import {useState} from 'react'
import { Box, Title } from '@mantine/core'
import './style.css'
import { TableData } from './TableData'
import {ModalMenu} from '../ModalMenu'
import { fetchNui } from '../../hooks/useNuiEvents'


export const AdminPanel = ({allVehicles, categories, lang}:any) => {
  const [showModal, setShowModal] = useState(false)
  const [modalOptions, setModalOptions] = useState({})
  const handleAction = (action:string, data:any) => {
    if (action == "add") {
      setModalOptions({
        title: lang.add_title,
        options: [
            {name: "name", icon: "fa-solid fa-notes-medical", title: lang.model_title, description: lang.model_description, placeholder: lang.model_placeholder, type: "text", asterisk: true},
            {name: "category", icon: "fa-solid fa-layer-group", title: lang.category_title, type: "text", placeholder: lang.category_placeholder, asterisk: true},
            {name: "price", icon: "fa-solid fa-tags", title: lang.price_title, type: "number", asterisk: true},
            {name: "stock", icon: "fa-solid fa-box", title: lang.stock_title, type: "number", asterisk: true},
        ],
        button: lang.confirm_button,
        extraData: {event: "addVehicle"}
      })
      setShowModal(true)
      return
    }
    if (action == "delete") {
      setModalOptions({
        title: `${lang.delete_title} ${data.name}`,
        options: [
            {description: lang.delete_confirmation, type: "info"},
        ],
        button: lang.confirm_button,
        extraData: {event: "deleteVehicle", name: data.name, category: data.category}
      })
      setShowModal(true)
      return
    }
    if (action == "edit") {
      setModalOptions({
        title: `${lang.edit_title} ${data.name}`,
        options: [
            {name: "category", icon: "fa-solid fa-layer-group", title: lang.category_title, type: "text", default: data.category},
            {name: "price", icon: "fa-solid fa-tags", title: lang.price_title, type: "number", default: data.price},
            {name: "stock", icon: "fa-solid fa-box", title: lang.stock_title, type: "number", default: data.stock},
        ],
        button: lang.confirm_button,
        extraData: {event: "editVehicle", name: data.name, category: data.category}
      })
      setShowModal(true)
      return
    }
  }
  const callback = (data:any) => {
    if (data?.extraData?.event) {
      fetchNui("av_vehicleshop", data.extraData.event, data)
    }
    setShowModal(false)
  }
  return <>
  {showModal && <ModalMenu data={modalOptions} callback={callback}/>}
    <Box className='admin-container'>
      <Title order={2} mb={10} ta={"center"}>{lang.panel_name}</Title>
      <TableData data={allVehicles} categories={categories} handleAction={handleAction} lang={lang}/>
    </Box>
  </>
}