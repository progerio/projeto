import express, { NextFunction, Request, Response } from "express";
import dotenv from "dotenv";

const app = express();
app.use(express.json())
dotenv.config(); 

interface RequestBody {
  name: string
}

app.get("/", (req: Request, res: Response, next: NextFunction) => {
  res.send("Ola mundo!");
});

app.post('/', (req:Request, res:Response) => {
    const user = req.body as RequestBody
    res.send({
        message: `Hello ${user.name}`
    })
})

app.listen(process.env.PORT, () => {
  console.log(`Server is running at ${process.env.PORT}`);
});