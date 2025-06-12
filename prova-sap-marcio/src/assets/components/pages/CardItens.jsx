import React from "react";
import { Row, Col, Card, CardBody, CardTitle } from "reactstrap";

const CardItens = () => {
  return (
    <div>
      <h2 className="mb-4">Gerenciamento de Tarefas</h2>
      <Row>
        <Col md="4">
          <Card className="mb-4" color="danger" inverse>
            <CardBody>
              <CardTitle tag="h5">A Fazer</CardTitle>
              {/* Tarefas com status "a fazer" serão renderizadas aqui */}
            </CardBody>
          </Card>
        </Col>
        <Col md="4">
          <Card className="mb-4" color="warning" inverse>
            <CardBody>
              <CardTitle tag="h5">Fazendo</CardTitle>
              {/* Tarefas com status "fazendo" serão renderizadas aqui */}
            </CardBody>
          </Card>
        </Col>
        <Col md="4">
          <Card className="mb-4" color="success" inverse>
            <CardBody>
              <CardTitle tag="h5">Pronto</CardTitle>
              {/* Tarefas com status "pronto" serão renderizadas aqui */}
            </CardBody>
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default CardItens;
