import React from "react";
import { Card, CardBody, CardTitle, CardText } from "reactstrap";

const Home = () => {
  return (
    <div>
      <Card>
        <CardBody>
          <CardTitle tag="h5">Dashboard</CardTitle>
          <CardText>
            Bem-vindo ao sistema de gerenciamento de tarefas. Utilize o menu para navegar.
          </CardText>
        </CardBody>
      </Card>
    </div>
  );
};

export default Home;
