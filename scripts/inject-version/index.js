const fs = require("fs");

function injectReleaseVersion(pluginConfig, context) {
  const nextVersion = context.nextRelease.version;
  const packageFile = __dirname + '/../../package.json';

  return fs.readFile(packageFile, (err, data) => {
    if (err) {
      return console.error(err);
    }

    let result = data.toString();
    result = result.replace(/0\.0\.0-development/g, nextVersion.toString());

    fs.writeFile(packageFile, result, 'utf8', (err) => {
      if (err) {
        return console.log(err);
      }
    });
  });
}

// noinspection JSUnusedGlobalSymbols
module.exports = {verifyRelease: injectReleaseVersion};
