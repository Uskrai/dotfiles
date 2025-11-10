#!/bin/sh
git ls-files -z | xargs --null dos2unix
