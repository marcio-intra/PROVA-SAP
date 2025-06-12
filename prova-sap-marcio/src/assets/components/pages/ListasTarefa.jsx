import React, { useState } from "react";
import { Button, Form, FormGroup, Label, Input } from "reactstrap";

const ListasTarefa = () => {
  const [lista, setLista] = useState({
    usuario: '',
    tarefa: '',
    setor: '',
    prioridade: 'baixa',
    status: 'a fazer',
    dataReserva: new Date().toISOString().split('T')[0]
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setLista(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Lógica para salvar lista de tarefas
    alert('Lista de tarefas salva com sucesso!');
    setLista({ 
      usuario: '',
      tarefa: '',
      setor: '',
      prioridade: 'baixa',
      status: 'a fazer',
      dataReserva: new Date().toISOString().split('T')[0]
    });
  };

  const handleExcluir = () => {
    // Lógica para excluir lista sem excluir usuário/tarefa
    alert('Lista excluída (usuário e tarefa permanecem)');
  };

  return (
    <div>
      <h2 className="mb-4">Lista de Tarefas</h2>
      <Form onSubmit={handleSubmit}>
        <FormGroup floating>
          <Input
            id="usuario"
            name="usuario"
            type="text"
            value={lista.usuario}
            onChange={handleChange}
            required
          />
          <Label for="usuario">Usuário</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="tarefa"
            name="tarefa"
            type="text"
            value={lista.tarefa}
            onChange={handleChange}
            required
          />
          <Label for="tarefa">Tarefa</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="setor"
            name="setor"
            type="text"
            value={lista.setor}
            onChange={handleChange}
            required
          />
          <Label for="setor">Setor</Label>
        </FormGroup>
        <FormGroup>
          <Label for="prioridade">Prioridade</Label>
          <Input
            id="prioridade"
            name="prioridade"
            type="select"
            value={lista.prioridade}
            onChange={handleChange}
          >
            <option value="baixa">Baixa</option>
            <option value="média">Média</option>
            <option value="alta">Alta</option>
          </Input>
        </FormGroup>
        <FormGroup>
          <Label for="status">Status</Label>
          <Input
            id="status"
            name="status"
            type="select"
            value={lista.status}
            onChange={handleChange}
          >
            <option value="a fazer">A fazer</option>
            <option value="fazendo">Fazendo</option>
            <option value="pronto">Pronto</option>
          </Input>
        </FormGroup>
        <FormGroup>
          <Label for="dataReserva">Data de Reserva</Label>
          <Input
            id="dataReserva"
            name="dataReserva"
            type="date"
            value={lista.dataReserva}
            onChange={handleChange}
            required
          />
        </FormGroup>
        <Button color="primary" type="submit" className="me-2">Salvar</Button>
        <Button color="danger" onClick={handleExcluir}>Excluir Lista</Button>
      </Form>
    </div>
  );
};

export default ListasTarefa;
