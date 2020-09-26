# dependency_build_configuration
Custom build configuration for dependent projects

In case your main project has some dependent projects ( which usually only have DEBUG & RELEASE configurations ) and is using custom build configurations ex "Beta".
This will lead to linking error (where main project expects frameworks to be under "Beta-iphones/" directory, but dependent projects (since they do not have Beta configuration) will output at "Release-iphones" (or Debug-iphones). 

Adding configurations to dependent projects is not very convenient, we also do not want complex project setup. This script will simply copy output from one default direactory to current configuration directory, thus linking phase will be satisfied.
