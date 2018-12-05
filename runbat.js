
var cmd=require('node-cmd');

exports.runbat= function (num) {
    var batfile='C:\\Users\\pc\\Desktop\\15501032\\bat\\'+num+'.bat';
    console.log('run : '+batfile);
    cmd.get(
        batfile
    );
}
