var fonts={
    Roboto: {
        normal :'C:\\Users\\pc\\Desktop\\15501032\\fonts\\KoPubDotumLight.ttf',
        bold :'C:\\Users\\pc\\Desktop\\15501032\\fonts\\KoPubDotumBold.ttf',
        italics :'C:\\Users\\pc\\Desktop\\15501032\\fonts\\KoPubDotumMedium.ttf',
        bolditalics :'C:\\Users\\pc\\Desktop\\15501032\\fonts\\KoPubDotumMedium.ttf'
    }
};





var PdfPrinter = require('C:\\Users\\pc\\Desktop\\15501032\\node_modules\\pdfmake\\src\\printer');
var printer = new PdfPrinter(fonts);
var fs = require('fs');

 module.exports.pa = function (line) {
    var re1 = line[0];
    var re2 = line[1];
    var re3 = line[2];
    var re4 = line[3];
    var re5 = line[4];
    var re6 = line[5];
    var re7 = line[6];





    var documentDefinition={
        content:[
            {
                text:'침입탐지 진단',
                bold:true, fontSize:30,  alignment: 'center',margin: [ 10, 10, 10, 30 ],color:'blue'
            },
            {
                style:'table',
                table:{
                    widths:[70,'*'],heights:16,
                    body:[
                        [
                            {text:'01. Administrator 계정관리',colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:'관리자 계정이 하나만 존재'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:re1,bold:true}
                        ],
                        //01
                        [
                            {text:'02. Guest 계정관리',colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:'관리자 계정이 비활성화'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:re2,bold:true}
                        ],
                        //02
                        [
                            {text:'03. 계정 잠금 정책 설정',colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,rowSpan:2,margin:8,fontSize:11},{text:'계정 잠금 기간 - 60분'}
                        ],
                        ['','계정 잠금수를 원래대로 설정 - 60분'],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:re3,bold:true}
                        ],
                        //03
                        [
                            {text:'04. 암호 정책 설정',colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호\n기준',bold:true,rowSpan:4,margin:20,fontSize:11},'최소 암호 사용기간 1일 이상'
                        ],
                        [
                            '','최대 암호 사용 기간 90일 이하'
                        ],
                        [
                            '','최소 암호 길이 8 문자 이상'
                        ],
                        [
                            '','최근 암호 기억 12개로 설정'
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:re4,bold:true}
                        ],
                        //04
                        [
                            {text:'05. 사용자계정 컨트롤 설정',colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:'사용자 계정 컨트롤(UAC) 사용'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:re5,bold:true}
                        ],
                        //05
                        [
                            {text:'06. CMD 파일 권한 설정',colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:'Administrator와 System 과 TrustedInstaller 그룹만 실행 권한'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:re6,bold:true}
                        ],
                        //06
                        [
                            {text:'07. CMD 파일 권한 설정',colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:'홈디렉터리 권한중 Users:F 또는 Everyone:F가 없음'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:re7,bold:true}
                        ],
                        //07



                    ]
                }
            }
        ],

        pageSize:'A4',
        pageOrientation:'portrait',

        styles: {
            header: {
                fontSize: 13,
                bold: true,
                alignment:'center',
                margin:8
            },
            table: {
                alignment: 'center',
                fontSize:10
            }
        }
    }

    exports.makePDF= function () {
        var pdfDoc = printer.createPdfKitDocument(documentDefinition);
        pdfDoc.pipe(fs.createWriteStream('C:\\Users\\pc\\Desktop\\15501032\\pdf\\result.pdf'));
        pdfDoc.end();
    }

};




exports.each1 = function (t,c,r) {
   var title = t;
   var content = c;
   var result=r;
    var documentDefinition={
        content:[
            {
                text:'침입탐지 진단',
                bold:true, fontSize:30,  alignment: 'center',margin: [ 10, 10, 10, 30 ],color:'blue'
            },
            {
                style:'table',
                table:{
                    widths:[70,'*'],heights:16,
                    body:[
                        [
                            {text:title,colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:'관리자 계정이 하나만 존재'}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:content,bold:true,alignment:'left',}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:result,bold:true}
                        ],
                    ]
                }
            }
        ],

        pageSize:'A4',
        pageOrientation:'portrait',

        styles: {
            header: {
                fontSize: 13,
                bold: true,
                alignment:'center',
                margin:8
            },
            table: {
                alignment: 'center',
                fontSize:10
            }
        }
    }

    exports.makePDF= function () {
        var pdfDoc = printer.createPdfKitDocument(documentDefinition);
        pdfDoc.pipe(fs.createWriteStream('C:\\Users\\pc\\Desktop\\15501032\\pdf\\result.pdf'));
        pdfDoc.end();
    }

};



