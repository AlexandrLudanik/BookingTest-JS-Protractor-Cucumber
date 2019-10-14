"use strict";
const { When } = require('cucumber');
const elementHelper = require('../utils/stepFunctions.js').getPageObjectElement;
const logger = require('../../config/logger.config.js').logger;

When(/^I click "([^"]*)"$/, (alias) => {
    logger.info(`I click "${alias}"`);
    return elementHelper(alias).click();
});

When(/^I type text "([^"]*)" to "([^"]*)"$/, async (text, alias) => {
    logger.info(`Type text "${text}" in "${alias}"`);
    return await elementHelper(alias).sendKeys(text);
});