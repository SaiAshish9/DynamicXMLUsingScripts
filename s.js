const fs = require("fs"),
  PATH = "./s.json",
  data = require(PATH)
  { argv } = require("process"),
  tests_target = argv[2],
  testSuiteApp = argv[3],
  appBundleId = argv[4],
  testSuiteBundleId = argv[5];

data[tests_target] = data["SampleXCUITests"];
delete data["SampleXCUITests"];
data[tests_target][
  "TestHostBundleIdentifier"
] = `${testSuiteBundleId}.xctrunner`;
data[tests_target][
  "UITargetAppPath"
] = `__TESTROOT__/Debug-iphonesimulator/${testSuiteApp}`;
data[tests_target]["ProductModuleName"] = tests_target;
data[tests_target][
  "TestHostPath"
] = `__TESTROOT__/Debug-iphonesimulator/${tests_target}-Runner.app`;
data[tests_target]["BundleIdentifiersForCrashReportEmphasis"][0] = appBundleId;
data[tests_target]["BundleIdentifiersForCrashReportEmphasis"][1] =
  testSuiteBundleId;
data[tests_target][
  "TestBundlePath"
] = `__TESTHOST__/PlugIns/${tests_target}.xctest`;
data[tests_target][
  "DependentProductPaths"
][0] = `__TESTROOT__/Debug-iphonesimulator/${testSuiteApp}`;
data[tests_target][
  "DependentProductPaths"
][1] = `__TESTROOT__/Debug-iphonesimulator/${tests_target}-Runner.app/PlugIns/${tests_target}.xctest`;

fs.writeFile(PATH, JSON.stringify(data), function (err) {
  if (err) throw err;
  console.log("complete");
});
