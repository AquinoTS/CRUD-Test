import express from "express"
import alunosRoutes from "./routes/alunos.js"
import cors from "cors"

const app = express()

app.use(express.json())
app.use(cors())

app.use("/", alunosRoutes)

app.listen(8800)