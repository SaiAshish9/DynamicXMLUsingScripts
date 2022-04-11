#!/bin/bash

# SampleXCUITests
Tests_Target="Tests_Target"
# Sample iOS.app
TestSuiteAppName="TestSuite AppName.app"
# com.browserstack.Sample-iOS
OriginalAppBundleId="com.abc"
# com.bsstack.SampleXCUITests
TestSuiteAppBundleId="com.pqr"

# sed -i 's/SampleXCUITests/$Tests_Target/g' s.json
# sed -i 's/Sample iOS.app/$TestSuiteAppName/g' s.json
# sed -i 's/com.browserstack.Sample-iOS/$OriginalAppBundleId/g' s.json
# sed -i 's/com.browserstack.Sample-iOS/$TestSuiteAppBundleId/g' s.json

node s.js "$Tests_Target" "$TestSuiteAppName" "$OriginalAppBundleId" "$TestSuiteAppBundleId"