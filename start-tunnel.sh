#!/usr/bin/env bash
# Start fxtun so Webflow can load main.js from https://astralis.fxtun.dev
# Run this when you start working; ensure Live Server (or similar) is on port 5500.
fxtun http 5500 --domain astralis
