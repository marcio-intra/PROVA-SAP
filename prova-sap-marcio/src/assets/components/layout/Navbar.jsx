import React from "react";
import { Link } from "react-router-dom";
import { Navbar as BSNavbar, Nav, NavItem, NavLink } from "reactstrap";

const Navbar = () => {
  return (
    <BSNavbar color="dark" dark expand="md">
      <Nav className="mr-auto" navbar>
        <NavItem>
          <NavLink tag={Link} to="/">Dashboard</NavLink>
        </NavItem>
        <NavItem>
          <NavLink tag={Link} to="/tarefas">Tarefas</NavLink>
        </NavItem>
        <NavItem>
          <NavLink tag={Link} to="/gerenciar">Gerenciar</NavLink>
        </NavItem>
        <NavItem>
          <NavLink tag={Link} to="/usuarios">Usuários</NavLink>
        </NavItem>
        <NavItem>
          <NavLink tag={Link} to="/novo-usuario">Novo Usuário</NavLink>
        </NavItem>
        <NavItem>
          <NavLink tag={Link} to="/nova-tarefa">Nova Tarefa</NavLink>
        </NavItem>
      </Nav>
    </BSNavbar>
  );
};

export default Navbar;
