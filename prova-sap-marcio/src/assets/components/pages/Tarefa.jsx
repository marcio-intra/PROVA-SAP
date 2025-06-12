import React, { useState } from "react";
import { Table, Button, Modal, ModalHeader, ModalBody, ModalFooter } from "reactstrap";

const Tarefa = () => {
  const [tarefas, setTarefas] = useState([
    { 
      id: 1, 
      titulo: "Implementar login", 
      setor: "Desenvolvimento", 
      prioridade: "alta", 
      usuario: "João Silva",
      status: "a fazer",
      dataCadastro: "2023-01-01"
    },
    { 
      id: 2, 
      titulo: "Atualizar documentação", 
      setor: "Qualidade", 
      prioridade: "média", 
      usuario: "Maria Souza",
      status: "fazendo",
      dataCadastro: "2023-01-02"
    }
  ]);
  
  const [modalEditar, setModalEditar] = useState(false);
  const [tarefaEditando, setTarefaEditando] = useState(null);

  const toggleEditar = () => setModalEditar(!modalEditar);

  const handleEditar = (tarefa) => {
    setTarefaEditando(tarefa);
    toggleEditar();
  };

  const handleExcluir = (id) => {
    setTarefas(tarefas.filter(tarefa => tarefa.id !== id));
  };

  const handleSalvarEdicao = () => {
    // Lógica para salvar edição
    toggleEditar();
  };

  return (
    <div>
      <h2 className="mb-4">Tarefas Cadastradas</h2>
      <Table striped responsive>
        <thead>
          <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Setor</th>
            <th>Prioridade</th>
            <th>Usuário</th>
            <th>Status</th>
            <th>Data Cadastro</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          {tarefas.map(tarefa => (
            <tr key={tarefa.id}>
              <td>{tarefa.id}</td>
              <td>{tarefa.titulo}</td>
              <td>{tarefa.setor}</td>
              <td>{tarefa.prioridade}</td>
              <td>{tarefa.usuario}</td>
              <td>{tarefa.status}</td>
              <td>{tarefa.dataCadastro}</td>
              <td>
                <Button color="primary" size="sm" onClick={() => handleEditar(tarefa)}>
                  Editar
                </Button>{' '}
                <Button color="danger" size="sm" onClick={() => handleExcluir(tarefa.id)}>
                  Excluir
                </Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>

      <Modal isOpen={modalEditar} toggle={toggleEditar}>
        <ModalHeader toggle={toggleEditar}>Editar Tarefa</ModalHeader>
        <ModalBody>
          {tarefaEditando && (
            <div>
              <div className="form-group">
                <label>Título</label>
                <input 
                  type="text" 
                  className="form-control" 
                  value={tarefaEditando.titulo} 
                  onChange={(e) => setTarefaEditando({...tarefaEditando, titulo: e.target.value})}
                />
              </div>
              <div className="form-group">
                <label>Setor</label>
                <input 
                  type="text" 
                  className="form-control" 
                  value={tarefaEditando.setor} 
                  onChange={(e) => setTarefaEditando({...tarefaEditando, setor: e.target.value})}
                />
              </div>
              <div className="form-group">
                <label>Prioridade</label>
                <select 
                  className="form-control" 
                  value={tarefaEditando.prioridade}
                  onChange={(e) => setTarefaEditando({...tarefaEditando, prioridade: e.target.value})}
                >
                  <option value="baixa">Baixa</option>
                  <option value="média">Média</option>
                  <option value="alta">Alta</option>
                </select>
              </div>
              <div className="form-group">
                <label>Status</label>
                <select 
                  className="form-control" 
                  value={tarefaEditando.status}
                  onChange={(e) => setTarefaEditando({...tarefaEditando, status: e.target.value})}
                >
                  <option value="a fazer">A fazer</option>
                  <option value="fazendo">Fazendo</option>
                  <option value="pronto">Pronto</option>
                </select>
              </div>
            </div>
          )}
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onClick={handleSalvarEdicao}>Salvar</Button>
          <Button color="secondary" onClick={toggleEditar}>Cancelar</Button>
        </ModalFooter>
      </Modal>
    </div>
  );
};

export default Tarefa;
