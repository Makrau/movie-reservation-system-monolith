#!/bin/bash

# Cores para output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
YELLOW='\033[1;33m'

echo -e "${YELLOW}Verificando status do PostgreSQL...${NC}"

# Verifica se o PostgreSQL está rodando
if pg_isready > /dev/null 2>&1; then
    echo -e "${GREEN}PostgreSQL já está rodando${NC}"
else
    echo -e "${YELLOW}Iniciando PostgreSQL...${NC}"
    sudo service postgresql start
    sleep 2
    
    if pg_isready > /dev/null 2>&1; then
        echo -e "${GREEN}PostgreSQL iniciado com sucesso${NC}"
    else
        echo -e "${RED}Erro ao iniciar PostgreSQL${NC}"
        exit 1
    fi
fi

# Verifica se existe algum processo Rails rodando na porta 3000
if lsof -i :3000 > /dev/null 2>&1; then
    echo -e "${YELLOW}Já existe uma aplicação rodando na porta 3000${NC}"
    echo -e "${YELLOW}Deseja encerrar o processo? (s/n)${NC}"
    read response
    if [ "$response" = "s" ]; then
        echo -e "${YELLOW}Encerrando processo...${NC}"
        kill $(lsof -t -i:3000)
        sleep 2
    else
        echo -e "${RED}Abortando inicialização${NC}"
        exit 1
    fi
fi

echo -e "${YELLOW}Iniciando aplicação Rails...${NC}"
./bin/dev