import { db } from "../db.js";

export const getAluno = (_, res) => {
  const q = "SELECT * FROM alunos";

  db.query(q, (err, data) => {
    if (err) return res.json(err);

    return res.status(200).json(data);
  });
};

export const addAluno = (req, res) => {
  const q =
    "INSERT INTO alunos(`nome`, `curso`) VALUES(?)";

  const values = [
    req.body.nome,
    req.body.curso,
  ];

  db.query(q, [values], (err) => {
    if (err) return res.json(err);

    return res.status(200).json("Aluno inserido com sucesso.");
  });
};

export const updateAluno = (req, res) => {
  const q =
    "UPDATE alunos SET `nome` = ?, `curso` = ? WHERE `ra` = ?";

  const values = [
    req.body.nome,
    req.body.curso,
  ];

  db.query(q, [...values, req.params.id], (err) => {
    if (err) return res.json(err);

    return res.status(200).json("Aluno atualizado com sucesso.");
  });
};

export const deleteAluno = (req, res) => {
  const q = "DELETE FROM alunos WHERE `ra` = ?";

  db.query(q, [req.params.ra], (err) => {
    if (err) return res.json(err);

    return res.status(200).json("Aluno deletado com sucesso.");
  });
};