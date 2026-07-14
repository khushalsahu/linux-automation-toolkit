#!/bin/bash

echo "========================================="
echo "         PROJECT SETUP TOOL"
echo "========================================="

echo ""
echo "Enter Project Name:"
read project_name


# Create project directory
mkdir "$project_name"

cd "$project_name"


# Create README.md
echo ""
echo "Do you want to create README.md? (y/n)"
read create_readme

if [ "$create_readme" = "y" ]
then
    touch README.md
fi


# Create .gitignore
echo ""
echo "Do you want to create .gitignore? (y/n)"
read create_gitignore

if [ "$create_gitignore" = "y" ]
then
    touch .gitignore
fi


# Create src folder
echo ""
echo "Do you want to create a src folder? (y/n)"
read create_src

if [ "$create_src" = "y" ]
then
    mkdir src
fi


# Create docs folder
echo ""
echo "Do you want to create a docs folder? (y/n)"
read create_docs

if [ "$create_docs" = "y" ]
then
    mkdir docs
fi


# Initialize Git repository
echo ""
echo "Do you want to initialize Git? (y/n)"
read initialize_git

if [ "$initialize_git" = "y" ]
then
    git init
fi


echo ""
echo "Project created successfully!"

echo ""
echo "Project Structure:"
ls -la

echo ""
echo "========================================="
echo "       PROJECT SETUP COMPLETED"
echo "========================================="
