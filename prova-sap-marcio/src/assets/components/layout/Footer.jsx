import React from "react";
import { Container, Row, Col } from "reactstrap";

const Footer = () => {
  return (
    <footer className="bg-dark text-white py-3 mt-4">
      <Container>
        <Row>
          <Col md={12} className="text-center">
            <p className="mb-0">Sistema de Gerenciamento de Tarefas &copy; 2023</p>
          </Col>
        </Row>
      </Container>
    </footer>
  );
};

export default Footer;
