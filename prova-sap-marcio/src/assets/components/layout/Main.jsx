import React from "react";
import { Container } from "reactstrap";

const Main = ({ children }) => {
  return (
    <Container fluid className="py-4">
      {children}
    </Container>
  );
};

export default Main;
