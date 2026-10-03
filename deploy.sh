#!/bin/bash
set -e

APP_NAME="testFramework"
SRC_DIR="src/main/java"
WEB_DIR="src/main/webapp"
BUILD_DIR="build"
LIB_DIR="lib"
TOMCAT_WEBAPPS="$HOME/Documents/apache-tomcat-10.1.46/webapps"

CLASSPATH="$LIB_DIR/servlet-api.jar:$LIB_DIR/framework.jar:$LIB_DIR/gson-2.13.2.jar"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/WEB-INF/classes"
mkdir -p "$BUILD_DIR/WEB-INF/lib"

find "$SRC_DIR" -name "*.java" > sources.txt
javac -cp "$CLASSPATH" -d "$BUILD_DIR/WEB-INF/classes" @"sources.txt"
rm -f sources.txt

cp -r "$WEB_DIR"/. "$BUILD_DIR"/
cp "$LIB_DIR"/framework.jar "$BUILD_DIR/WEB-INF/lib/"
cp "$LIB_DIR"/gson-2.13.2.jar "$BUILD_DIR/WEB-INF/lib/"

cd "$BUILD_DIR" || exit 1
jar -cvf "$APP_NAME.war" .
cd - >/dev/null || exit 1

mkdir -p "$TOMCAT_WEBAPPS"
cp -f "$BUILD_DIR/$APP_NAME.war" "$TOMCAT_WEBAPPS/"

echo ""
echo "Déploiement terminé."
echo ""