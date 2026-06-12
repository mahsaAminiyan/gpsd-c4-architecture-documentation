@echo off
docker run --rm -v "%cd%:/usr/local/structurizr" structurizr/structurizr export -workspace /usr/local/structurizr/c4model/workspace.dsl -format static -output /usr/local/structurizr/site