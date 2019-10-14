"use strict";
const {After, Before, Status} = require('cucumber');
const { setDefaultTimeout } = require('cucumber');
const logger = require('../config/logger.config').logger;
setDefaultTimeout(60 * 1000);

After(function (testCase) {
    if (testCase.result.status === Status.FAILED) {
        return browser.takeScreenshot().then((screenShot) => {
            let decodedImage = new Buffer(screenShot, 'base64');    
            return this.attach(decodedImage, 'image/png');
        });
    }
});

Before(function() {
    logger.info('Maximizing browser window');
    browser.ignoreSynchronization = true;
    return browser.manage().window().maximize();
});