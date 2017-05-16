'use strict';
const fs = require('fs');
let child_process = require('child_process');

fs.readdir('./client/scripts/ui/components', function(error, files) {
	if (error) {
		console.log(error);
	}
	files.forEach(function(file) {
		if (file.split('.').length === 1) {
			let camelCase = toCamelCase(file) + 'Component';
      let base = toCamelCase(file) + 'BaseComponent';
			let skeletonProcess = child_process.exec(`bash skeleton.sh ${camelCase} ${file} ${base}`, { maxBuffer: 1024 * 10000 }, function(error, stdout, stderr) {});
      skeletonProcess.stdout.on('data', (data) => {
          console.log(data);
      });

      skeletonProcess.stderr.on('data', (data) => {
          console.log(data);
      });

      skeletonProcess.stdout.on('close', (code) => {
          // console.log();
      });
		}
	});
});

function toCamelCase(str) {
  let splitString = str.split('-');
  let completed = [];
  splitString.forEach(function(aStr) {
    let arr = aStr.split('');
    let first = arr.shift();
    first = first.toUpperCase();
    arr.unshift(first);
    let finalStr = arr.join('');
    completed.push(finalStr);
  });
  let fun = completed.join('');
  return fun;
}