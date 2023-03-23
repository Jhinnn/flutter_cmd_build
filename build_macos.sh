#!/bin/sh
set -v
APPGITHEAD=`git rev-parse --short HEAD`
APPBUILDTIME=`date '+%Y/%m/%d-%H:%M:%S'`
echo $APPGITHEAD
echo $APPBUILDTIME

set -v
APPENTRYPOINT="api.efuntest.link/im"
APP_GIT_HEAD=`git rev-parse --short HEAD`
BUILD_TIMESTAMP=`date '+%Y%m%d%H%M%S'`
ORIGIN_VERSION=`git rev-parse --abbrev-ref HEAD@{upstream}`
COMMIT_COUNT=`git rev-list --count ${ORIGIN_VERSION}`
APP_PRERELEASE_VERSION=${ORIGIN_VERSION:1}
VERSION=`cat VERSION`
APP_VERSION=$VERSION.$COMMIT_COUNT
echo $APP_VERSION

buildcmd="flutter build macos --dart-define=NEEDLOG=0 --dart-define=APPENTRYPOINT="$APPENTRYPOINT" --dart-define=APPGITHEAD="$APPGITHEAD"  --dart-define=APPBUILDTIME="$APPBUILDTIME" --dart-define=APPVERSION="$APP_VERSION" --release"
echo $buildcmd
$buildcmd

