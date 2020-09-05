# This script should be executed outside repo folder of https://github.com/guikarist/tensorflow-windows-build-script.
Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"

Remove-Item bin -ErrorAction SilentlyContinue -Force -Recurse

$tensorFlowBinDir = "$pwd\bin"
mkdir $tensorFlowBinDir | Out-Null

$tensorFlowSourceDir = "$pwd\source"

# Tensorflow lib and includes
mkdir "$tensorFlowBinDir/tensorflow/lib" | Out-Null
Copy-Item  $tensorFlowSourceDir\bazel-bin\tensorflow\libtensorflow_cc.so.1.15.3 $tensorFlowBinDir\tensorflow\lib\tensorflow_cc.dll
Copy-Item  $tensorFlowSourceDir\bazel-bin\tensorflow\liblibtensorflow_cc.so.1.15.3.ifso $tensorFlowBinDir\tensorflow\lib\tensorflow_cc.lib

# Tensorflow includes
Copy-Item $tensorFlowSourceDir\tensorflow\core $tensorFlowBinDir\include\tensorflow\core -Recurse -Filter "*.h"
Copy-Item $tensorFlowSourceDir\tensorflow\cc $tensorFlowBinDir\include\tensorflow\cc -Recurse -Filter "*.h"

Copy-Item $tensorFlowSourceDir\bazel-genfiles\tensorflow\core $tensorFlowBinDir\include_pb\tensorflow\core -Recurse -Filter "*.h"
Copy-Item $tensorFlowSourceDir\bazel-genfiles\tensorflow\cc $tensorFlowBinDir\include_pb\tensorflow\cc -Recurse -Filter "*.h"

# Protobuf includes.
Copy-Item $tensorFlowSourceDir\bazel-source\external\com_google_protobuf\src\google $tensorFlowBinDir\include_proto\google -Recurse -Filter "*.h" 

# Absl includes.
Copy-Item $tensorFlowSourceDir\bazel-source\external\com_google_absl\absl $tensorFlowBinDir\include_absl\absl -Recurse -Filter "*.h" 

# Eigen includes
Copy-Item $tensorFlowSourceDir\bazel-source\external\eigen_archive\ $tensorFlowBinDir\include_eigen_archive -Recurse
Copy-Item $tensorFlowSourceDir\third_party\eigen3 $tensorFlowBinDir\include_eigen\third_party\eigen3\ -Recurse

#flatbuffer include
#Copy-Item $tfSourceDir\bazel-source\external\flatbuffers\include $tfLibDir\include_flat -Recurse -Filter "*.h"
