import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default {
    async createUser(req, res) {
        
            try {
            const {name, email, password} = req.body
        
            let user = await prisma.user.findUnique({ where: { email }})
        
            if(user) {
                return res.json({error: "já existe um usuário com este email"})
            }
        
            user = await prisma.user.create({
                data: {
                    name,
                    email,
                    password
                }  
            })
        
            return res.json(user)
            } catch (error) {
                return res.json({error})
            }
    },

    async findAllUsers(req, res) {
        try {
            const users = await prisma.user.findMany();
            return res.json({users})
        } catch (error) {
            return res.json({error})
        }
    },

    async deleteUser(req, res) {
        try {
            const {id} = req.params

        let user = await prisma.user.findUnique({where: {id: Number(id)}})

        if(!user) return res.json({error: "Usuário não encontrado"})

        user = await prisma.user.delete({where: {id: Number(id)}})
        
        return res.json({message: "Usuário excluído com sucesso!"})
    

        }catch(error) {
            return res.json({error})
        }   
    },

    async updateUser(req, res) {
        try {
            const {id} = req.params
            const data = req.body
            console.log(data)
            let user = await prisma.user.findUnique({where: {id: Number(id)}})

            if(!user) return res.json({error: "Usuário não encontrado"})

            user = await prisma.user.update({where: { id: Number(id)}, data } )

            return res.json({user})
        } catch (error) {
            return res.json({error})
        }
    } 
}