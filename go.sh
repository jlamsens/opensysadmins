#!/bin/bash
git add .
git commit -m "changes"
git push
mkdocs gh-deploy --force
