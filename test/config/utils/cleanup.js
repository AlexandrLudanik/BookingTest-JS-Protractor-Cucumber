const fs_extra = require('fs-extra');

fs_extra.emptyDirSync('./reports');
fs_extra.removeSync('./logs.log');