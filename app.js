var express = require("express");
var util = require('util');
var fs = require('fs');
var path = require('path');
var mime = require('mime');
var multer=require('multer');
var iconv = require('iconv-lite');
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

    if( fileId == '01'  ){

        //인코딩


        //파일이름설정
        origFileNm = '01.pdf';
        savedFileNm = 'result.pdf';
        savedPath = __dirname+'\\pdf';

        var array1 = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01.txt','utf-8').toString();
        var array2 = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01_r.txt').toString();

        pdf.each1(array1,array2);
        pdf.makePDF();
    }



    var file = savedPath + '\\' + savedFileNm;
    console.log('file : ', file);

    res.setHeader('Content-disposition', 'attachment; filename=' + origFileNm );


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
    if(fileId=='01'){
        //인코딩
        var content = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01.txt', "binary");// euc-kr 파일 불러오기

        var utf8Text = iconv.decode(content, "euc-kr");// euc-kr의 바이너리를 UTF-8로 변환
        fs.writeFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01.txt', utf8Text, 'utf-8');// UTF-8으로 파일 저장
        var content = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01_r.txt', "binary");// euc-kr 파일 불러오기
        var utf8Text = iconv.decode(content, "euc-kr");// euc-kr의 바이너리를 UTF-8로 변환
        fs.writeFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01_r.txt', utf8Text, 'utf-8');// UTF-8으로 파일 저장
        var array1 = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01.txt').toString().split("\\n");
        var array2 = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01_r.txt').toString().split("\\n");
        var message = array1+array2;

        var mailOptions={
            from:'seminar2team@gmail.com',
            to:'mkulele0512@gmail.com',
            subject:'01.Administrator 계정관리 점검 결과',
            html : message
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