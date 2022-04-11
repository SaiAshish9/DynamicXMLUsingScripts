# python3 xcui.py "SampleXCUITests" "Sample iOS.app" "com.bsstack.SampleXCUITests" "com.bsstack.SampleXCUITests"

import json
from sys import argv
 
f = open('xcui.json')
tests_target = argv[1]
testSuiteApp = argv[2]
appBundleId = argv[3]
testSuiteBundleId = argv[4]

data = json.load(f)

data[tests_target] = data['SampleXCUITests']
if 'SampleXCUITests' not in data:
    del data["SampleXCUITests"]
data[tests_target][
  "TestHostBundleIdentifier"
] = f'{testSuiteBundleId}.xctrunner'
data[tests_target][
  "UITargetAppPath"
] = f'__TESTROOT__/Debug-iphonesimulator/{testSuiteApp}'
data[tests_target]["ProductModuleName"] = tests_target
data[tests_target][
  "TestHostPath"
] = f'__TESTROOT__/Debug-iphonesimulator/{tests_target}-Runner.app'
data[tests_target]["BundleIdentifiersForCrashReportEmphasis"][0] = appBundleId
data[tests_target]["BundleIdentifiersForCrashReportEmphasis"][1] = testSuiteBundleId
data[tests_target]["TestBundlePath"] = f'__TESTHOST__/PlugIns/{tests_target}.xctest'
data[tests_target]["DependentProductPaths"][0] = f'__TESTROOT__/Debug-iphonesimulator/{testSuiteApp}'
data[tests_target]["DependentProductPaths"][1] = f'__TESTROOT__/Debug-iphonesimulator/{tests_target}-Runner.app/PlugIns/{tests_target}.xctest'

json_object = json.dumps(data, indent = 4)
with open("xcui-1.json", "w") as outfile:
    outfile.write(json_object)

f.close()
