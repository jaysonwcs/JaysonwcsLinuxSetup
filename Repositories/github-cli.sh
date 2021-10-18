echo -e "${BLUE}Adicionando repositório GitHub CLI${RESET}"
read -p "Pressione [Enter] para continuar:"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
read -p "Pressione [Enter] para continuar:"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
read -p "Pressione [Enter] para continuar:"
echo
