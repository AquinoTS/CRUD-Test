import express from "express";
import { addAluno, deleteAluno, getAluno, updateAluno } from "../controllers/aluno.js";

const router = express.Router();

router.get("/", getAluno);

router.post("/", addAluno);

router.put("/:id", updateAluno);

router.delete("/:id", deleteAluno);

export default router;