import {useState, useEffect} from 'react'
import { Modal, Divider, Title, Button, NumberInput, TextInput, Image, Textarea, Select, Text, MultiSelect, PasswordInput, Switch } from '@mantine/core';
import './style.css'

export const ModalMenu = ({data, callback}:any) => {
  const [fieldsValues, setFieldsValues] = useState([]);
  const handleInput = (name:string, value:any) => {
    const newValue = { ...fieldsValues, [name]: value };
    setFieldsValues(newValue);
  };
  useEffect(() => {
    if(data?.extraData){
      const newValue = { ...fieldsValues, ["extraData"]: data.extraData };
      setFieldsValues(newValue);
    }
  }, [data])

  return <>
    <Modal.Root opened={true} onClose={()=>{callback()}} size={"350px"} radius={5} centered shadow={"xs"} withinPortal>
        <Modal.Overlay />
        <Modal.Content>
          <Modal.Header>
              <Title order={4} style={{width: "100%", textAlign: "center"}}>{data.title}</Title>
              <Modal.CloseButton />
          </Modal.Header>
          <Divider/>
          <Modal.Body>
            <span className='modal-options'>
              {data.options?.map((option:any,index:number) => (
                <span key={index} style={{display: "block", marginTop: "5px"}}>
                    {option.type == "number" &&
                      <NumberInput
                        leftSection={<>{option.icon && <i className={option.icon}/>}</>}
                        description={option.description}
                        placeholder={option.placeholder}
                        label={option.title}
                        onChange={(e)=>{handleInput(option.name,e)}}
                        disabled={option.disabled}
                        style={option.style}
                        withAsterisk={option.asterisk}
                        defaultValue={option.default}
                      />
                    }
                    {option.type == "text" &&
                      <TextInput
                        leftSection={<>{option.icon && <i className={option.icon}/>}</>}
                        description={option.description}
                        placeholder={option.placeholder}
                        defaultValue={option.default}
                        label={option.title}
                        onChange={(e)=>{handleInput(option.name,e.target.value)}}
                        disabled={option.disabled}
                        style={option.style}
                        withAsterisk={option.asterisk}
                      />
                    }
                    {option.type == "image" && 
                      <Image
                        src={option.image}
                        height={option.height}
                        alt={option.title}
                        style={option.style}
                        radius={10}
                        fit="contain"
                        fallbackSrc={option.default}
                      />
                    }
                    {
                      option.type == "textarea" &&
                      <Textarea
                        defaultValue={option.description}
                        label={option.label}
                        disabled={option.disabled}
                        style={option.style}
                        maxRows={4}
                        autosize
                        onChange={(e)=>{handleInput(option.name,e.target.value)}}
                        withAsterisk={option.asterisk}
                      />
                    }
                    {option.type == "info" &&
                      <Text style={option.style}>{option.description}</Text>
                    }
                    {option.type == "select" &&
                      <Select
                        label={option.title}
                        defaultValue={option.default}
                        data={option.options}
                        onChange={(value)=>{handleInput(option.name,value)}}
                        style={option.style}
                        withAsterisk={option.asterisk}
                        searchable={option.searchable}
                      />
                    }
                    {option.type == "multiselect" &&
                      <MultiSelect
                        label={option.title}
                        data={option.options}
                        onChange={(value)=>{handleInput(option.name,value)}}
                        style={option.style}
                        withAsterisk={option.asterisk}
                        maxValues={option.max}
                        searchable={option.searchable}
                        defaultValue={option.default}
                      />
                    }
                    {option.type == "password" &&
                      <PasswordInput
                        leftSection={<>{option.icon && <i className={option.icon}/>}</>}
                        description={option.description}
                        placeholder={option.placeholder}
                        label={option.title}
                        withAsterisk={option.asterisk}
                        onChange={(event) => handleInput(option.name,event.currentTarget.value)}
                      />
                    }
                    {option.type == "switch" &&
                      <Switch
                        label={option.title}
                        defaultChecked={option.default}
                        checked={fieldsValues[option.name]} 
                        onChange={(event) => handleInput(option.name,event.currentTarget.checked)} 
                        style={option.style}
                      />
                    }
                </span>
              ))}
            </span>
            {data.button &&
              <span className='modal-button'>
                <Button size="sm" onClick={
                  ()=>{
                    callback(fieldsValues)
                  }
                }>{data.button}</Button>
              </span>
            }
          </Modal.Body>
        </Modal.Content>
    </Modal.Root>
  </>
}