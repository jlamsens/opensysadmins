#!/bin/bash
git add .
git commit -m "changes"
git push --force
mkdocs gh-deploy
