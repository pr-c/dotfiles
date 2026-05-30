#!/bin/bash
hyprctl keyword, workspace="$(hyprctl activeworkspace -j | jq .id)", layout:master
