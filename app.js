var express = require("express");
var util = require('util');
var fs = require('fs');
var path = require('path');
var mime = require('mime');
var multer=require('multer');
var iconv = require('iconv-lite');
var jschardet=require('jschardet');
var nodemailer=require('nodemailer');
var smtpTransporter=require('nodemailer-smtp-transport');
var pdf=require('C:\\Users\\pc\\Desktop\\15501032\\pdfserver.js');
var bat=require('C:\\Users\\pc\\Desktop\\15501032\\runbat.js');
const PORT = 3000;

var app = express();


//views설정
app.set('view engine','ejs');
app.use(express.static('C:\\Users\\pc\\Desktop\\15501032\\views'));
app.get('/', function(req, res){
    fs.readFile('index.html','utf8', function(error, data){
        res.end(data);
    });
});
app.get('/01', function(req, res){
    fs.readFile('C:\\Users\\pc\\Desktop\\15501032\\views\\01.ejs','utf8', function(error, data){
        res.end(data);
    });
});




//점검하기
app.get('/bat/:fileid',function(req,res){
    var fileId = req.params.fileid;
    if(fileId=='01'){
        bat.runbat1();
        res.redirect('/01');
    }
    else if(fileId=='02'){
        bat.runbat2();
        res.redirect('/02');
    }
})




//PDF로 다운받기
app.get('/download/:fileid', function(req, res){
    var fileId = req.params.fileid; //fileid = 각각의 파일을 구분하는 파일ID 값
    var origFileNm, savedFileNm, savedPath, fileSize; //DB에서 읽어올 정보들

    //인코딩
    var f= fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\title.txt');
    if(jschardet.detect(f).encoding=='EUC-KR'){
        var ft=fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\title.txt',"binary");
        var fc=fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\content.txt',"binary");
        var fr=fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\result.txt',"binary");
        var utf8t=iconv.decode(ft,"euc-kr"); var utf8c=iconv.decode(fc,"euc-kr"); var utf8r=iconv.decode(fr,"euc-kr");
        fs.writeFileSync("C:\\Users\\pc\\Desktop\\15501032\\bat\\title.txt",utf8t,'utf-8');
        fs.writeFileSync("C:\\Users\\pc\\Desktop\\15501032\\bat\\content.txt",utf8c,'utf-8');
        fs.writeFileSync("C:\\Users\\pc\\Desktop\\15501032\\bat\\result.txt",utf8r,'utf-8');
    }

    if( fileId == '01'  ){
        //파일이름설정
        origFileNm = '01.zip';
        savedFileNm = 'test.zip';
        savedPath = __dirname+'\\pdf';

        var t = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\title.txt').toString();
        var c = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\content.txt').toString();
        var r = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\result.txt').toString();

        pdf.each1(t,c,r);
        pdf.makePDF();
    }

    var file = savedPath + '\\' + savedFileNm;
    mimetype=mime.lookup(origFileNm);
    res.setHeader('Content-disposition', 'attachment; filename=' + origFileNm );

    res.setHeader('Content-type',mimetype);
    var filestream = fs.createReadStream(file);
    filestream.pipe(res);
});




//email로 보내기
var smtpTransport=nodemailer.createTransport(smtpTransporter({
    service:'Gmail',
    host:'smtp.gmail.com',
    auth:{
        user:'seminar2team@gmail.com',
        pass:'gkrtnfwp2wh'
    }
}));


app.get('/email/:fileid',function(req,res){
    var fileId = req.params.fileid;

    //인코딩
    var f= fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\title.txt');
    if(jschardet.detect(f).encoding=='EUC-KR'){
        var ft=fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\title.txt',"binary");
        var fc=fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\content.txt',"binary");
        var fr=fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\result.txt',"binary");
        var utf8t=iconv.decode(ft,"euc-kr"); var utf8c=iconv.decode(fc,"euc-kr"); var utf8r=iconv.decode(fr,"euc-kr");
        fs.writeFileSync("C:\\Users\\pc\\Desktop\\15501032\\bat\\title.txt",utf8t,'utf-8');
        fs.writeFileSync("C:\\Users\\pc\\Desktop\\15501032\\bat\\content.txt",utf8c,'utf-8');
        fs.writeFileSync("C:\\Users\\pc\\Desktop\\15501032\\bat\\result.txt",utf8r,'utf-8');
    }

    if(fileId=='01'){
        var t = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\title.txt').toString();
        var c = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\content.txt').toString();
        var r = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\result.txt').toString();
        var message = c+r;

        var mailOptions={
            from:'seminar2team@gmail.com',
            to:'mkulele0512@gmail.com',
            subject:t+'점검',
            html : c+'<br></br><h2>'+r+'</h2>'
        };
        smtpTransport.sendMail(mailOptions,function(error,res){
            if(error){
                console.log(error);
            }else{
                console.log("email sent");
            }
            smtpTransport.close();
        })
        res.redirect('/01');
    }
    else if(fileId=='02'){
        bat.runbat2();
        res.redirect('/02');
    }
})





//server start
app.listen(PORT,function(){
    console.log("server start");
});