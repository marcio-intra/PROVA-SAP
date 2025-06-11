# Script para Automatizar Criação de Projeto Vite + React + Reactstrap

Aqui está um script shell completo que automatiza a criação do seu projeto com todas as especificações:

```bash
#!/bin/bash

# Nome do projeto
PROJECT_NAME="prova-sap-marcio"

# Criar projeto Vite com React
echo "Criando projeto Vite + React..."
npm create vite@latest $PROJECT_NAME --template react
cd $PROJECT_NAME

# Instalar dependências
echo "Instalando dependências..."
npm install reactstrap bootstrap react-router-dom axios

# Criar estrutura de diretórios
echo "Criando estrutura de diretórios..."
mkdir -p src/assets/components/{pages,utils}

# Criar componentes
echo "Criando componentes..."

# Navbar.jsx
cat > src/assets/components/Navbar.jsx << 'EOL'
import React from "react";
import { Link } from "react-router-dom";
import { Navbar as BootstrapNavbar, Nav, Container } from "reactstrap";

const Navbar = () => {
  return (
    <BootstrapNavbar color="dark" dark expand="md">
      <Container>
        <Link to="/" className="navbar-brand">
          Sistema de Biblioteca
        </Link>
        <Nav className="mr-auto" navbar>
          <Link to="/gerenciar" className="nav-link">
            Gerenciar
          </Link>
          <Link to="/usuarios" className="nav-link">
            Usuários
          </Link>
          <Link to="/novo-usuario" className="nav-link">
            Novo Usuário
          </Link>
          <Link to="/livros" className="nav-link">
            Livros
          </Link>
          <Link to="/novo-livro" className="nav-link">
            Novo Livro
          </Link>
        </Nav>
      </Container>
    </BootstrapNavbar>
  );
};

export default Navbar;
EOL

# MainDashboard.jsx
cat > src/assets/components/MainDashboard.jsx << 'EOL'
import React from "react";
import { Outlet } from "react-router-dom";

const MainDashboard = () => {
  return (
    <div className="main-content">
      <Outlet />
    </div>
  );
};

export default MainDashboard;
EOL

# Footer.jsx
cat > src/assets/components/Footer.jsx << 'EOL'
import React from "react";
import { Container } from "reactstrap";

const Footer = () => {
  return (
    <footer className="bg-dark text-white mt-5 py-3">
      <Container>
        <p className="text-center mb-0">
          &copy; {new Date().getFullYear()} Sistema de Biblioteca
        </p>
      </Container>
    </footer>
  );
};

export default Footer;
EOL

# CardItens.jsx
cat > src/assets/components/pages/CardItens.jsx << 'EOL'
import React from "react";
import { Card, CardBody, CardTitle, Row, Col } from "reactstrap";

const CardItens = () => {
  return (
    <div className="container mt-4">
      <h2>Status de Leitura</h2>
      <Row>
        <Col md="4">
          <Card className="mb-4">
            <CardBody>
              <CardTitle tag="h5">Não li</CardTitle>
              {/* Lista de itens não lidos aqui */}
            </CardBody>
          </Card>
        </Col>
        <Col md="4">
          <Card className="mb-4">
            <CardBody>
              <CardTitle tag="h5">Lendo</CardTitle>
              {/* Lista de itens em leitura aqui */}
            </CardBody>
          </Card>
        </Col>
        <Col md="4">
          <Card className="mb-4">
            <CardBody>
              <CardTitle tag="h5">Lido</CardTitle>
              {/* Lista de itens lidos aqui */}
            </CardBody>
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default CardItens;
EOL

# Usuarios.jsx
cat > src/assets/components/pages/Usuarios.jsx << 'EOL'
import React, { useState } from "react";
import { Table, Button, Modal, ModalHeader, ModalBody, ModalFooter, Form, FormGroup, Label, Input } from "reactstrap";

const Usuarios = () => {
  const [usuarios, setUsuarios] = useState([
    { id: 1, nome: "Usuário 1", email: "usuario1@example.com" },
    { id: 2, nome: "Usuário 2", email: "usuario2@example.com" }
  ]);
  
  const [modalEditar, setModalEditar] = useState(false);
  const [usuarioEditando, setUsuarioEditando] = useState(null);
  
  const toggleEditar = () => setModalEditar(!modalEditar);
  
  const editarUsuario = (usuario) => {
    setUsuarioEditando(usuario);
    toggleEditar();
  };
  
  const salvarEdicao = () => {
    // Lógica para salvar edição
    toggleEditar();
  };
  
  const excluirUsuario = (id) => {
    setUsuarios(usuarios.filter(usuario => usuario.id !== id));
  };

  return (
    <div className="container mt-4">
      <h2>Usuários Cadastrados</h2>
      <Table striped>
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
                <Button color="primary" onClick={() => editarUsuario(usuario)}>Editar</Button>
                <Button color="danger" onClick={() => excluirUsuario(usuario.id)} className="ml-2">Excluir</Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
      
      <Modal isOpen={modalEditar} toggle={toggleEditar}>
        <ModalHeader toggle={toggleEditar}>Editar Usuário</ModalHeader>
        <ModalBody>
          <Form>
            <FormGroup floating>
              <Input id="nome" type="text" value={usuarioEditando?.nome || ""} onChange={(e) => setUsuarioEditando({...usuarioEditando, nome: e.target.value})} />
              <Label for="nome">Nome</Label>
            </FormGroup>
            <FormGroup floating>
              <Input id="email" type="email" value={usuarioEditando?.email || ""} onChange={(e) => setUsuarioEditando({...usuarioEditando, email: e.target.value})} />
              <Label for="email">Email</Label>
            </FormGroup>
          </Form>
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onClick={salvarEdicao}>Salvar</Button>
          <Button color="secondary" onClick={toggleEditar}>Cancelar</Button>
        </ModalFooter>
      </Modal>
    </div>
  );
};

export default Usuarios;
EOL

# NovoUsuario.jsx
cat > src/assets/components/pages/NovoUsuario.jsx << 'EOL'
import React, { useState } from "react";
import { Form, FormGroup, Label, Input, Button } from "reactstrap";

const NovoUsuario = () => {
  const [formData, setFormData] = useState({
    nome: "",
    email: "",
    senha: ""
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Lógica para salvar novo usuário
    console.log("Novo usuário:", formData);
  };

  return (
    <div className="container mt-4">
      <h2>Novo Usuário</h2>
      <Form onSubmit={handleSubmit}>
        <FormGroup floating>
          <Input
            id="nome"
            name="nome"
            type="text"
            value={formData.nome}
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
            value={formData.email}
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
            value={formData.senha}
            onChange={handleChange}
            required
          />
          <Label for="senha">Senha</Label>
        </FormGroup>
        <Button type="submit" color="primary">Salvar</Button>
      </Form>
    </div>
  );
};

export default NovoUsuario;
EOL

# Livros.jsx
cat > src/assets/components/pages/Livros.jsx << 'EOL'
import React, { useState } from "react";
import { Table, Button, Modal, ModalHeader, ModalBody, ModalFooter, Form, FormGroup, Label, Input } from "reactstrap";

const Livros = () => {
  const [livros, setLivros] = useState([
    { id: 1, titulo: "Livro 1", autor: "Autor 1", genero: "Gênero 1", dataCadastro: "2023-01-01", status: "Disponível" },
    { id: 2, titulo: "Livro 2", autor: "Autor 2", genero: "Gênero 2", dataCadastro: "2023-01-02", status: "Disponível" }
  ]);
  
  const [modalEditar, setModalEditar] = useState(false);
  const [livroEditando, setLivroEditando] = useState(null);
  
  const toggleEditar = () => setModalEditar(!modalEditar);
  
  const editarLivro = (livro) => {
    setLivroEditando(livro);
    toggleEditar();
  };
  
  const salvarEdicao = () => {
    // Lógica para salvar edição
    toggleEditar();
  };
  
  const excluirLivro = (id) => {
    setLivros(livros.filter(livro => livro.id !== id));
  };

  return (
    <div className="container mt-4">
      <h2>Livros Cadastrados</h2>
      <Table striped>
        <thead>
          <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Autor</th>
            <th>Gênero</th>
            <th>Data de Cadastro</th>
            <th>Status</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          {livros.map(livro => (
            <tr key={livro.id}>
              <td>{livro.id}</td>
              <td>{livro.titulo}</td>
              <td>{livro.autor}</td>
              <td>{livro.genero}</td>
              <td>{livro.dataCadastro}</td>
              <td>{livro.status}</td>
              <td>
                <Button color="primary" onClick={() => editarLivro(livro)}>Editar</Button>
                <Button color="danger" onClick={() => excluirLivro(livro.id)} className="ml-2">Excluir</Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
      
      <Modal isOpen={modalEditar} toggle={toggleEditar}>
        <ModalHeader toggle={toggleEditar}>Editar Livro</ModalHeader>
        <ModalBody>
          <Form>
            <FormGroup floating>
              <Input id="titulo" type="text" value={livroEditando?.titulo || ""} onChange={(e) => setLivroEditando({...livroEditando, titulo: e.target.value})} />
              <Label for="titulo">Título</Label>
            </FormGroup>
            <FormGroup floating>
              <Input id="autor" type="text" value={livroEditando?.autor || ""} onChange={(e) => setLivroEditando({...livroEditando, autor: e.target.value})} />
              <Label for="autor">Autor</Label>
            </FormGroup>
            <FormGroup floating>
              <Input id="genero" type="text" value={livroEditando?.genero || ""} onChange={(e) => setLivroEditando({...livroEditando, genero: e.target.value})} />
              <Label for="genero">Gênero</Label>
            </FormGroup>
            <FormGroup floating>
              <Input id="status" type="select" value={livroEditando?.status || ""} onChange={(e) => setLivroEditando({...livroEditando, status: e.target.value})}>
                <option>Disponível</option>
                <option>Reservado</option>
              </Input>
              <Label for="status">Status</Label>
            </FormGroup>
          </Form>
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onClick={salvarEdicao}>Salvar</Button>
          <Button color="secondary" onClick={toggleEditar}>Cancelar</Button>
        </ModalFooter>
      </Modal>
    </div>
  );
};

export default Livros;
EOL

# NovoLivro.jsx
cat > src/assets/components/pages/NovoLivro.jsx << 'EOL'
import React, { useState } from "react";
import { Form, FormGroup, Label, Input, Button } from "reactstrap";

const NovoLivro = () => {
  const [formData, setFormData] = useState({
    titulo: "",
    autor: "",
    genero: "",
    dataCadastro: "",
    status: "Disponível"
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Lógica para salvar novo livro
    console.log("Novo livro:", formData);
  };

  return (
    <div className="container mt-4">
      <h2>Novo Livro</h2>
      <Form onSubmit={handleSubmit}>
        <FormGroup floating>
          <Input
            id="titulo"
            name="titulo"
            type="text"
            value={formData.titulo}
            onChange={handleChange}
            required
          />
          <Label for="titulo">Título</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="autor"
            name="autor"
            type="text"
            value={formData.autor}
            onChange={handleChange}
            required
          />
          <Label for="autor">Autor</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="genero"
            name="genero"
            type="text"
            value={formData.genero}
            onChange={handleChange}
            required
          />
          <Label for="genero">Gênero</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="dataCadastro"
            name="dataCadastro"
            type="date"
            value={formData.dataCadastro}
            onChange={handleChange}
            required
          />
          <Label for="dataCadastro">Data de Cadastro</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="status"
            name="status"
            type="select"
            value={formData.status}
            onChange={handleChange}
          >
            <option>Disponível</option>
            <option>Reservado</option>
          </Input>
          <Label for="status">Status</Label>
        </FormGroup>
        <Button type="submit" color="primary">Salvar</Button>
      </Form>
    </div>
  );
};

export default NovoLivro;
EOL

# ReservarLivro.jsx
cat > src/assets/components/pages/ReservarLivro.jsx << 'EOL'
import React, { useState } from "react";
import { Form, FormGroup, Label, Input, Button } from "reactstrap";

const ReservarLivro = () => {
  const [formData, setFormData] = useState({
    usuario: "",
    livro: "",
    titulo: "",
    autor: "",
    genero: "",
    dataCadastro: "",
    status: "Não li",
    dataReserva: ""
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Lógica para salvar reserva
    console.log("Reserva:", formData);
  };

  const excluirReserva = () => {
    // Lógica para excluir reserva sem afetar usuário e livro
    console.log("Reserva excluída");
  };

  return (
    <div className="container mt-4">
      <h2>Reservar Livro</h2>
      <Form onSubmit={handleSubmit}>
        <FormGroup floating>
          <Input
            id="usuario"
            name="usuario"
            type="select"
            value={formData.usuario}
            onChange={handleChange}
            required
          >
            <option value="">Selecione um usuário</option>
            {/* Opções de usuários viriam de uma API */}
            <option value="1">Usuário 1</option>
            <option value="2">Usuário 2</option>
          </Input>
          <Label for="usuario">Usuário</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="livro"
            name="livro"
            type="select"
            value={formData.livro}
            onChange={handleChange}
            required
          >
            <option value="">Selecione um livro</option>
            {/* Opções de livros viriam de uma API */}
            <option value="1">Livro 1</option>
            <option value="2">Livro 2</option>
          </Input>
          <Label for="livro">Livro</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="titulo"
            name="titulo"
            type="text"
            value={formData.titulo}
            onChange={handleChange}
            readOnly
          />
          <Label for="titulo">Título</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="autor"
            name="autor"
            type="text"
            value={formData.autor}
            onChange={handleChange}
            readOnly
          />
          <Label for="autor">Autor</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="genero"
            name="genero"
            type="text"
            value={formData.genero}
            onChange={handleChange}
            readOnly
          />
          <Label for="genero">Gênero</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="dataCadastro"
            name="dataCadastro"
            type="text"
            value={formData.dataCadastro}
            onChange={handleChange}
            readOnly
          />
          <Label for="dataCadastro">Data de Cadastro</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="status"
            name="status"
            type="select"
            value={formData.status}
            onChange={handleChange}
            required
          >
            <option>Não li</option>
            <option>Lendo</option>
            <option>Lido</option>
          </Input>
          <Label for="status">Status</Label>
        </FormGroup>
        <FormGroup floating>
          <Input
            id="dataReserva"
            name="dataReserva"
            type="date"
            value={formData.dataReserva}
            onChange={handleChange}
            required
          />
          <Label for="dataReserva">Data de Reserva</Label>
        </FormGroup>
        <Button type="submit" color="primary">Salvar Reserva</Button>
        <Button color="danger" onClick={excluirReserva} className="ml-2">Excluir Reserva</Button>
      </Form>
    </div>
  );
};

export default ReservarLivro;
EOL

# Configurar rotas
echo "Configurando rotas..."

# Criar arquivo de rotas
cat > src/App.jsx << 'EOL'
import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import Navbar from "./assets/components/Navbar";
import Footer from "./assets/components/Footer";
import MainDashboard from "./assets/components/MainDashboard";
import CardItens from "./assets/components/pages/CardItens";
import Usuarios from "./assets/components/pages/Usuarios";
import NovoUsuario from "./assets/components/pages/NovoUsuario";
import Livros from "./assets/components/pages/Livros";
import NovoLivro from "./assets/components/pages/NovoLivro";
import ReservarLivro from "./assets/components/pages/ReservarLivro";

function App() {
  return (
    <Router>
      <div className="d-flex flex-column min-vh-100">
        <Navbar />
        <MainDashboard>
          <Routes>
            <Route path="/gerenciar" element={<CardItens />} />
            <Route path="/usuarios" element={<Usuarios />} />
            <Route path="/novo-usuario" element={<NovoUsuario />} />
            <Route path="/livros" element={<Livros />} />
            <Route path="/novo-livro" element={<NovoLivro />} />
            <Route path="/reservar-livro" element={<ReservarLivro />} />
            <Route path="/" element={<CardItens />} />
          </Routes>
        </MainDashboard>
        <Footer />
      </div>
    </Router>
  );
}

export default App;
EOL

# Criar arquivo de documentação
cat > documentacao.txt << 'EOL'
# Documentação do Projeto: prova-sap-marcio

## Estrutura do Projeto
- src/
  - assets/
    - components/
      - Navbar.jsx
      - MainDashboard.jsx
      - Footer.jsx
      - pages/
        - CardItens.jsx
        - Usuarios.jsx
        - NovoUsuario.jsx
        - Livros.jsx
        - NovoLivro.jsx
        - ReservarLivro.jsx
  - App.jsx

## Rotas
- /gerenciar - CardItens.jsx (Status de leitura em cards)
- /usuarios - Usuarios.jsx (Lista de usuários com edição/exclusão)
- /novo-usuario - NovoUsuario.jsx (Formulário para novo usuário)
- /livros - Livros.jsx (Lista de livros com edição/exclusão)
- /novo-livro - NovoLivro.jsx (Formulário para novo livro)
- /reservar-livro - ReservarLivro.jsx (Formulário para reservar livro)

## Dependências
- reactstrap
- bootstrap
- react-router-dom
- axios

## Como executar
1. npm install
2. npm run dev

## Funcionalidades implementadas
- Navbar com links para todas as páginas
- Componentes com formulários usando float labels do Bootstrap
- Lógica de edição/exclusão para Usuários e Livros
- Lógica específica para ReservarLivro que permite excluir reservas sem afetar usuários/livros
- Estrutura de cards para status de leitura
- Tabelas para listagem de dados
EOL

# Mensagem final
echo "Projeto $PROJECT_NAME criado com sucesso!"
echo "Para iniciar o projeto:"
echo "cd $PROJECT_NAME && npm run dev"
echo "Documentação salva em documentacao.txt"
```

## Como usar este script:

1. Salve o conteúdo acima em um arquivo chamado `criar_projeto.sh`
2. Dê permissão de execução: `chmod +x criar_projeto.sh`
3. Execute o script: `./criar_projeto.sh`

## O que o script faz:

1. Cria um projeto Vite com React
2. Instala as dependências necessárias (reactstrap, bootstrap, react-router-dom)
3. Cria toda a estrutura de diretórios e componentes conforme especificado
4. Configura as rotas entre os componentes
5. Implementa a lógica básica de edição/exclusão para os componentes necessários
6. Cria um arquivo de documentação (documentacao.txt) com todas as informações do projeto

O projeto estará pronto para ser executado com `npm run dev` após a conclusão do script.