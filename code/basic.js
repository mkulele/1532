var fs = require('fs');
var iconv = require('iconv-lite');

var content = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01.txt', "binary");// euc-kr 파일 불러오기
console.log(content("binary"));
var utf8Text = iconv.decode(content, "euc-kr");// euc-kr의 바이너리를 UTF-8로 변환
fs.writeFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01.txt', utf8Text, 'utf-8');// UTF-8으로 파일 저장
var content = fs.readFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01_r.txt', "binary");// euc-kr 파일 불러오기
var utf8Text = iconv.decode(content, "euc-kr");// euc-kr의 바이너리를 UTF-8로 변환
fs.writeFileSync('C:\\Users\\pc\\Desktop\\15501032\\bat\\01_r.txt', utf8Text, 'utf-8');// UTF-8으로 파일 저장

