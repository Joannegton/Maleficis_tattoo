const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('uploads')); // Diretório para armazenar imagens enviadas

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Local onde as imagens serão armazenadas
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname)); // Nome do arquivo (usando timestamp para evitar conflitos)
  },
});

const upload = multer({ storage });

const db = mysql.createConnection({
    host: '127.0.0.1',
    user:'root',
    password: '131998Wel@',
    database: 'portifolio',
});

db.connect((erro) =>{
    if (erro){
        console.error('Erro de conexão com o Mysql: ' + erro.message);
        return;
    }
    console.log("Conexão com o Mysql estabelecida com sucesso.");
});


app.post('enviar', upload.array('imagens', 2), (req, res) => {
  // Receber dados do formulário
  const { nome, email } = req.body;
  
  // Obter nomes de arquivo das imagens enviadas
  const nomesImagens = req.files.map((file) => file.filename);
  
  // Inserir dados no banco de dados, incluindo os nomes das imagens
  const query = 'INSERT INTO tabela (nome, email, imagem1, imagem2) VALUES (?, ?, ?, ?)';
  db.query(query, [nome, email, nomesImagens[0], nomesImagens[1]], (err, result) => {
    if (err) {
      console.error('Erro ao inserir no banco de dados: ' + err);
      res.send('Erro ao inserir os dados no banco de dados.');
    } else {
      console.log('Dados inseridos com sucesso.');
      res.send('Dados inseridos com sucesso.');
    }
  });
});


app.listen(3000, () => {
    console.log('Servidor está ouvindo na porta 3000.');
  });
  
  