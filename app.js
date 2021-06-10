const express = require('express')
const cors = require('cors')
const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()
const app = express()
app.use(express.json())
app.use(cors()) // Чтобы давать доступ определенным IP адресам
const port = process.env.port || 8080

app.get('/', (req, res) => {
    res.status(200).send("HEllo World")
})

app.get('/api/users', async (req, res) => {
    const users = await prisma.users.findMany()
    res.status(200).send(users)
})

app.get('/api/users/:id', async (req, res) => {
    const userId = Number(req.params.id)
    const user = await prisma.users.findUnique({
        where: {
            id: userId
        },
        include: {
            Companies: true
        }
    })
    if (user !== null) {
        res.status(200).send(user)
    } else {
        res.status(404).send({ status: "Not Found" })
    }
})

app.post('/api/users', async (req, res) => {
    const { first_name, salary, companies_id } = req.body
    const user = await prisma.users.create({
        data: {
            first_name,
            salary,
            image_path,
            companies_id
        }
    })
    res.status(200).send(user)
})

app.put('/api/users/:id', async (req, res) => {
    const userId = Number(req.params.id)
    const user = await prisma.users.update({
        where: {
            id: userId
        },
        data: req.body
    })
    if (user !== null) {
        res.status(200).send(user)
    } else {
        res.status(404).send({ status: "user Not Found" })
    }
});

app.delete('/api/users/:id', async (req, res) => {
    const userId = Number(req.params.id)
    const user = await prisma.users.delete({
        where: {
            id: userId
        }
    })
    if (user !== null) {
        res.status(200).send(user)
    } else {
        res.status(404).send({ status: "Not Found" })
    }
});

app.get('/api/users/:user_id/companies/', async (req, res) => {
    const id = Number(req.params.user_id)
    const user = await prisma.users.findUnique({
        where: {
            id: id
        },
        include: {
            Companies: true
        }
    })
    const companies = await prisma.companies.findUnique({
        where: {
            id: user.companies_id
        }
    });
    if (companies !== null) {
        res.send(companies);
    } else {
        res.status(404).send({ status: "not found" })
    }
});


app.get('/api/posts/:user_id', async (req, res) => {
    const id = Number(req.params.user_id)
    const posts = await prisma.posts.findMany({
        where:{
            user_id: id
        }
    });
    if (posts !== null) {
        res.send(posts);
    } else {
        res.status(404).send({ status: "not found" })
    }
});


app.listen(port, () => {
    console.log(`You Site was started! Get in http://localhost:${port}`)
})