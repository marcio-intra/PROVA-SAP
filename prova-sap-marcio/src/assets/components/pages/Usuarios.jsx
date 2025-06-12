import React, { useState } from "react";
import { Table, Button, Modal, ModalHeader, ModalBody, ModalFooter } from "reactstrap";

const Usuarios = () => {
  const [usuarios, setUsuarios] = useState([
    { id: 1, nome: "João Silva", email: "joao@example.com" },
    { id: 2, nome: "Maria Souza", email: "maria@example.com" }
  ]);
  
  const [modalEditar, setModalEditar] = useState(false);
  const [usuarioEditando, setUsuarioEditando] = useState(null);

  const toggleEditar = () => setModalEditar(!modalEditar);

  const handleEditar = (usuario) => {
    setUsuarioEditando(usuario);
    toggleEditar();
  };

  const handleExcluir = (id) => {
    setUsuarios(usuarios.filter(usuario => usuario.id !== id));
  };

  const handleSalvarEdicao = () => {
    // Lógica para salvar edição
    toggleEditar();
  };

  return (
    <div>
      <h2 className="mb-4">Usuários Cadastrados</h2>
      <Table striped responsive>
        <thead>
          <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          {usuarios.map(usuario => (
            <tr key={usuario.id}>
              <td>{usuario.id}</td>
              <td>{usuario.nome}</td>
              <td>{usuario.email}</td>
              <td>
                <Button color="primary" size="sm" onClick={() => handleEditar(usuario)}>
                  Editar
                </Button>{' '}
                <Button color="danger" size="sm" onClick={() => handleExcluir(usuario.id)}>
                  Excluir
                </Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>

      <Modal isOpen={modalEditar} toggle={toggleEditar}>
        <ModalHeader toggle={toggleEditar}>Editar Usuário</ModalHeader>
        <ModalBody>
          {usuarioEditando && (
            <div>
              <div className="form-group">
                <label>Nome</label>
                <input 
                  type="text" 
                  className="form-control" 
                  value={usuarioEditando.nome} 
                  onChange={(e) => setUsuarioEditando({...usuarioEditando, nome: e.target.value})}
                />
              </div>
              <div className="form-group">
                <label>Email</label>
                <input 
                  type="email" 
                  className="form-control" 
                  value={usuarioEditando.email} 
                  onChange={(e) => setUsuarioEditando({...usuarioEditando, email: e.target.value})}
                />
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

export default Usuarios;
