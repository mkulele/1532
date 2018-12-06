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

exports.all = function (t,c,r) {
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
                            {text:t[0],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[1]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[0],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[0],bold:true}
                        ],
                        //01
                        [
                            {text:t[2],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[3]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[1],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[1],bold:true}
                        ],
                        //02
                        [
                            {text:t[4],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[5]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[2],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[2],bold:true}
                        ],
                        //03
                        [
                            {text:t[6],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[7]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[3],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[3],bold:true}
                        ],
                        //04
                        [
                            {text:t[8],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[9]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[4],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[4],bold:true}
                        ],
                        //05
                        [
                            {text:t[10],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[11]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[5],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[5],bold:true}
                        ],
                        //06
                        [
                            {text:t[12],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[13]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[6],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[6],bold:true}
                        ],
                        //07
                        [
                            {text:t[14],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[15]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[7],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[7],bold:true}
                        ],
                        //08
                        [
                            {text:t[16],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[17]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[8],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[8],bold:true}
                        ],
                        //09
                        [
                            {text:t[18],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[19]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[9],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[9],bold:true}
                        ],
                        //10
                        [
                            {text:t[20],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[21]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[10],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[10],bold:true}
                        ],
                        //11
                        [
                            {text:t[22],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[23]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[11],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[11],bold:true}
                        ],
                        //12
                        [
                            {text:t[24],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[25]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[12],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[12],bold:true}
                        ],
                        //13
                        [
                            {text:t[26],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[27]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[13],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[13],bold:true}
                        ],
                        //14
                        [
                            {text:t[28],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[29]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[14],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[14],bold:true}
                        ],
                        //15
                        [
                            {text:t[30],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[31]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[15],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[15],bold:true}
                        ],
                        //16
                        [
                            {text:t[32],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[33]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[16],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[16],bold:true}
                        ],
                        //17
                        [
                            {text:t[34],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[35]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[17],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[17],bold:true}
                        ],
                        //18
                        [
                            {text:t[36],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[37]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[18],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[18],bold:true}
                        ],
                        //19




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


exports.all819 = function (t,c,r) {
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
                            {text:t[0],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[1]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[0],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[0],bold:true}
                        ],
                        //08
                        [
                            {text:t[2],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[3]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[1],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[1],bold:true}
                        ],
                        //09
                        [
                            {text:t[4],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[5]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[2],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[2],bold:true}
                        ],
                        //10
                        [
                            {text:t[6],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[7]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[3],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[3],bold:true}
                        ],
                        //11
                        [
                            {text:t[8],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[9]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[4],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[4],bold:true}
                        ],
                        //12
                        [
                            {text:t[10],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[11]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[5],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[5],bold:true}
                        ],
                        //13
                        [
                            {text:t[12],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[13]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[6],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[6],bold:true}
                        ],
                        //14
                        [
                            {text:t[14],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[15]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[7],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[7],bold:true}
                        ],
                        //15
                        [
                            {text:t[16],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[17]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[8],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[8],bold:true}
                        ],
                        //16
                        [
                            {text:t[18],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[19]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[9],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[9],bold:true}
                        ],
                        //17
                        [
                            {text:t[20],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[21]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[10],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[10],bold:true}
                        ],
                        //18
                        [
                            {text:t[22],colSpan:'2',style:'header'},''
                        ],
                        [
                            {text:'양호 기준',bold:true,fontSize:11},{text:t[23]}
                        ],
                        [
                            {text:'진단 현황',bold:true,fontSize:11},{text:c[11],alignment:'left'}
                        ],
                        [
                            {text:'진단 결과',bold:true,fontSize:11},{text:r[11],bold:true}
                        ],
                        //19




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




exports.each = function (t,c,r) {
   var title = t[0];
   var base=t[1];
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
                            {text:'양호 기준',bold:true,fontSize:11},{text:base}
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



