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

When(/^I click "([^"]*)" in "([^"]*)"$/, async (text, alias) => {
    const arrayOfElementTexts = await elementHelper(alias).getText();
    const elementToClickIndex = arrayOfElementTexts.indexOf(text);
    if (elementToClickIndex === -1) {
        throw new Error(`No element with [${text}] text found`);
    }
    logger.info(`Choose "${text}" in "${alias}"`);
    return elementHelper(alias).get(elementToClickIndex).click();
});