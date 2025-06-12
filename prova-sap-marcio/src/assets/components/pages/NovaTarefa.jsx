import React, { useState } from "react";
import { Button, Form, FormGroup, Label, Input } from "reactstrap";

const NovaTarefa = () => {
  const [tarefa, setTarefa] = useState({
    titulo: '',
    setor: '',
    prioridade: 'baixa',
    usuario: '',
    status: 'a fazer',
    dataCadastro: new Date().toISOString().split('T')[0]
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setTarefa(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Lógica para salvar nova tarefa
    alert('Tarefa cadastrada com sucesso!');
    setTarefa({ 
      titulo: '', 
      setor: '', 
      prioridade: 'baixa', 
      usuario: '',
      status: 'a fazer',
      dataCadastro: new Date().toISOString().split('T')[0]
    });
  };

  return (
    <div>
      <h2 className="mb-4">Cadastrar Nova Tarefa</h2>
      <Form onSubmit={handleSubmit}>
        <FormGroup floating>
          <Input
            id="titulo"
            name="titulo"
            type="text"
            value={tarefa.titulo}
            onChange={handleChange}
            required
          />
          <Label for="titulo">Título</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="setor"
            name="setor"
            type="text"
            value={tarefa.setor}
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
            value={tarefa.prioridade}
            onChange={handleChange}
          >
            <option value="baixa">Baixa</option>
            <option value="média">Média</option>
            <option value="alta">Alta</option>
          </Input>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="usuario"
            name="usuario"
            type="text"
            value={tarefa.usuario}
            onChange={handleChange}
            required
          />
          <Label for="usuario">Usuário Responsável</Label>
        </FormGroup>
        <FormGroup>
          <Label for="status">Status</Label>
          <Input
            id="status"
            name="status"
            type="select"
            value={tarefa.status}
            onChange={handleChange}
          >
            <option value="a fazer">A fazer</option>
            <option value="fazendo">Fazendo</option>
            <option value="pronto">Pronto</option>
          </Input>
        </FormGroup>
        <FormGroup>
          <Label for="dataCadastro">Data de Cadastro</Label>
          <Input
            id="dataCadastro"
            name="dataCadastro"
            type="date"
            value={tarefa.dataCadastro}
            onChange={handleChange}
            required
          />
        </FormGroup>
        <Button color="primary" type="submit">Salvar</Button>
      </Form>
    </div>
  );
};

export default NovaTarefa;
