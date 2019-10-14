"use strict";
const {When} = require('cucumber');
const highlightElement = require('../utils/stepFunctions.js').highlightElement;
const logger = require('../../config/logger.config.js').logger;

When(/^I wait "([^"]*)" seconds$/, (waitTime) => {
    logger.info(`I wait ${waitTime} seconds`);
    return browser.sleep(waitTime * 1000);
});

When(/^I open "([^"]*)" url$/, (url) => {
    logger.info(`I open ${url} url`);
    return browser.get(url);
});

When(/^I highlight "([^"]*)"$/, (alias) => {
    logger.info(`I highlight ${alias}`);
    return highlightElement(alias);
});

When(/^I switch to next tab$/, async () => {
    let currentHandle = await browser.driver.getWindowHandle();
    let arrayOfHandles = await browser.driver.getAllWindowHandles();
    let indexOfCurrentHandle = arrayOfHandles.indexOf(currentHandle);
    let indexOfTabToSwitchTo = ++indexOfCurrentHandle;
    const handleToSwitchTo = arrayOfHandles[indexOfTabToSwitchTo];
    return browser.driver.switchTo().window(handleToSwitchTo);
});