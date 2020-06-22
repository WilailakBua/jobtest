const express = require('express')
const bodyParser = require('body-parser')
var multer  = require('multer')

const path = require('path')
const app = express()


const PORT = process.env.PORT || 8080
// app.get('/', (req, res) => res.send('Hello World'))
app.listen(PORT, () => {
    console.log(`Server is running on port : ${PORT}`)
})

app.use(express.static(path.join(__dirname)))

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))


module.exports = app
var mysql = require('mysql');

var con = mysql.createConnection({
  host: "127.0.0.1",
  user: "usertest",
  password: "1234",
  database: "joblist"

});

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});


app.post('/show_listdetail', (req, res, next) => {
  con.connect(function(err) {
      if (err);
      con.query("SELECT * FROM list_detail", function(err, result, fields) {
          if (err);
            console.log(result);
          res.send(result);
      });
  })
})


app.post('/update_checklist', (req, res, next) => {
  let status = req.body.status
  let id = req.body.id
  console.log(req.body.id);
  console.log(req.body.status);
  con.connect(function(err) {
      if (err);
      var sql = "UPDATE list_detail SET  liststatus = '" + status + "' WHERE idlist = '" + id + "'";

      con.query(sql, function(err, result) {
          if (err);
      });
  });
})


app.post('/insert_list', (req, res, next) => {
  var today = new Date();
  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
  let max_id;
    console.log(date);
  con.connect(function(err) {
    if (err);
    
    con.query("SELECT MAX(id) AS id FROM list", function(err, result, fields) {
        console.log("result  => ", result)
        max_id = JSON.stringify(result[0].id)

        console.log("++++++++",max_id);
        if (max_id == null) {
            max_id = 0;
            console.log("-----1",max_id); 
        } else {
            max_id = parseInt(max_id) + 1
            console.log("---2",max_id);
        }

        // INSERT INTO table list
        let sql = 'INSERT INTO list SET ?'
        let data = {
            "id":max_id,
            "date": date
        }

        con.query(sql, data, function(err, result) {
            console.log(result)
            if (err);
        });
    });   
  });      
});



app.post('/insert_listdetail', (req, res, next) => {
  let strlist = req.body.str;
  var today = new Date();
  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
  let max_id;
  let max_id_detail;
    console.log(date);
  con.connect(function(err) {
    if (err);
    
    con.query("SELECT MAX(id) AS id FROM list", function(err, result, fields) {
        console.log("result  => ", result)
        max_id = JSON.stringify(result[0].id)

        console.log("++++++++",max_id);
        if (max_id == null) {
            max_id = 0;
            console.log("-----1",max_id); 
        } else {
            max_id = parseInt(max_id) + 1
            console.log("---2",max_id);
        }
        
    con.query("SELECT MAX(idlist) AS id FROM list_detail", function(err, result, fields) {
      console.log("result  => ", result)
      max_id_detail = JSON.stringify(result[0].id)

      console.log("++++++++",max_id_detail);
      if (max_id_detail == null) {
          max_id_detail = 0;
          console.log("-----1",max_id_detail); 
      } else {
          max_id_detail = parseInt(max_id_detail) + 1
          console.log("---2",max_id_detail);
      }
        // INSERT INTO table list_detail

        let sql = 'INSERT INTO list_detail SET ?'
        let data = {
            "idlist" : max_id_detail,
            "list" : strlist,
            "listdate" : date,
            "liststatus" : "new",
            "id" : max_id

        }
        console.log("data detail => ", data);
        

        con.query(sql, data, function(err, result) {
            console.log(result)
            if (err);
            if (result == undefined) {
              res.send({ status: "Unsuccessful"});
              res.end();
          } else {
              res.send({ status: "Success" });
              res.end();
          }
        });


    });   
  });      
});
});



app.post('/delete_list', (req, res, next) => {
  let status = req.body.status
  let id = req.body.id
  console.log(req.body)
  con.connect(function(err) {
      if (err);
      var sql = "UPDATE list_detail SET  liststatus = '" + status + "' WHERE idlist  = '" + id + "'";

      con.query(sql, function(err, result) {
          if (err);
          res.send({status : "success"})
      });
  });
})

