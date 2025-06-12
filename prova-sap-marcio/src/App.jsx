import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './assets/components/layout/Navbar';
import Main from './assets/components/layout/Main';
import Footer from './assets/components/layout/Footer';
import Home from './assets/components/pages/Home';
import CardItens from './assets/components/pages/CardItens';
import Usuarios from './assets/components/pages/Usuarios';
import NovoUsuario from './assets/components/pages/NovoUsuario';
import Tarefa from './assets/components/pages/Tarefa';
import NovaTarefa from './assets/components/pages/NovaTarefa';
import ListasTarefa from './assets/components/pages/ListasTarefa';

import 'bootstrap/dist/css/bootstrap.min.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import './assets/styles/App.scss';

function App() {
  return (
    <Router>
      <Navbar />
      <Main>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/gerenciar" element={<CardItens />} />
          <Route path="/usuarios" element={<Usuarios />} />
          <Route path="/novo-usuario" element={<NovoUsuario />} />
          <Route path="/tarefas" element={<Tarefa />} />
          <Route path="/nova-tarefa" element={<NovaTarefa />} />
          <Route path="/listas-tarefa" element={<ListasTarefa />} />
        </Routes>
      </Main>
      <Footer />
    </Router>
  );
}

export default App;
