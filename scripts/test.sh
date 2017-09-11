#!/bin/sh

#   Copyright © 2017 Teclib. All rights reserved.
#
# test.sh is part of FlyveMDMAdminDashboard
#
# FlyveMDMAdminDashboard is a subproject of Flyve MDM. Flyve MDM is a mobile
# device management software.
#
# FlyveMDMAdminDashboard is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# FlyveMDMAdminDashboard is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# ------------------------------------------------------------------------------
# @author    Hector Rondon
# @date      25/08/17
# @copyright Copyright © 2017 Teclib. All rights reserved.
# @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
# @link      https://github.com/flyve-mdm/flyve-mdm-ios-admin-dashboard
# @link      https://flyve-mdm.com
# ------------------------------------------------------------------------------

if [[ ("$CIRCLE_BRANCH" == "develop" || "$CIRCLE_BRANCH" == "master") && "$CI_PULL_REQUEST" != "" ]]; then
    fastlane test
elif [[ "$CIRCLE_BRANCH" != "develop" && "$CIRCLE_BRANCH" != "master" && "$CI_PULL_REQUEST" == "" ]]; then
    xcodebuild clean build -project ${APPNAME}.xcodeproj -scheme $APPNAME CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
fi
