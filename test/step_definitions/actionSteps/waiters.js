"use strict";
let { When } = require('cucumber');
const elementHelper = require('../utils/stepFunctions.js').getPageObjectElement;
const stepFunctions = require('../utils/stepFunctions.js');
const logger = require('../../config/logger.config.js').logger;

const CLICKABLE_TIMEOUT = 5000;

When(/^I wait until "([^"]*)" is (present|clickable|visible|invisible|selected|gone)$/, (alias, shouldBe) => {
    let element = elementHelper(alias);
    let expectedConditionFunction = stepFunctions.expectedCondition(shouldBe);
    logger.info(`I wait until "${alias}" is ${shouldBe}`);
    return browser.wait(expectedConditionFunction(element), CLICKABLE_TIMEOUT);
});