import React, { useState } from "react";
import { Button, Form, FormGroup, Label, Input } from "reactstrap";

const NovoUsuario = () => {
  const [usuario, setUsuario] = useState({
    nome: '',
    email: '',
    senha: ''
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setUsuario(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Lógica para salvar novo usuário
    alert('Usuário cadastrado com sucesso!');
    setUsuario({ nome: '', email: '', senha: '' });
  };

  return (
    <div>
      <h2 className="mb-4">Cadastrar Novo Usuário</h2>
      <Form onSubmit={handleSubmit}>
        <FormGroup floating>
          <Input
            id="nome"
            name="nome"
            type="text"
            value={usuario.nome}
            onChange={handleChange}
            required
          />
          <Label for="nome">Nome</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="email"
            name="email"
            type="email"
            value={usuario.email}
            onChange={handleChange}
            required
          />
          <Label for="email">Email</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="senha"
            name="senha"
            type="password"
            value={usuario.senha}
            onChange={handleChange}
            required
          />
          <Label for="senha">Senha</Label>
        </FormGroup>
        <Button color="primary" type="submit">Salvar</Button>
      </Form>
    </div>
  );
};

export default NovoUsuario;
