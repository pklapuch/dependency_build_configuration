# Dependency project(s) have their own Build Configuration(s) and by default they are: DEBUG and RELEASE
# Main project however defines additional Build Configurations, ex "Beta" which leads to linking issues
# Solution is to manually copy dependent project(s) ouputs to current configuration build directory

# $0 - Build Configuration (ex DEBUG, RELEASE, etc)
# $1 - Framework name
# $2 - SwiftModule name
function copy_files {

    COPY_LIB_FROM_PATH="$BUILT_PRODUCTS_DIR/../$1-$PLATFORM_NAME/$2"
    COPY_MODULE_FROM_PATH="$BUILT_PRODUCTS_DIR/../$1-$PLATFORM_NAME/$3"
    
    if [ -f "$COPY_LIB_FROM_PATH" ]; then
        echo "copy: $COPY_LIB_FROM_PATH to $BUILT_PRODUCTS_DIR"
        cp "$COPY_LIB_FROM_PATH" "$BUILT_PRODUCTS_DIR"
    fi
    
    if [ -d "$COPY_MODULE_FROM_PATH" ]; then
        echo "copy: $COPY_MODULE_FROM_PATH to $BUILT_PRODUCTS_DIR"
        cp -r "$COPY_MODULE_FROM_PATH" "$BUILT_PRODUCTS_DIR"
    fi
}

if [ "$CONFIGURATION" = "Beta" ]; then
    
    echo "DependencyBuildConfig: start"
    
    # Example of current configuration build path  (COPY FROM)
    # BUILT_PRODUCTS_DIR:
    # .../Build/Products/Beta-iphoneos
    
    # Example of dependent project build path (COPY TO)
    # BUILT_PRODUCTS_DIR:
    # .../Build/Products/Release-iphoneos
    
    copy_files "Debug" "libLocationTracking.a" "LocationTracking.swiftmodule"
    copy_files "Release" "libLocationTracking.a" "LocationTracking.swiftmodule"
    
    echo "DependencyBuildConfig: end"
else
    echo "DependencyBuildConfig: skip / end"
fi